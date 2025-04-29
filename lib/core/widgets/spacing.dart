import 'package:flutter/material.dart';

class HorizontalSpaing extends StatelessWidget {
  const HorizontalSpaing({super.key,required this.width});

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}


class VerticalSpacing extends StatelessWidget {
  const VerticalSpacing({super.key,required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}