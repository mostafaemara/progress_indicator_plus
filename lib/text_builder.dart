import 'package:flutter/material.dart';

class TextBuilder extends StatelessWidget {
  final double value;
  final String text;
  final double padding;
  final Color? backgroundColor;
  final Color? color;
  final double width;
  const TextBuilder(
      {super.key,
      required this.value,
      required this.text,
      required this.padding,
      required this.backgroundColor,
      required this.color,
      required this.width});

  @override
  Widget build(BuildContext context) {
    final double progressWidth = width * value;

    final textWidth = calculateTextWidth(text, 14);
    final textArry = text.split('');
    return Padding(
      padding: EdgeInsets.all(padding),
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 1000),
          alignment: AlignmentDirectional.center,
          width: progressWidth,
          constraints: BoxConstraints(minWidth: textWidth),
          child: RichText(
            text: TextSpan(
              children: List.generate(textArry.length, (index) {
                return TextSpan(
                  text: textArry[index],
                  style: TextStyle(
                    color: getTextColorBackground(
                      backgroundColor!,
                      color!,
                      index,
                      text,
                      progressWidth,
                    ),
                    fontSize: 14,
                  ),
                );
              }),
            ),
          )),
    );
  }

  Color getContrastingTextColor(Color backgroundColor) {
    // Calculate relative luminance
    double luminance = backgroundColor.computeLuminance();
    return luminance > 0.5 ? Colors.black : Colors.white;
  }

  Color getTextColorBackground(Color backgroundColor, Color color,
      int litterIndex, String text, double progressWidth) {
    if (progressWidth == 0) {
      return getContrastingTextColor(backgroundColor);
    }

    final letterWidthRange =
        calculateTextWidth(text.substring(0, litterIndex), 14) + padding * 2;

    if (letterWidthRange > progressWidth) {
      // letter is in progress
      return getContrastingTextColor(backgroundColor);
    } else {
      return getContrastingTextColor(color);
    }
  }

  double calculateTextWidth(String text, double fontSize, {TextStyle? style}) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: style ?? TextStyle(fontSize: fontSize),
      ),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();

    return textPainter.size.width;
  }
}
