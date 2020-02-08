import 'package:flutter/material.dart';

class testeExibirBotao extends StatelessWidget {

  String texto;
  Function callback;

  testeExibirBotao({this.texto, this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 80,
      child: FlatButton(
        onPressed: (){callback();},
        color: Colors.blue,
        child: Row(
          children: <Widget>[
            Text(texto != null ? texto : "Pressionar",
            style: TextStyle(color: Colors.white),)
          ],
        ),
      ),
    );
  }
}