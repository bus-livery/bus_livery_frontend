import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:livery/Cmodel/enum.dart';
import 'package:livery/Cwidgets/ww_buttons.dart';
import 'package:livery/Cwidgets/ww_dashed_border.dart';
import 'package:livery/Cwidgets/ww_popup_error_success.dart';
import 'package:livery/Cwidgets/ww_text.dart';
import 'package:livery/Cwidgets/ww_textfield.dart';
import 'package:livery/features/livery/application/livery_bloc.dart';
import 'package:livery/features/livery/model/livery_model/livery_model.dart';
import 'package:livery/features/livery/view/bus_type_dropdown.dart';
import 'package:livery/utils/app_size.dart';
import 'package:livery/utils/styles.dart';

@RoutePage()
class LiveryCreateScreen extends StatelessWidget implements AutoRouteWrapper {
  const LiveryCreateScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext ctx) {
    return BlocProvider.value(
      value: BlocProvider.of<LiveryBloc>(ctx)..add(GetBusTypeApiEvent()),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LiveryBloc>();

    return Scaffold(
      appBar: AppBar(title: Text('Post Livery', style: normalText(context))),
      bottomNavigationBar: _SubmitButton(bloc: bloc, data: LiveryModel()),
      // SUBMIT BUTTON----------------------------------
      body: Padding(
        padding: AppSize.swPadding,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 15,
            children: [
              WwText(text: 'Upload Image', style: normalText(context)),
              _ImagePicker(),
              WWTextField(title: 'Name', controller: TextEditingController()),
              Row(
                spacing: 10,
                children: [
                  Flexible(
                    child: BusTypeDropDown(
                      title: 'Bus Type',
                      selectedItem: '',
                      onChanged: (v) {
                        bloc.add(
                          StoreBusModelEvent(busModels: v?.busModels ?? []),
                        );
                      },
                    ),
                  ),
                  Flexible(
                    child: BusModelsDropDown(
                      title: 'Bus Model',
                      onChanged: (v) {},
                    ),
                  ),
                ],
              ),
              WWTextFieldTextArea(
                title: 'Description',
                controller: TextEditingController(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ImagePicker extends StatelessWidget {
  const _ImagePicker();

  @override
  Widget build(BuildContext context) {
    return DashedBorderContainer(
      dashWidth: 10.0,
      dashSpace: 5.0,
      borderRadius: 8.0,
      color: Theme.of(context).colorScheme.onPrimaryContainer,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: EdgeInsets.all(10.0),
        child: AspectRatio(
          aspectRatio: 2 / 1,
          child: Icon(
            Icons.filter_none_rounded,
            size: 40,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({required this.bloc, required this.data});

  final LiveryBloc bloc;
  final LiveryModel? data;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LiveryBloc, LiveryState>(
      buildWhen: (p, c) => p.liveryCreateRes.status != c.liveryCreateRes.status,
      listenWhen:
          (p, c) => p.liveryCreateRes.status != c.liveryCreateRes.status,
      listener: (context, state) {
        if (state.liveryCreateRes.status == ApiStatus.failure) {
          wwDialogueBox(context, textSub: state.liveryCreateRes.errorMessage);
        }
        if (state.liveryCreateRes.status == ApiStatus.success) {
          showSuccessToast();
          context.router.back();
        }
      },
      builder:
          (context, state) => SafeArea(
            child: Padding(
              padding: AppSize.swPadding,
              child: WWButton(
                expandFlex: 0,
                loader: state.liveryCreateRes.status == ApiStatus.loading,
                widthFull: true,
                text: 'Submit',
                onPressed: () {
                  // bloc.add(
                  //   UpdateMyProfileEvent(
                  //     data: data?.profileToApi() ?? ProfileModel(),
                  //   ),
                  // );
                },
              ),
            ),
          ),
    );
  }
}
