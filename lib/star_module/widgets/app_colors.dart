import 'package:flutter/material.dart';

/// App-specific named colors exposed via ThemeExtension for easy access
class AppColors extends ThemeExtension<AppColors> {
  final Color surface;
  final Color background;
  final Color onSurface;
  final Color muted;
  final Color divider;
  final Color gold;

  const AppColors({
    required this.surface,
    required this.background,
    required this.onSurface,
    required this.muted,
    required this.divider,
    required this.gold,
  });

  static const AppColors light = AppColors(
    surface: Color(0xFFFFFFFF),
    background: Color(0xFFFAFAFA),
    onSurface: Color(0xFF1A1A1A),
    muted: Color(0xFF9AA9BA),
    divider: Color(0xFFE0E0E0),
    gold: Color(0xFFc09d41),
  );

  static const AppColors dark = AppColors(
    surface: Color(0xFF1E1E1E),
    background: Color(0xFF121212),
    onSurface: Color(0xFFFFFFFF),
    muted: Color(0xFF666666),
    divider: Color(0xFF333333),
    gold: Color(0xFFc09d41),
  );

  @override
  AppColors copyWith({
    Color? surface,
    Color? background,
    Color? onSurface,
    Color? muted,
    Color? divider,
    Color? gold,
  }) {
    return AppColors(
      surface: surface ?? this.surface,
      background: background ?? this.background,
      onSurface: onSurface ?? this.onSurface,
      muted: muted ?? this.muted,
      divider: divider ?? this.divider,
      gold: gold ?? this.gold,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      surface: Color.lerp(surface, other.surface, t)!,
      background: Color.lerp(background, other.background, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      muted: Color.lerp(muted, other.muted, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
      gold: Color.lerp(gold, other.gold, t)!,
    );
  }
}
