import 'package:flutter/material.dart';
import 'package:theme_management/src/theme_colors.dart';
import 'package:theme_management/src/theme_data/text_key.dart';

extension ThemeTextExtensions on Text {
  Text useFontSize(TextKey key) => Text(
        this.data!,
        style: this.style == null ? TextStyle(fontSize: key.fontSize) : this.style?.copyWith(fontSize: key.fontSize),
      );

  Text keyStyle(TextKey key, {required BuildContext of, ThemeColors? colors}) {
    TextStyle newStyle = key.textStyle(of: of);
    if (colors != null) {
      newStyle = newStyle.copyWith(color: colors.of(of));
    }
    return Text(this.data!,
        style: this.style == null
            ? newStyle
            : this.style?.copyWith(
                  fontSize: newStyle.fontSize,
                  color: newStyle.color,
                ));
  }
}
