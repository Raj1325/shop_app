import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BadgeIcon extends StatelessWidget {
  final Widget child;
  final String quantity;
  BadgeIcon({this.child, this.quantity});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned(
          child: Container(
            width: 30,
            height: 30,
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Theme.of(context).accentColor),
            constraints: BoxConstraints(
              maxHeight: 16,
              minWidth: 16,
            ),
            child: Text(
              this.quantity,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
              ),
            ),
          ),
          top: 8,
          right: 8,
        )
      ],
    );
  }
}
