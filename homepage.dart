// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
// import 'dart:js_interop';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class homepageclock extends StatefulWidget {
  const homepageclock({super.key});

  @override
  State<homepageclock> createState() => _homepageclockState();
}

class _homepageclockState extends State<homepageclock> {
  late Stopwatch _stopwatch;
  late Timer t;
  void handlestartandstop() {
    setState(() {
      if (_stopwatch.isRunning) {
        _stopwatch.stop();
      } else {
        _stopwatch.start();
      }
    });
  }

  String returnformatedtext() {
    var inmili = _stopwatch.elapsed.inMilliseconds;
    String mili = (inmili % 1000).toString().padLeft(3, "0");
    String seconds = ((inmili ~/ 1000) % 60).toString().padLeft(2, "0");
    String minit = ((inmili ~/ 1000) ~/ 60).toString().padLeft(2, "0");
    return "$minit:$seconds:$mili";
  }

  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch();
    t = Timer.periodic(Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Stop Watch",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CupertinoButton(
              onPressed: () {
                handlestartandstop();
              },
              child: Container(
                height: 250,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Color.fromARGB(255, 73, 166, 241), width: 4)),
                child: Text(
                  returnformatedtext(),
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
                child: CupertinoButton(
                    child: Text(
                      "Reset",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      _stopwatch.reset();
                    }))
          ],
        ),
      )),
    );
  }
}
