import 'package:flutter/material.dart';

abstract final class AppShadows {
  AppShadows._();

  static final card = [
    BoxShadow(
      color: Colors.black.withOpacity(.06),
      blurRadius: 32,
      offset: const Offset(0, 12),
    ),
  ];

  static final soft = [
    BoxShadow(
      color: Colors.black.withOpacity(.04),
      blurRadius: 20,
      offset: const Offset(0, 8),
    ),
  ];
}