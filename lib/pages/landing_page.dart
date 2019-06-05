import 'package:flutter/material.dart';


class LandingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return new Material(
      color: Colors.greenAccent,
      child: new InkWell(
        onTap: () => {
          print("Screen touch!"),
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("First App", style: new TextStyle(color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.bold)),
            new Text("Material dart", style: new TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold))
          ],
        ),
      )
    );
  }
}