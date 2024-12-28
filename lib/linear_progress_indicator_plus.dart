library progress_indicator_plus;

import 'package:flutter/material.dart';
import 'package:progress_indicator_plus/text_builder.dart';

class LinearProgressIndicatorPlus extends StatelessWidget {
  final double value;
  final String text;
  final double height;

  final Widget? child;
  final double padding;
  final BorderRadiusGeometry? borderRadius;
  final AlignmentGeometry? alignment;
  final BoxDecoration? decoration;

  final Color? backgroundColor;
  final Color? color;

  const LinearProgressIndicatorPlus({
    super.key,
    required this.value,
    this.height = 40,
    this.child,
    this.padding = 8,
    this.alignment,
    this.decoration,
    this.backgroundColor,
    this.borderRadius,
    this.color,
    required this.text,
  })  : assert(height >= 0),
        assert(decoration == null || color == null,
            'decoration and color cannot be used together');

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: LayoutBuilder(builder: (context, constraints) {
        final double value = this.value.clamp(0.0, 1.0);
        final double progressWidth = constraints.maxWidth * value;

        return ClipRRect(
          borderRadius: borderRadius ?? BorderRadius.circular(0),
          child: Stack(
            children: [
              Container(
                  color: backgroundColor ??
                      Theme.of(context).colorScheme.outlineVariant),
              AnimatedContainer(
                decoration: BoxDecoration(
                  color: color == null &&
                          decoration?.color == null &&
                          decoration?.gradient == null
                      ? Theme.of(context).colorScheme.primary
                      : color ?? decoration?.color,
                  gradient: decoration?.gradient,
                ),
                duration: const Duration(milliseconds: 1000),
                width: progressWidth,
                curve: Curves.decelerate,
                alignment: AlignmentDirectional.center,
              ),
              TextBuilder(
                  value: value,
                  text: text,
                  padding: padding,
                  width: constraints.maxWidth,
                  backgroundColor: backgroundColor ??
                      Theme.of(context).colorScheme.outlineVariant,
                  color: color ?? Theme.of(context).colorScheme.primary),
            ],
          ),
        );
      }),
    );
  }
}
