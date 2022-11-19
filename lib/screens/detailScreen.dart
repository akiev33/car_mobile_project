import 'package:car_mobile_project/model/car_model.dart';
import 'package:car_mobile_project/screens/detailScreenLogic/mainDetail.dart';
import 'package:flutter/material.dart';

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
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert_sharp,
              size: 35,
            ),
          ),
        ],
      ),
      body: MainDetail(model: widget.model),
    );
  }
}
