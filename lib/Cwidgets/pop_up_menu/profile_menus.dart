import 'package:flutter/material.dart';
import 'package:livery/Cwidgets/pop_up_menu/pop_up_menu_base.dart';
import 'package:livery/Cwidgets/ww_text.dart';
import 'package:livery/utils/app_colors.dart';
import 'package:livery/utils/styles.dart';

class WwProfileMenus extends WebDesCardMenuButton {
  final Function()? reportTap;

  WwProfileMenus({super.key, this.reportTap})
    : super(
        onSelected: (v) {
          if (v == 'Report     ') reportTap?.call();
        },
        options: [_popUpMenuItem(name: 'Report     ', icon: Icons.report)],
      );
}

/// Helper function to create a popup menu item with an icon.
PopupMenuItem<String> _popUpMenuItem({
  required String name,
  required IconData icon,
}) {
  return PopupMenuItem(
    value: name,
    child: Row(
      children: [
        Icon(icon, color: AppColors.primary),
        const SizedBox(width: 8),
        WwText(text: name, style: normalText()),
      ],
    ),
  );
}
