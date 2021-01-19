import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BadgeIcon extends StatelessWidget {
  final Widget child;
  final String quantity;
  BadgeIcon({this.child, this.quantity});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      child: Stack(
        alignment: Alignment.center,
        children: [
          child,
          Positioned(
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).accentColor,
              ),
              constraints: BoxConstraints(
                maxHeight: 20,
                minWidth: 20,
              ),
              child: Text(
                this.quantity,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
            top: 4,
            right: -2,
          )
        ],
      ),
    );
  }
}
