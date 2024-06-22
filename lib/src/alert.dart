import 'package:flutter/material.dart';

class CustomAlert{
  static basicAlert(BuildContext context,{required Widget child,bool?barrierDismissible=true,Color? shadowColor,Color? backgroundColor})async{
    await showDialog(
        context: context,
        barrierDismissible: barrierDismissible!,

        builder: (BuildContext context) {
          return AlertDialog(
            title:   child,
            elevation: 0,
            shadowColor: shadowColor??Colors.black,
            scrollable: true,
            backgroundColor: backgroundColor??Colors.white,
            shape:
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight:Radius.circular(80),
                bottomLeft:Radius.circular(80),
              ),
            ),
            //actions: <Widget>[],
          );


        }
    );

  }
}