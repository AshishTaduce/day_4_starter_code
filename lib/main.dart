import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: DicePage(),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 4;
  int rightDiceNumber = 1;

  void refresh() {
    setState(() {
      modifyLeftButton();
      modifyRightButton();
    });
    print("Right Pressed");
  }

  void modifyLeftButton() {
    Random rnd;
    int min = 1;
    int max = 7;
    rnd = new Random();
    setState(() {
      leftDiceNumber = min + rnd.nextInt(max - min);
      //modifyRightButton();
    });
    print("Left Pressed");
  }

  void modifyRightButton() {
    Random rnd;
    int min = 1;
    int max = 7;
    rnd = new Random();

    setState(() {
      rightDiceNumber = min + rnd.nextInt(max - min);
      //modifyLeftButton();
    });
    print("Right Pressed");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Roll the Dice'),
        backgroundColor: Colors.red,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          refresh();
          // Add your onPressed code here!
        },
        child: Icon(Icons.refresh),
        backgroundColor: Colors.white,
        focusColor: Colors.yellow,
        foregroundColor: Colors.red,
      ),

      body: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: FlatButton(
                    child: Image.asset(
                      'assets/dice$leftDiceNumber.png',
                    ),
                    onPressed: modifyLeftButton,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: FlatButton(
                    onPressed: modifyRightButton,
                    child: Image.asset(
                      'assets/dice$rightDiceNumber.png',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

