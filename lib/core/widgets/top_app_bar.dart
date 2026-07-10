import 'package:flutter/material.dart';
import 'package:flutter_task/core/theme/app_style.dart';
import 'package:flutter_task/core/widgets/icon_button_circle.dart';

class AppTopBar extends StatelessWidget {
  const AppTopBar({
    super.key,
    required this.title,
    this.onBack,
    this.onShare,
    this.onNotifications,
  });

  final String title;
  final VoidCallback? onBack;
  final VoidCallback? onShare;
  final VoidCallback? onNotifications;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleIconButton(icon: Icons.chevron_left, onTap: onBack),
        Expanded(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyles.appBarTitle,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        CircleIconButton(icon: Icons.share, onTap: onShare),
        const SizedBox(width: 10),
        CircleIconButton(
          icon: Icons.notifications_none_rounded,
          onTap: onNotifications,
        ),
      ],
    );
  }
}
