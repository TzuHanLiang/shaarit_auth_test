import 'package:flutter/material.dart';

class GestureHint extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(margin: EdgeInsets.only(top:10.0),),
        Container(
          padding: EdgeInsets.all(10.0),
          child: Icon(Icons.arrow_upward, color: Colors.grey),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              border: Border.all(color: Colors.grey)),
        ),
        SizedBox(height: 8.0),
        Text(
          '向上滑動推薦給朋友',
          style: TextStyle(color: Colors.grey),
        )
      ],
    );
  }
}
