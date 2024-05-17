import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_car_rental/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CarName extends StatefulWidget {
  final int index;
  const CarName({super.key, required this.index});

  @override
  State<CarName> createState() => _CarNameState();
}

class _CarNameState extends State<CarName> {
  List<Car> car_names = [
    Car("FORD", "MUSTANG"),
    Car("AUDI", "A3"),
    Car("LEXUS", "LC SERIES"),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          car_names[widget.index].title,
          style: GoogleFonts.poppins(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            color: AppColors.gray.withOpacity(0.74),
          ),
        ),
        Transform.translate(
          offset: Offset(0, -40),
          child: Text(
            car_names[widget.index].sub_title,
            style: GoogleFonts.poppins(
              fontSize: 200,
              fontWeight: FontWeight.bold,
              height: 0,
              color: AppColors.gray.withOpacity(0.74),
            ),
          ),
        ),
      ],
    );
  }
}

class Car {
  final String title;
  final String sub_title;

  Car(this.title, this.sub_title);
}
