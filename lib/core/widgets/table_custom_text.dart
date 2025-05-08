import 'package:flutter/material.dart';

class TableCustomText extends StatelessWidget {
  const TableCustomText(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      softWrap: true,
      maxLines: 2,
    );
  }
}
