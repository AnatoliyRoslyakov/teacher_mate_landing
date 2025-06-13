import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teacher_mate_landing/theme/app_colors.dart';
import 'package:teacher_mate_landing/theme/app_text_style.dart';

class AppButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool invers;
  final bool small;
  final bool expand;
  final Widget? icon;
  final Color? color;
  final bool border;
  final Color? bgColor;

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.invers = false,
    this.small = false,
    this.expand = true,
    this.icon,
    this.color,
    this.border = true,
    this.bgColor,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton>
    with SingleTickerProviderStateMixin {
  bool _isHovering = false;
  Color? mainColor;
  Color? strokeColor;

  void _handleHover(bool hovering) {
    if (mounted) {
      setState(() => _isHovering = hovering);
    }
  }

  @override
  void initState() {
    mainColor =
        widget.bgColor == AppColors.pink
            ? AppColors.mainColor.withOpacity(0.2)
            : AppColors.pink.withOpacity(0.2);
    strokeColor =
        widget.color ??
        (widget.invers ? widget.bgColor ?? AppColors.pink : Colors.white);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => _handleHover(true),
      onExit: (_) => _handleHover(false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child:
        // Основная кнопка
        Container(
          constraints: BoxConstraints(
            minWidth: widget.expand ? double.infinity : 0,
          ),

          padding: EdgeInsets.symmetric(
            horizontal: widget.small ? 16 : 32,
            vertical: widget.small ? 8 : 16,
          ),
          decoration: BoxDecoration(
            color:
                _isHovering
                    ? mainColor
                    : widget.bgColor?.withOpacity(0.2) ?? Colors.transparent,
            borderRadius: BorderRadius.circular(24),
            border:
                widget.border
                    ? Border.all(color: strokeColor!, width: 1)
                    : null,
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              children: [
                if (widget.icon != null) ...[widget.icon!, SizedBox(width: 5)],

                Text(
                  widget.text,
                  style: AppTextStyle.b4f16.copyWith(color: strokeColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
