import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:livery/Cwidgets/ww_textfield.dart';

@RoutePage()
class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          WWTextFieldEmail(
            controller: TextEditingController(),
            hintText: 'Enter your email',
          ),
        ],
      ),
    );
  }
}
