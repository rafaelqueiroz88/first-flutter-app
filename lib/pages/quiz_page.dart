import 'package:flutter/material.dart';
import '../utils/questions.dart';
import '../utils/quiz.dart';
import '../UI/answer_button.dart';
import '../UI/questions_texts.dart';
import '../UI/correct_wrong_overlay.dart';

class QuizPage extends StatefulWidget {

  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {

  Question currentQuestion;
  Quiz quiz = new Quiz([
    new Question("É verdade que vamos viajar no final do ano?", true),
    new Question("É verdade que mozão me ama mais que eu amo mozão?", false),
    new Question("É verdade que tenho a noiva mais gata do mundo?", true),
    new Question("É verdade que o Sheldon é mais bonito que o Bart?", false),
    new Question("É verdade que nos vamos ter um Salsichinha?", true),
  ]);

  String questionText;
  int questionNumber;
  bool isCorrect;
  bool overlayShouldBeVisible = false;

  @override
  void initState() {
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber;
  }

  void handleAnswer(bool answer) {
    isCorrect = (currentQuestion.answer == answer);
    quiz.answer(isCorrect);
    this.setState(() {
      overlayShouldBeVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column( // this is our main page
          children: <Widget>[
            new AnswerButton(true, () => handleAnswer(true)), // true button
            new QuestionText(questionText, questionNumber),
            new AnswerButton(false, () => handleAnswer(false)), // false button
          ]
        ),
        overlayShouldBeVisible == true ? new CorrectWrongOverlay(
          isCorrect,
          () {
            currentQuestion = quiz.nextQuestion;
            this.setState(() {
              overlayShouldBeVisible = false;
              questionText = currentQuestion.question;
              questionNumber = quiz.questionNumber;
            });
          }
          ) : new Container(),
      ],
    );
  }
}