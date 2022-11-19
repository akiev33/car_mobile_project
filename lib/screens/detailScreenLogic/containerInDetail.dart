import 'package:car_mobile_project/model/car_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContainerInDetail extends StatefulWidget {
  const ContainerInDetail(
      {super.key, required this.index, required this.model});

  final int index;
  final Car model;

  @override
  State<ContainerInDetail> createState() => _ContainerInDetailState();
}

class _ContainerInDetailState extends State<ContainerInDetail> {
  final List<String> info = [
    'Transmition',
    'Speed',
    'Year',
    'Car mark',
    'Engine',
    'Car Model',
  ];

  optionsLine(List<String> info, int index) {
    if (info[index].contains('Transmition')) {
      return Text(widget.model.transition.name);
    }
    if (info[index].contains('Car mark')) {
      return Text(widget.model.nameCar);
    }
    if (info[index].contains('Car Model')) {
      return Text(widget.model.modelCar);
    }
    if (info[index].contains('Speed')) {
      return Text(widget.model.speed.toString());
    }
    if (info[index].contains('Engine')) {
      return Text(widget.model.engineValue);
    }
    if (info[index].contains('Year')) {
      return Text(widget.model.yearCar.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 22),
        Text(
          info[widget.index],
          style: GoogleFonts.ptSans(
            textStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Color(0xff95BCCC),
            ),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        optionsLine(info, widget.index),
      ],
    );
  }
}
