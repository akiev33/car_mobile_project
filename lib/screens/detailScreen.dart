import 'package:car_mobile_project/model/car_model.dart';
import 'package:car_mobile_project/screens/detailScreenLogic/mainDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.model});

  final Car model;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: widget.model.color,
        actions: [
          IconButton(
            splashRadius: 25.w.h,
            onPressed: () {},
            icon: Icon(
              Icons.more_vert_sharp,
              size: 35.w.h,
            ),
          ),
        ],
      ),
      body: MainDetail(model: widget.model),
    );
  }
}
