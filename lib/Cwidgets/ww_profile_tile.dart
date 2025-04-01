import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:livery/Cwidgets/ww_text.dart';

class WwProfileTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final Function() onTap;
  const WwProfileTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 20.r,
        backgroundImage: const NetworkImage(
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQz68b1g8MSxSUqvFtuo44MvagkdFGoG7Z7DQ&s',
        ),
      ),
      title: WwText(text: title),
      subtitle: WwText(text: subtitle),
      onTap: onTap,
    );
  }
}
