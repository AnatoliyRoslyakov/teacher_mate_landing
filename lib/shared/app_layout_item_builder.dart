import 'package:flutter/material.dart';

class AppLayoutItemBuilder<T extends Object?> {
  const AppLayoutItemBuilder({
    required this.wide,
    required this.narrow,
  });

  factory AppLayoutItemBuilder.values({
    required T wide,
    required T narrow,
  }) =>
      AppLayoutItemBuilder(wide: () => wide, narrow: () => narrow);

  /// Виджет для широких экранов.
  final ValueGetter<T> wide;

  /// Виджет для узких экранов
  final ValueGetter<T> narrow;

  T call(BuildContext context, {double? width}) {
    final size = MediaQuery.of(context).size.width;
    return size <= (width ?? 550) ? narrow() : wide();
  }
}
