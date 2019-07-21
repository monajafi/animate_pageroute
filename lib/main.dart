import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Page1(),
    ));

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: RaisedButton(
          child: Text("GO"),
          onPressed: () {
            Navigator.of(context).push(_createRoute());
          },
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Page2(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0, 1);
        var end = Offset.zero;
        var curve = Curves.ease;
        var curveTween = CurveTween(curve: curve);
        var tween = Tween(begin: begin, end: end).chain(curveTween);

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      });
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 2"),
      ),
      body: Center(
        child: Text(
          "Page 2",
          style: TextStyle(fontSize: 34),
        ),
      ),
    );
  }
}
