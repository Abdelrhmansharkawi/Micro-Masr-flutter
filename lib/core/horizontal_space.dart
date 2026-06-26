import 'package:flutter/material.dart';
import 'package:micromasr/core/size_extensions.dart';

class HorizontalSpace extends StatelessWidget {
  const HorizontalSpace(this.width, {super.key});

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width.aw);
  }
}











