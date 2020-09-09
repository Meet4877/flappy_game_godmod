import 'dart:async';
import 'dart:ui';

import 'package:flappy_game/barriers.dart';
import 'package:flappy_game/bird.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  double x = 0;
  static double y = 0;
  double time = 0;
  double height = 0;
  double initialheight = y;
  bool gamehasstarted = false;
  static double barrierXone=1;
  double barrierXtwo= barrierXone + 1.5;

  void jump() {
    setState(() {
      time = 0;
      initialheight = y;
    });
    // initialheight=y;
  }

  void startgame() {
    gamehasstarted = true;
    Timer.periodic(Duration(milliseconds: 60), (timer) {

      time += 0.05;
      height = -4.9 * time * time + 2.8 * time;
      setState(() {
        y = initialheight - height;
        // barrierXone -=0.05;
        // barrierXtwo -=0.05;
      });
      setState(() {
        if(barrierXone < -1.6)
          barrierXone += 3;
        else
          barrierXone -=0.05;
      });
      setState(() {
        if(barrierXtwo < -1.6)
          barrierXtwo += 3;
        else
          barrierXtwo -=0.05;
      });
      if (y > 1) {
        timer.cancel();
        gamehasstarted = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (gamehasstarted) {
          jump();
        } else {
          startgame();
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  AnimatedContainer(
                    alignment: Alignment(x, y),
                    duration: Duration(microseconds: 1),
                    color: Colors.yellow,
                    child: bird(),
                  ),
                  Container(
                    alignment: Alignment(0, -0.4),
                    child: gamehasstarted
                        ? Text("")
                        : Text(
                            "T A P  T O   P L A Y",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(barrierXone, 1.1),
                    duration: Duration(milliseconds: 0),
                    child: barrier(
                      size: 200.0,
                    ),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(barrierXone, -1.1),
                    duration: Duration(milliseconds: 0),
                    child: barrier(
                      size: 200.0,
                    ),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(barrierXtwo, 1.1),
                    duration: Duration(milliseconds: 0),
                    child: barrier(
                      size: 150.0,
                    ),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(barrierXtwo,-1.1),
                    duration: Duration(milliseconds: 0),
                    child: barrier(
                      size: 250.0,
                    ),
                  ),
                ],
              ),
            ),
            Container(height: 15, color: Colors.green),
            Expanded(
              child: Container(
                color: Colors.brown,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "SCORE",
                          style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "0",
                          style: TextStyle(fontSize: 32, color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "HIGH SCORE",
                          style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "100",
                          style: TextStyle(fontSize: 32, color: Colors.white),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
