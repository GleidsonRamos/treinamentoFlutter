import 'package:flutter/material.dart';

class testeExibirTexto extends StatelessWidget {

  String texto;

  testeExibirTexto({this.texto});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        texto != null ? texto : "Teste Treinamento Flutter",
        style: TextStyle(color: Colors.blueAccent, fontSize: 45),
      ),
    );
  }
}