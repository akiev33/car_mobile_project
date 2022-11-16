import 'package:car_mobile_project/resources/resources.dart';
import 'package:car_mobile_project/screens/mainScreenLogic/selectItem.dart';
import 'package:flutter/material.dart';

class SelectWidget extends StatefulWidget {
  const SelectWidget({super.key});

  @override
  State<SelectWidget> createState() => _SelectWidgetState();
}

class _SelectWidgetState extends State<SelectWidget> {
  final List<String> _types = [
    'family cars',
    'Cheap cars',
    'Luxuly cars',
    'family cars',
    'Cheap cars',
    'Luxuly cars',
    'family cars',
    'Cheap cars',
    'Luxuly cars',
  ];

  bool isActive = false;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(height: 25),
        SizedBox(
          height: 28,
          width: 295,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => SelectItem(
              text: _types[index],
              isActive: currentIndex == index,
              onTap: () {
                currentIndex = index;
                setState(() {});
              },
            ),
            separatorBuilder: (context, index) => const SizedBox(width: 22),
            itemCount: _types.length,
          ),
        ),
        const SizedBox(width: 30),
        IconButton(
          onPressed: () {},
          icon: Image.asset(
            Images.search,
          ),
        ),
      ],
    );
  }
}