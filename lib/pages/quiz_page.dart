import 'package:flutter/material.dart';
import '../utils/questions.dart';
import '../utils/quiz.dart';
import '../UI/answer_button.dart';

class QuizPage extends StatefulWidget {

  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new Column( // this is our main page
          children: <Widget>[
            new AnswerButton(true, () => print("Apertou verdadeiro. ERROU!!!")),
            new Material(
              color: Colors.white,
              child: new Padding(
                padding: new EdgeInsets.symmetric(vertical: 13.0, horizontal: 8.0),
                child: new Center(
                  child: new Text("O Cake é o melhor Framework PHP de todos?", style: new TextStyle(color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.bold)),
                ),
              )
            ),
            new AnswerButton(false, () => print("Apertou falso. ACERTOUUU!!!")),
          ]
        ),
      ],
    );
  }
}