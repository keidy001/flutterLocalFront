import 'package:flutter/material.dart';
import 'package:siraba_chariaw/quiz/views/homepage.dart';
import 'package:siraba_chariaw/quiz/views/play_quiz.dart';

class Result extends StatefulWidget {
  int score, totalquestion, correct, incorrect, notattempted;
  Result(
      {required this.score,
      required this.totalquestion,
      required this.correct,
      required this.incorrect,
      required this.notattempted});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  String greeting = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var percentage = (widget.score / (widget.totalquestion * 20)) * 100;
    if (percentage >= 90) {
      greeting = "Genial";
    } else if (percentage > 80 && percentage < 90) {
      greeting = "Jolie Travail";
    } else if (percentage > 70 && percentage < 80) {
      greeting = "Bon effort";
    } else if (percentage < 70) {
      greeting = "Peux mieux faire";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "$greeting",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 24,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 14,
            ),
            Text(
              "Vous avez obtenu ${widget.score} sur ${widget.totalquestion * 20}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
                "${widget.correct} correct, ${widget.incorrect} incorrect & ${widget.notattempted} non repondu sur ${widget.totalquestion}"),
            SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => PlayQuiz()));
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 54),
                child: Text(
                  "Rejouer au Quiz",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.blue),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomeQuiz()));
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 54),
                child: Text(
                  "Retourner vers Menu",
                  style: TextStyle(fontSize: 15, color: Colors.blue),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.blue, width: 2)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
