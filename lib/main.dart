import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'storyBrain.dart';

StoryBrain myBrain = StoryBrain();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Destini(),
      ),
    );
  }
}

class Destini extends StatefulWidget {
  @override
  _DestiniState createState() => _DestiniState();
}

class _DestiniState extends State<Destini> {
  void actionButton(int num) {
    if (myBrain.isFinished() == false) {
      setState(() {
        myBrain.nextStory(num);
      });
    } else {
      setState(() {
        myBrain.resetStory();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/background.png'), fit: BoxFit.none),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  myBrain.getStory(),
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
            ),
            Expanded(
                child: Container(
              margin: EdgeInsets.only(bottom: 15.0),
              color: Colors.green,
              child: TextButton(
                onPressed: () {
                  actionButton(1);
                },
                child: Text(
                  myBrain.getChoice1(),
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
            )),
            Expanded(
                child: Container(
              margin: EdgeInsets.only(bottom: 20.0),
              color: Colors.blue,
              child: TextButton(
                onPressed: () {
                  actionButton(2);
                },
                child: Text(
                  myBrain.getChoice2(),
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
