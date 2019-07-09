import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//serve para gerar alerts em todos os trechos que são necessários
alert(BuildContext context, String title, String msg) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(msg),
          actions: <Widget>[
            FlatButton(
              child: Text("Ok"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      });
}
