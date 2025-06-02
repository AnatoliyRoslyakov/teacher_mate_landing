import 'package:flutter/material.dart';
import 'package:teacher_mate_landing/theme/app_colors.dart';

class AppTextStyle {
  static TextStyle get _baseFonts => const TextStyle(fontFamily: 'Roboto');
  static TextStyle get _logoFonts =>
      const TextStyle(fontFamily: 'DancingScript');

  static TextStyle get b7f46 => _baseFonts.copyWith(
    fontWeight: FontWeight.w700,
    fontSize: 46,
    color: Colors.black87,
    height: 0,
  );

  static TextStyle get b7f32pink => _logoFonts.copyWith(
    fontWeight: FontWeight.w800,
    fontSize: 32,
    color: AppColors.pink,
    height: 0,
  );

  static TextStyle get b7f24 => _baseFonts.copyWith(
    fontWeight: FontWeight.w700,
    fontSize: 24,
    color: Colors.black87,
    height: 0,
  );

  static TextStyle get b5f18 => _baseFonts.copyWith(
    fontWeight: FontWeight.w300,
    fontSize: 18,
    color: Colors.black87,
  );
  static TextStyle get b4f12 => _baseFonts.copyWith(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    color: Colors.black87,
  );

  static TextStyle get b3f12 => _baseFonts.copyWith(
    fontWeight: FontWeight.w300,
    fontSize: 12,
    color: Colors.black87,
  );

  static TextStyle get b5f14 => _baseFonts.copyWith(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: Colors.black87,
  );

  static TextStyle get b3f16 => _baseFonts.copyWith(
    fontWeight: FontWeight.w300,
    fontSize: 16,
    color: Colors.black87,
  );

  static TextStyle get b3f10 => _baseFonts.copyWith(
    fontWeight: FontWeight.w300,
    fontSize: 10,
    color: Colors.black87,
  );
  static TextStyle get b5f15 => _baseFonts.copyWith(
    fontWeight: FontWeight.w500,
    fontSize: 15,
    color: Colors.black87,
  );
  static TextStyle get b4f16 => _baseFonts.copyWith(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: Colors.black87,
  );

  static TextStyle get b5f16 => _baseFonts.copyWith(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: Colors.black87,
  );
  static TextStyle get b4f14 => _baseFonts.copyWith(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: Colors.black87,
  );

  static TextStyle get b4f15 => _baseFonts.copyWith(
    fontWeight: FontWeight.w400,
    fontSize: 15,
    color: Colors.black87,
  );
}
