import 'package:chargemode/screens/bottombar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            child: Image.asset(
              'assets/images/map.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 280,
            left: 120,
            child: Image.asset(
              'assets/images/charge.png',
              height: 30,
              width: 30,
            ),
          ),
          Positioned(
            bottom: 170,
            right: 140,
            child: Image.asset(
              'assets/images/charge.png',
              height: 30,
              width: 30,
            ),
          ),
          Positioned(
            bottom: -70,
            right: 100,
            child: Image.asset(
              'assets/images/ac.png',
              height: 230,
              width: 230,
            ),
          ),
        ],
      );


  }
}
