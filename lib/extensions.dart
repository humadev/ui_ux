import 'package:flutter/material.dart';

extension BreakpointUtils on BoxConstraints {
  bool get isTablet => maxWidth > 430;
  bool get isDesktop => maxWidth > 730;
  bool get isMobile => !isTablet && !isDesktop;
}
