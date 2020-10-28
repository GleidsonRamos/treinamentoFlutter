import 'package:flutter/widgets.dart';
import 'package:flutter_app/model/usuario.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class HomeProvider extends ChangeNotifier{
  int _tabIndex = 0;
  usuarioGit _usuario;

  usuarioGit usuario(){
    return _usuario;
  }

  setUsuario(usuarioGit novoUsuario){
    _usuario = novoUsuario;
    notifyListeners();
  }

  int getIndex(){
    return _tabIndex;
  }

  setTabIndex(int index){
    this._tabIndex = index;
    notifyListeners();
  }

  iniciarBusca() async {
    usuarioGit usuario = await buscarDados();
    _usuario = usuario;
    notifyListeners();
  }

  Future<usuarioGit> buscarDados() async {
    print("Solicitando dados..");
    String url = "https://api.github.com/users/gleidsonramos";
    Map<String, String> header = new Map<String, String>();
    header['Content-type'] = 'application/json';
    var response = await http.get(url, headers: header);
    print("Processando resposta..");
    if (response.statusCode != 200 && response.statusCode != 201) {
      print(response);
    } else {
      final responseJson = convert.jsonDecode(response.body);
      return usuarioGit.fromJson(responseJson);
    }
  }
}