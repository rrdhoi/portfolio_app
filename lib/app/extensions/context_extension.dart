import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

extension ContextExtension on BuildContext {
  bool isMobile() => ResponsiveBreakpoints.of(this).isMobile;

  bool isDesktop() => ResponsiveBreakpoints.of(this).isDesktop;

  bool isTablet() => ResponsiveBreakpoints.of(this).isTablet;

  bool isSmallerThan(String platform) =>
      ResponsiveBreakpoints.of(this).smallerThan(platform);

  bool isLargerThan(String platform) =>
      ResponsiveBreakpoints.of(this).largerThan(platform);

  double responsive({required double large, required double mobile}) =>
      isLargerThan(MOBILE) ? large : mobile;

  double get screenWidth => MediaQuery.of(this).size.width;

  void pop() => Navigator.of(this).pop();
}

extension XResponsiveFontSize on BuildContext {
  double get titleScaleFactor => isLargerThan(MOBILE) ? 1 : 0.8;
}
