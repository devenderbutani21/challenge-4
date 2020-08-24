import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String labelText;
  final Widget childWidget;

  const CustomContainer({this.labelText, this.childWidget});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          bottom: 17.5,
          child: Container(
            width: 360,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(7.5)),
              border: Border.all(color: Colors.white, width: 2.0),
            ),
          ),
        ),
        Positioned(
          left: 10,
          bottom: 65,
          child: Container(
            color: Colors.blueAccent,
            child: Text(
              labelText,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
        childWidget,
      ],
    );
  }
}
