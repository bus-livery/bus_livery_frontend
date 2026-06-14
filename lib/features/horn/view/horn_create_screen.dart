import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:livery/Cmodel/enum.dart';
import 'package:livery/Cwidgets/pop_up_dialogue/ww_dialogue_box.dart';
import 'package:livery/Cwidgets/ww_app_bar.dart';
import 'package:livery/Cwidgets/ww_buttons.dart';
import 'package:livery/Cwidgets/ww_dashed_border.dart';
import 'package:livery/Cwidgets/ww_popup_error_success.dart';
import 'package:livery/Cwidgets/ww_text.dart';
import 'package:livery/Cwidgets/ww_textfield/ww_text_field.dart';
import 'package:livery/features/horn/application/horn_bloc.dart';
import 'package:livery/utils/app_size.dart';
import 'package:livery/utils/styles.dart';
import 'package:livery/utils/toast.dart';

@RoutePage()
class HornCreateScreen extends StatefulWidget {
  const HornCreateScreen({super.key});

  @override
  State<HornCreateScreen> createState() => _HornCreateScreenState();
}

class _HornCreateScreenState extends State<HornCreateScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  String? _selectedFilePath;
  String? _selectedFileName;
  int? _selectedFileSize;

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _pickAudio() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['mp3', 'wav'],
      );

      if (result != null && result.files.single.path != null) {
        final file = File(result.files.single.path!);
        final size = await file.length();

        // 2MB size limit validation in frontend
        if (size > 2 * 1024 * 1024) {
          failureToast('Audio file size exceeds the 2 MB limit');
          return;
        }

        setState(() {
          _selectedFilePath = result.files.single.path;
          _selectedFileName = result.files.single.name;
          _selectedFileSize = size;
        });
      }
    } catch (e) {
      failureToast('Failed to pick audio file');
    }
  }

  void _clearAudio() {
    setState(() {
      _selectedFilePath = null;
      _selectedFileName = null;
      _selectedFileSize = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WwAppBar(title: 'Create Horn'),
      body: Padding(
        padding: AppSize.swPadding,
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WwText(text: 'Upload Audio (MP3 or WAV)', style: normalText()),
                AppSize.sizedBox2h,

                // Audio Picker Dashed Box
                DashedBorderContainer(
                  dashWidth: 10.0,
                  dashSpace: 5.0,
                  borderRadius: 8.0,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  child: InkWell(
                    onTap: _selectedFilePath == null ? _pickAudio : null,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 20.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (_selectedFilePath == null) ...[
                            Icon(
                              Icons.audiotrack_outlined,
                              size: 48.sp,
                              color: Theme.of(context).colorScheme.onPrimaryContainer,
                            ),
                            AppSize.sizedBox2h,
                            WwText(
                              text: 'Select MP3 or WAV (Max 2MB, 15s)',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                                  ),
                            ),
                          ] else ...[
                            Icon(
                              Icons.check_circle_outline,
                              size: 48.sp,
                              color: Colors.green,
                            ),
                            AppSize.sizedBox2h,
                            WwText(
                              text: _selectedFileName ?? 'Selected File',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            if (_selectedFileSize != null) ...[
                              SizedBox(height: 4.h),
                              WwText(
                                text: '${(_selectedFileSize! / (1024 * 1024)).toStringAsFixed(2)} MB',
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                                    ),
                              ),
                            ],
                            AppSize.sizedBox2h,
                            TextButton.icon(
                              onPressed: _clearAudio,
                              icon: const Icon(Icons.delete_outline, color: Colors.red),
                              label: const Text('Remove', style: TextStyle(color: Colors.red)),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
                AppSize.sizedBox3h,

                // Form Fields
                WWTextField(
                  title: 'Title',
                  controller: _titleController,
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
                AppSize.sizedBox3h,

                WWTextFieldTextArea(
                  title: 'Description',
                  controller: _descriptionController,
                ),
                AppSize.sizedBox4h,

                // Submit Button
                BlocConsumer<HornBloc, HornState>(
                  listenWhen: (p, c) => p.hornCreateRes.status != c.hornCreateRes.status,
                  listener: (context, state) {
                    if (state.hornCreateRes.status == ApiStatus.failure) {
                      wwDialogueBox(
                        context,
                        textSub: state.hornCreateRes.errorMessage ?? 'Submission failed',
                      );
                    }
                    if (state.hornCreateRes.status == ApiStatus.success) {
                      showSuccessToast(message: 'Horn submitted for approval successfully!');
                      // Refresh the feeds
                      context.read<HornBloc>().add(FetchAllHornsApiEvent());
                      context.read<HornBloc>().add(FetchMyHornsApiEvent());
                      context.router.maybePop();
                    }
                  },
                  builder: (context, state) {
                    final isLoading = state.hornCreateRes.status == ApiStatus.loading;

                    return WWButton(
                      expandFlex: 0,
                      loader: isLoading,
                      widthFull: true,
                      text: 'Submit',
                      onPressed: () async {
                        if (_formKey.currentState?.validate() == false) {
                          return;
                        }

                        if (_selectedFilePath == null) {
                          failureToast('Please select an audio file to continue.');
                          return;
                        }

                        final hornBloc = context.read<HornBloc>();

                        final audioFile = await MultipartFile.fromFile(
                          _selectedFilePath!,
                          filename: _selectedFileName,
                        );

                        final formData = FormData.fromMap({
                          'title': _titleController.text.trim(),
                          'description': _descriptionController.text.trim(),
                          'horn_audio': audioFile,
                        });

                        hornBloc.add(
                          CreateHornApiEvent(data: formData),
                        );
                      },
                    );
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
