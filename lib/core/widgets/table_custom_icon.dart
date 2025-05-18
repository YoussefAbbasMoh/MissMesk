import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TableCustomIcon extends StatelessWidget {
  const TableCustomIcon(this.asset, {super.key, this.color});

  final String asset;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      asset,
      colorFilter: ColorFilter.mode(color ?? Colors.black, BlendMode.srcIn),
      height: 25,
    );
  }
}
