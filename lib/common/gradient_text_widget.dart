import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  const GradientText(this.text, {super.key,
    this.style,this.gradient=const LinearGradient(colors: [
      Color(0xffAD37E0),
      Color(0xffEE2B3B),
    ])
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) =>
          gradient.createShader(
            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
          ),
      child: Text(text, style: style),
    );
  }
}