import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:livery/Cmodel/api_response.dart';
import 'package:livery/Cmodel/enum.dart';
import 'package:livery/Cmodel/image_picker_model/image_picker_model.dart';
import 'package:livery/Cwidgets/pop_up_dialogue/ww_dialogue_box.dart';
import 'package:livery/Cwidgets/ww_app_bar.dart';
import 'package:livery/Cwidgets/ww_buttons.dart';
import 'package:livery/Cwidgets/ww_dashed_border.dart';
import 'package:livery/Cwidgets/ww_popup_error_success.dart';
import 'package:livery/Cwidgets/ww_text.dart';
import 'package:livery/Cwidgets/ww_textfield/ww_text_field.dart';
import 'package:livery/features/advertisement/advertisement_bloc.dart';
import 'package:livery/features/livery/application/livery_bloc.dart';
import 'package:livery/features/livery_create/application/livery_create_bloc.dart';
import 'package:livery/features/livery_create/widget/bus_type_dropdown.dart';
import 'package:livery/features/livery/model/livery_model/livery_model.dart';
import 'package:livery/utils/app_size.dart';
import 'package:livery/utils/di/injection.dart';
import 'package:livery/utils/extensions.dart';
import 'package:livery/utils/styles.dart';
import 'package:livery/utils/toast.dart';

@RoutePage()
class LiveryCreateScreen extends StatelessWidget implements AutoRouteWrapper {
  final LiveryModel? data;
  const LiveryCreateScreen({super.key, this.data});

