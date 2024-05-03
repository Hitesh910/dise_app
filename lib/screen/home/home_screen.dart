import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:dice_app/utils/global.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int i = 0;
  int j = 0;
  late ConfettiController _controllerRight;
  bool isConfity = false;

  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    _controllerRight = ConfettiController(duration:  Duration(seconds: 5));
    _controllerRight.play();
  }

  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controllerRight.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dice app"),
      ),
      body: Align(
        alignment: Alignment.center,
        child: ConfettiWidget(
          confettiController: _controllerRight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  InkWell(
                      onTap: () {
                        setState(() {
                          Random r1 = Random();
                          i = r1.nextInt(diceList.length);
                          Random r2 = Random();
                          j = r2.nextInt(diceList.length);
                        });
                      },
                      child: Image.asset(
                        "${diceList[i]}",
                        height: 120,
                      )
                  ),
                  SizedBox(width: 10,),
                  Image.asset(
                    "${diceList2[j]}",
                    height: 120,
                  ),
                ]
              ),
              // Text("sum={$i } = ${i}",style: TextStyle(fontSize: 25),),
              Text("sum:${i+j+2}",style: TextStyle(fontSize: 25),),
              ElevatedButton(onPressed: () {
                setState(() {
                  Random r1 = Random();
                  i = r1.nextInt(diceList.length);
                  Random r2 = Random();
                  j = r2.nextInt(diceList2.length);

                });
              }, child: Text("Click")),
              MaterialButton(
                onPressed: () {
                  setState(
                    () {
                      isConfity = !isConfity;
                    },
                  );
                },
                child: Text("tap"),
              )

            ],
          ),
        ),
      ),
    );
  }

}
