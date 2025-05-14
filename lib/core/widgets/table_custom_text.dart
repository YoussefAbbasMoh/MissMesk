import 'package:flutter/material.dart';

class TableCustomText extends StatelessWidget {
  const TableCustomText(this.text, {super.key, this.color});
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      softWrap: true,
      maxLines: 2,
      style: TextStyle(color: color),
    );
  }
}
