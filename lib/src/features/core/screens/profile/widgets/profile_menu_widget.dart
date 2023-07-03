import 'package:croix_rouge_storage_manager_mobile/src/constants/colors.dart';
import 'package:flutter/material.dart';

class ProfileMenuWidget extends StatefulWidget {
  const ProfileMenuWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.trailing,
    this.titleColor,
  });

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final Widget? trailing;
  final Color? titleColor;

  @override
  State<ProfileMenuWidget> createState() => _ProfileMenuWidgetState();
}

class _ProfileMenuWidgetState extends State<ProfileMenuWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: widget.onPress,
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: tSecondaryColor.withOpacity(0.1),
          ),
          child: Icon(
            widget.icon,
            color: tRedCroixRougeColor,
          ),
        ),
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.bodyLarge?.apply(color: widget.titleColor),
        ),
        trailing: widget.trailing);
  }
}