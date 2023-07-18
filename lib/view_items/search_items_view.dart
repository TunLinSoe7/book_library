import 'package:flutter/material.dart';
class SearchRecentView extends StatelessWidget {
  const SearchRecentView({super.key,required this.icon, required this.text, required this.onTap});
final Widget? icon;
final Widget? text;
final GestureTapCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: icon,
      title: text,
    );
  }
}
