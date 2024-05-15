import 'package:flutter/material.dart';
import 'package:flutter_car_rental/utils/colors.dart';
import 'package:flutter_svg/svg.dart';

class Arrows extends StatefulWidget {
  final int index;
  final Function(int newIndex) onTap;
  const Arrows({super.key, required this.index, required this.onTap});

  @override
  State<Arrows> createState() => _ArrowsState();
}

class _ArrowsState extends State<Arrows> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        arrow(widget.index, "assets/icons/arrow_left.svg", true),
        arrow(widget.index, "assets/icons/arrow_right.svg", false),
      ],
    );
  }

  updateActiveIndex(int index, bool isLeft) {
    if (isLeft) {
      if (index > 0) {
        widget.onTap(index - 1);
      }
    } else if (index < 2) {
      widget.onTap(index + 1);
    }
  }

  Widget arrow(int index, String asset, bool isLeft) {
    return InkWell(
      borderRadius: BorderRadius.circular(40),
      onTap: () => updateActiveIndex(index, isLeft),
      child: CircleAvatar(
        backgroundColor: AppColors.white,
        child: SvgPicture.asset(asset),
      ),
    );
  }
}
