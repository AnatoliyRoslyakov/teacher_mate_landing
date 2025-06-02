import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:teacher_mate_landing/theme/app_colors.dart';
import 'package:teacher_mate_landing/theme/app_text_style.dart';

class AppButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isMainAction;
  final bool small;

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isMainAction = true,
    this.small = false,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton>
    with SingleTickerProviderStateMixin {
  bool _isHovering = false;

  void _handleHover(bool hovering) {
    if (mounted) {
      setState(() => _isHovering = hovering);
    }
  }

  @override
  Widget build(BuildContext context) {
    final mainColor = AppColors.pink.withOpacity(0.2);
    final strokeColor = widget.isMainAction ? Colors.white : AppColors.pink;

    return MouseRegion(
      onEnter: (_) => _handleHover(true),
      onExit: (_) => _handleHover(false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child:
        // Основная кнопка
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: widget.small ? 16 : 32,
            vertical: widget.small ? 8 : 16,
          ),
          decoration: BoxDecoration(
            color: _isHovering ? mainColor : Colors.transparent,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: strokeColor, width: 1.5),
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              widget.text,
              style: AppTextStyle.b4f16.copyWith(color: strokeColor),
            ),
          ),
        ),
      ),
    );
  }
}