  @override
  Widget wrappedRoute(BuildContext ctx) {
    return BlocProvider(
      create:
          (ctx) =>
              getIt<LiveryCreateBloc>()
                ..add(GetBusTypeApiEvent())
                ..addIf(data != null, LiveryAssignValuesEvent(data: data)),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LiveryCreateBloc>();
    final adsBloc = context.read<AdvertisementBloc>();

    return Scaffold(
      appBar: WwAppBar(title: 'Create Livery'),
      bottomNavigationBar: _SubmitButton(
        bloc: bloc,
        data: data,
      ), // SUBMIT BUTTON----------------------------------
      body: Padding(
        padding: AppSize.swPadding,
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Form(
            key: bloc.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 15,
              children: [
                if (data == null) ...[
                  WwText(text: 'Upload Image', style: normalText()),
                  _ImagePicker(), // IMAGE PICKER -------------------------------------
                ],
                WWTextField(
                  title: 'Name',
                  controller: bloc.liveryName,
                  validator: (v) {
                    if (v?.isEmpty ?? true) {
                      return '';
                    }
                    return null;
                  },
                ),
                //
                BlocSelector<AdvertisementBloc, AdvertisementState, bool>(
                  selector: (state) {
                    return state.isRewardVideoAdViewed;
                  },
                  builder: (context, adViewed) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: adViewed ? Colors.green : Colors.red,
                        ),
                        AppSize.sizedBox2w,
                        WwText(
                          text:
                              adViewed
                                  ? 'Ready to post your livery!'
                                  : 'View an ad to post a livery.',
                          style: normalText(),
                        ),
                        AppSize.sizedBox2w,
                        WWButton(
                          text: adViewed ? 'Ad Viewed' : 'Click Here',
                          onPressed: () {
                            if (!adViewed) {
                              adsBloc.add(ShowRewardVideoAdEvent());
                            }
                          },
                        ),
                      ],
                    );
                  },
                ),
                //
                _BusTypeChoose(
                  bloc: bloc,
                  data: data,
                ), // CHOOSE BUS MODEL ----------------
                WWTextFieldTextArea(
                  title: 'Description',
                  controller: bloc.description,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BusTypeChoose extends StatelessWidget {
  final LiveryModel? data;
  const _BusTypeChoose({required this.bloc, required this.data});

  final LiveryCreateBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        Flexible(
          child: BusTypeDropDown(
            title: 'Bus Type',
            selectedItem: data?.busType ?? '',
            onChanged: (v) {
              bloc.busType = v?.busType ?? '';
              bloc.busModel = v?.busModels?.first ?? '';
              bloc.add(StoreBusModelEvent(busModels: v?.busModels ?? []));
            },
            validator: (v) {
              if (bloc.busType.isEmpty) {
                return '';
              }
              return null;
            },
          ),
        ),
        Flexible(
          child: BusModelsDropDown(
            title: 'Bus Model',
            selectedItem: data?.busModel ?? '',
            onChanged: (v) => bloc.busModel = v ?? '',
            validator: (v) {
              if (bloc.busModel.isEmpty) {
                return '';
              }
              return null;
            },
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
          bloc.add(LiveryImageStore());
        },
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          padding: EdgeInsets.all(10.0),
          child: AspectRatio(
            aspectRatio: 1 / 1,
            child: BlocSelector<
              LiveryCreateBloc,
              LiveryCreateState,
              ApiResponse<ImagePickerModel>?
            >(
              selector: (state) {
                return state.storeImage;
              },
              builder: (context, state) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    if (state?.status == ApiStatus.initial)
                      Icon(
                        Icons.filter_none_rounded,
                        size: 40,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    if (state?.status == ApiStatus.loading)
                      const CircularProgressIndicator(),
                    if (state?.status == ApiStatus.success &&
                        state?.apiData?.imageUint8List != null)
                      Image.memory(
                        state!.apiData!.imageUint8List!,
                        fit: BoxFit.contain,
                      ),
                  ],
                );
              },
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
      buildWhen:
          (p, c) =>
              p.liveryCreateRes.status != c.liveryCreateRes.status ||
              p.storeImage != c.storeImage, // for image state update
      listenWhen:
          (p, c) => p.liveryCreateRes.status != c.liveryCreateRes.status,
      listener: (context, state) {
        if (state.liveryCreateRes.status == ApiStatus.failure) {
          wwDialogueBox(context, textSub: state.liveryCreateRes.errorMessage);
        }
        if (state.liveryCreateRes.status == ApiStatus.success) {
          showSuccessToast(message: 'Livery Created Successfully');
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
                text: data != null ? 'Update' : 'Submit',
                onPressed: () {
                  if (bloc.formKey.currentState?.validate() == false) {
                    return;
                  }

                  if (state.storeImage?.apiData?.imageUint8List == null) {
                    failureToast('Kindly select a livery to continue.');
                    return;
                  }

                  final adBloc = context.read<AdvertisementBloc>();
                  if (!adBloc.state.isRewardVideoAdViewed) {
                    failureToast(
                      'Please watch a video ad to post your livery.',
                    );
                    return;
                  }

                  // Generate a unique upload ID
                  final uploadId =
                      DateTime.now().millisecondsSinceEpoch.toString();

                  // Tell the LiveryBloc that an upload is starting
                  context.read<LiveryBloc>().add(
                    StartUploadEvent(uploadId: uploadId),
                  );

                  // Navigate back to the main screen immediately
                  context.router.back();

                  // Show a temporary toast
                  showSuccessToast(message: 'Your livery is uploading...');

                  // RESETING REWARD VIDEO AD
                  context.read<AdvertisementBloc>().add(
                    StoreRewardVideoAd(isRewardViewed: false),
                  );

                  bloc.add(
                    CreateLiveryApiEvent(
                      uploadId: uploadId, // Pass the upload ID
                      liveryId: bloc.liveryId,
                      data: FormData.fromMap({
                        if (bloc.liveryId != null) 'livery_id': bloc.liveryId,
                        if (bloc.liveryName.text.isNotEmpty)
                          'livery_name': bloc.liveryName.text,
                        if (bloc.description.text.isNotEmpty)
                          'description': bloc.description.text,
                        if (bloc.busType.isNotEmpty) 'bus_type': bloc.busType,
                        if (bloc.busModel.isNotEmpty)
                          'bus_model': bloc.busModel,
                        if (state.storeImage?.apiData?.imageUint8List != null)
                          'livery_image': MultipartFile.fromBytes(
                            state.storeImage!.apiData!.imageUint8List!,
                            filename:
                                state.storeImage!.apiData!.fileName ??
                                'image.jpg',
                          ),
                        if (state.storeImage?.apiData?.imageUint8List1080 !=
                            null)
                          'livery_image_1080': MultipartFile.fromBytes(
                            state.storeImage!.apiData!.imageUint8List1080!,
                            filename:
                                state.storeImage!.apiData!.fileName ??
                                'image_1080.jpg',
                          ),
                        if (state.storeImage?.apiData?.imageUint8List600 !=
                            null)
                          'livery_image_600': MultipartFile.fromBytes(
                            state.storeImage!.apiData!.imageUint8List600!,
                            filename:
                                state.storeImage!.apiData!.fileName ??
                                'image_600.jpg',
                          ),
                        if (state.storeImage?.apiData?.imageUint8List200 !=
                            null)
                          'livery_image_200': MultipartFile.fromBytes(
                            state.storeImage!.apiData!.imageUint8List200!,
                            filename:
                                state.storeImage!.apiData!.fileName ??
                                'image_200.jpg',
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
