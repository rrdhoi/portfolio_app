import 'package:flutter/material.dart';
import 'package:responsive_framework/max_width_box.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:web_responsive/app/extensions/context_extension.dart';

class BaseContainer extends StatelessWidget {
  final Color? backgroundColor;
  final Widget child;

  const BaseContainer({
    super.key,
    required this.child,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: context.isLargerThan(MOBILE) ? 90 : 32,
        horizontal: 32,
      ),
      color: backgroundColor ?? Colors.white,
      child: MaxWidthBox(
        maxWidth: 1100,
        child: child,
      ),
    );
  }
}