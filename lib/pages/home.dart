import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_car_rental/components/arrows.dart';
import 'package:flutter_car_rental/components/car_component.dart';
import 'package:flutter_car_rental/components/car_name.dart';
import 'package:flutter_car_rental/utils/colors.dart';
import 'package:flutter_car_rental/utils/sizing.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  int activeIndex = 0;
  final duration = const Duration(milliseconds: 1500);
  AnimationController? _controller;
  Animation<Offset>? _carAnimation;
  bool hasReversed = false;
  curve(ctrl) => CurvedAnimation(parent: ctrl, curve: Curves.elasticInOut);

  animateCar(int index) {
    setAnimatedValues(context, index < activeIndex);
    // _controller?.reset();
    _controller?.forward();
    setState(() {
      activeIndex = index;
    });
  }

  setAnimatedValues(BuildContext context, bool reverse) {
    _carAnimation = Tween<Offset>(
      begin: Offset(reverse ? -Sizing.width(context) : Sizing.width(context), 0),
      end: Offset.zero,
    ).animate(curve(_controller!));
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    Timer(Duration(seconds: 2), () {
      setAnimatedValues(context, false);
      animateCar(0);
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Stack(
        children: [
          Positioned(
            top: Sizing.height(context) / 4,
            left: 20,
            right: 20,
            child: CarName(index: activeIndex),
          ),
          Positioned(
            bottom: Sizing.height(context) / 8,
            left: 0,
            right: 0,
            child: AnimatedBuilder(
              animation: _controller!,
              builder: (context, c) {
                return Transform.translate(
                  offset: _carAnimation?.value ?? Offset.zero,
                  child: CarComponent(index: activeIndex),
                );
              },
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            left: 20,
            right: 20,
            child: Arrows(index: activeIndex, onTap: (newIndex) => animateCar(newIndex)),
          ),
        ],
      ),
    );
  }
}
