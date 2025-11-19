import 'package:flutter/material.dart';

// 앱에서 사용할 색 정의
final Color background = Color(0xFFc6c0b6);
final Color text = Color(0xFF3b585f);
final Color point = Color(0xFFf4de3b);

// 테마 지정
final appTheme = ThemeData(
  scaffoldBackgroundColor: background,
  appBarTheme: AppBarTheme(backgroundColor: background),
  bottomSheetTheme: BottomSheetThemeData(backgroundColor: background),
  dividerTheme: DividerThemeData(color: text),
);
