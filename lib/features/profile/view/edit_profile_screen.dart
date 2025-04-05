import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:livery/Cmodel/enum.dart';
import 'package:livery/Cwidgets/pop_up_dialogue/ww_dialogue_box.dart';
import 'package:livery/Cwidgets/ww_app_bar.dart';
import 'package:livery/Cwidgets/ww_buttons.dart';
import 'package:livery/Cwidgets/ww_popup_error_success.dart';
import 'package:livery/Cwidgets/ww_textfield/ww_text_field.dart';
import 'package:livery/features/profile/application/profile_bloc.dart';
import 'package:livery/features/profile/model/profile_model.dart';
import 'package:livery/utils/app_size.dart';

@RoutePage()
class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProfileBloc>();
    final data = bloc.state.getProfileRes.apiData;
    return Scaffold(
      appBar: WwAppBar(title: 'Edit Profile'),
      body: Padding(
        padding: AppSize.swPadding,
        child: Column(
          spacing: 20,
          children: [
            WWTextField(controller: data?.usernameCtr, title: 'Username'),
            WwTextFieldPhone(
              controller: data?.phoneNoCtr,
              title: 'Phone number',
            ),
            WWTextFieldEmail(controller: data?.emailCtr, title: 'Email'),
            WWTextFieldTextArea(
              controller: data?.descriptionCtr,
              title: 'Description',
            ),
            // SUBMIT BUTTON----------------------------------
            _SubmitButton(bloc: bloc, data: data),
          ],
        ),
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({required this.bloc, required this.data});

  final ProfileBloc bloc;
  final ProfileModel? data;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      buildWhen:
          (p, c) => p.updateProfileRes.status != c.updateProfileRes.status,
      listenWhen:
          (p, c) => p.updateProfileRes.status != c.updateProfileRes.status,
      listener: (context, state) {
        if (state.updateProfileRes.status == ApiStatus.failure) {
          wwDialogueBox(context, textSub: state.updateProfileRes.errorMessage);
        }
        if (state.updateProfileRes.status == ApiStatus.success) {
          showSuccessToast(message: 'Profile Updated Successfully');
          context.router.back();
        }
      },
      builder:
          (context, state) => WWButton(
            loader: state.updateProfileRes.status == ApiStatus.loading,
            widthFull: true,
            text: 'Submit',
            onPressed: () {
              bloc.add(
                UpdateMyProfileEvent(
                  data: data?.profileToApi() ?? ProfileModel(),
                ),
              );
            },
          ),
    );
  }
}
