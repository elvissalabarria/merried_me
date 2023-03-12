import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var status = '';

  var left;

  var right;

  var bottom;

  var top;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Quieres ser mi novia???'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            right: right,
            bottom: bottom,
            child: MouseRegion(
              cursor: SystemMouseCursors.move,
              opaque: false,
              onHover: (event) {
                setState(() {
                  final random = Random();
                  left = random.nextInt(200).toDouble();
                  right = random.nextInt(200).toDouble();
                  bottom = random.nextInt(200).toDouble();
                  top = random.nextInt(200).toDouble();
                });
              },
              child: Container(
                height: 40.0,
                width: 60.0,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: Colors.red),
                ),
                child: const Center(
                    child: Text(
                  "no",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  InkWell(
                    onTap: () {
                      _showMyDialog();
                    },
                    child: Container(
                      height: 80.0,
                      width: 80.0,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(color: Colors.black),
                        image: const DecorationImage(
                            image: NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3yGugkzyg026NwB0vzfGwwq8P8PM9mS7N4z8E1fqLVNCcg1jwFkD2_nM718Se4ilaVu8&usqp=CAU'),
                            fit: BoxFit.cover,
                            scale: 1),
                      ),
                      child: const Center(
                          child: Text(
                        "SI",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Te amo',
            style: TextStyle(
                color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          content: SingleChildScrollView(
            child: Container(
              height: 200,
              width: 200,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3yGugkzyg026NwB0vzfGwwq8P8PM9mS7N4z8E1fqLVNCcg1jwFkD2_nM718Se4ilaVu8&usqp=CAU'))),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Aprobar',
                style: TextStyle(color: Colors.red, fontSize: 18),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
