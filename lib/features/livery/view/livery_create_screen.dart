import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:livery/Cmodel/enum.dart';
import 'package:livery/Cwidgets/ww_buttons.dart';
import 'package:livery/Cwidgets/ww_popup_error_success.dart';
import 'package:livery/Cwidgets/ww_textfield.dart';
import 'package:livery/features/livery/application/livery_bloc.dart';
import 'package:livery/features/livery/livery_model/livery_model.dart';
import 'package:livery/utils/app_size.dart';

@RoutePage()
class LiveryCreateScreen extends StatelessWidget {
  const LiveryCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LiveryBloc>();

    return Scaffold(
      appBar: AppBar(title: Text('Post Livery')),
      body: Padding(
        padding: AppSize.swPadding,
        child: Column(
          spacing: 20,
          children: [
            WWTextField(
              controller: TextEditingController(),
              hintText: 'Enter Livery name',
            ),

            WWTextFieldTextArea(
              controller: TextEditingController(),
              hintText: 'Livery Description',
            ),

            // SUBMIT BUTTON----------------------------------
            _SubmitButton(bloc: bloc, data: LiveryModel()),
          ],
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
          (context, state) => WWButton(
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
    );
  }
}
