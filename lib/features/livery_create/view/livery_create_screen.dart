import 'dart:typed_data';
import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:livery/Cmodel/enum.dart';
import 'package:livery/Cwidgets/ww_app_bar.dart';
import 'package:livery/Cwidgets/ww_buttons.dart';
import 'package:livery/Cwidgets/ww_dashed_border.dart';
import 'package:livery/Cwidgets/ww_popup_error_success.dart';
import 'package:livery/Cwidgets/ww_text.dart';
import 'package:livery/Cwidgets/ww_textfield.dart';
import 'package:livery/features/livery/model/livery_model/livery_model.dart';
import 'package:livery/features/livery_create/application/livery_create_bloc.dart';
import 'package:livery/features/livery_create/widget/bus_type_dropdown.dart';
import 'package:livery/service/image_picker_service.dart';
import 'package:livery/utils/app_size.dart';
import 'package:livery/utils/di/injection.dart';
import 'package:livery/utils/styles.dart';

@RoutePage()
class LiveryCreateScreen extends StatelessWidget implements AutoRouteWrapper {
  const LiveryCreateScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext ctx) {
    return BlocProvider(
      create: (ctx) => getIt<LiveryCreateBloc>()..add(GetBusTypeApiEvent()),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LiveryCreateBloc>();

    return Scaffold(
      appBar: WwAppBar(title: 'Create Livery'),
      bottomNavigationBar: _SubmitButton(
        bloc: bloc,
        data: LiveryModel(),
      ), // SUBMIT BUTTON----------------------------------
      body: Padding(
        padding: AppSize.swPadding,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 15,
            children: [
              WwText(text: 'Upload Image', style: normalText(context)),
              _ImagePicker(), // IMAGE PICKER -------------------------------------
              WWTextField(title: 'Name', controller: bloc.liveryName),
              _BusTypeChoose(bloc: bloc), // CHOOSE BUS MODEL ----------------
              WWTextFieldTextArea(
                title: 'Description',
                controller: bloc.description,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BusTypeChoose extends StatelessWidget {
  const _BusTypeChoose({required this.bloc});

  final LiveryCreateBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        Flexible(
          child: BusTypeDropDown(
            title: 'Bus Type',
            selectedItem: '',
            onChanged: (v) {
              bloc.busType = v?.busType ?? '';
              bloc.add(StoreBusModelEvent(busModels: v?.busModels ?? []));
            },
          ),
        ),
        Flexible(
          child: BusModelsDropDown(
            title: 'Bus Model',
            onChanged: (v) => bloc.busModel = v ?? '',
          ),
        ),
      ],
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
      child: InkWell(
        onTap: () async {
          final bloc = context.read<LiveryCreateBloc>();
          final selectedImage = await ImagePickerService.imagePicker();
          bloc.add(LiveryCreateStore(image: selectedImage));
        },
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          padding: EdgeInsets.all(10.0),
          child: AspectRatio(
            aspectRatio: 1 / 1,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  Icons.filter_none_rounded,
                  size: 40,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
                BlocSelector<LiveryCreateBloc, LiveryCreateState, Uint8List?>(
                  selector: (state) {
                    return state.storeImage?.imageUint8List1080;
                  },
                  builder: (context, image) {
                    return image == null
                        ? SizedBox()
                        : Image.memory(image, fit: BoxFit.contain);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({required this.bloc, required this.data});

  final LiveryCreateBloc bloc;
  final LiveryModel? data;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LiveryCreateBloc, LiveryCreateState>(
      buildWhen: (p, c) => p.liveryCreateRes.status != c.liveryCreateRes.status,
      listenWhen:
          (p, c) => p.liveryCreateRes.status != c.liveryCreateRes.status,
      listener: (context, state) {
        if (state.liveryCreateRes.status == ApiStatus.failure) {
          wwDialogueBox(context, textSub: state.liveryCreateRes.errorMessage);
        }
        if (state.liveryCreateRes.status == ApiStatus.success) {
          showSuccessToast(message: 'Livery Created Successfully');
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
                  bloc.add(
                    CreateLiveryApiEvent(
                      data: FormData.fromMap({
                        if (bloc.liveryName.text.isNotEmpty)
                          'livery_name': bloc.liveryName.text,
                        if (bloc.description.text.isNotEmpty)
                          'description': bloc.description.text,
                        if (bloc.busType.isNotEmpty) 'bus_type': bloc.busType,
                        if (bloc.busModel.isNotEmpty)
                          'bus_model': bloc.busModel,
                        if (state.storeImage?.imageUint8List != null)
                          'livery_image': MultipartFile.fromBytes(
                            state.storeImage!.imageUint8List!,
                            filename: state.storeImage!.fileName ?? 'image.jpg',
                          ),
                        if (state.storeImage?.imageUint8List1080 != null)
                          'livery_image_1080': MultipartFile.fromBytes(
                            state.storeImage!.imageUint8List1080!,
                            filename:
                                state.storeImage!.fileName ?? 'image_1080.jpg',
                          ),
                        if (state.storeImage?.imageUint8List600 != null)
                          'livery_image_600': MultipartFile.fromBytes(
                            state.storeImage!.imageUint8List600!,
                            filename:
                                state.storeImage!.fileName ?? 'image_600.jpg',
                          ),
                        if (state.storeImage?.imageUint8List200 != null)
                          'livery_image_200': MultipartFile.fromBytes(
                            state.storeImage!.imageUint8List200!,
                            filename:
                                state.storeImage!.fileName ?? 'image_200.jpg',
                          ),
                      }),
                    ),
                  );
                },
              ),
            ),
          ),
    );
  }
}
