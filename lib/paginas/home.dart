import 'package:flutter/material.dart';
import 'package:flutter_app/model/usuario.dart';
import 'package:flutter_app/state/home_provider.dart';
import 'package:image_ink_well/image_ink_well.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController email = new TextEditingController();

  int builds = 0;

  String textoExibido = "Memora";
  int count = 0;

  String nome;

  double width = 600;

  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {

    HomeProvider homeProvider = Provider.of<HomeProvider>(context);

    if(builds == 0){
      setState(() {
        width = MediaQuery.of(context).size.width;
      });
      builds++;
      usuarioGit newUser = usuarioGit();
      newUser.name = "Buscando..";
      homeProvider.setUsuario(newUser);
    }

    Widget consumoApi(){
      return Column(
        children: <Widget>[
          CircleImageInkWell(
            onPressed: () {
              print('onPressed');
            },
            size: 100,
            image: NetworkImage(homeProvider.usuario().avatarUrl ?? "https://www.publicdomainpictures.net/pictures/280000/velka/not-found-image-15383864787lu.jpg"),
            splashColor: Colors.white24,
          ),
          Text("O nome do usuário é : ${homeProvider.usuario().name}"),
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: (){
              homeProvider.iniciarBusca();
            },
          ),
        ],
      );
    }

    List<Widget> montarTabs(){
      return <Widget>[
        consumoApi(),
        paginaPrincipal(),
        Text(
          'Index 1: Business',
          style: optionStyle,
        ),
      ];
    }

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Center(
                  child: Text(
                'Menu Lateral',
                style: TextStyle(color: Colors.white, fontSize: 25),
              )),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(Icons.supervised_user_circle),
              title: Text('Habilitacao'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.check),
              title: Text('Processos'),
              onTap: () {},
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(""),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.mic_none,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.chat,
              size: 30,
            ),
          ),
        ],
      ),
      body: montarTabs().elementAt(homeProvider.getIndex()),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('School'),
          ),
        ],
        currentIndex: homeProvider.getIndex(),
        selectedItemColor: Colors.amber[800],
        onTap: homeProvider.setTabIndex,
      ),
    );
  }

  Widget paginaPrincipal(){
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 300,
                width: width,
                decoration: BoxDecoration(
                  color: const Color(0xff7c94b6),
                  image: const DecorationImage(
                    image: AssetImage('lib/assets/background.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: CircleImageInkWell(
                        onPressed: () {
                          print('onPressed');
                        },
                        size: 120,
                        image:  AssetImage('lib/assets/perfil.jpeg'),
                        splashColor: Colors.white24,
                      ),
                    ),
                    Text(
                      "Gleidson Ramos",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      "CPF: 000.000.000-00",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    SizedBox(
                      height: 49,
                    )
                  ],
                ),
              ),
              Positioned(
                top: 270,
                child: Container(
                  height: 100,
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: width - 38,
              decoration: BoxDecoration(
                color: Colors.transparent,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10.0, // has the effect of softening the shadow
                    spreadRadius: 0.1, // has the effect of extending the shadow
                    offset: Offset(
                      1.0, // horizontal, move right 10
                      1.0, // vertical, move down 10
                    ),
                  )
                ],
              ),
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 350,
                    width: width - 38,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.directions_car,
                              size: 40,
                              color: Colors.white,
                            ),
                            Text(
                              "Meus Veículos",
                              style: TextStyle(color: Colors.white, fontSize: 25),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 80,
                    child: Container(
                      height: 270,
                      width: width - 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: GestureDetector(
                              onTap: (){

                              },
                              child: Container(
                                width: width - 38,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.blueAccent,
                                    width: 1,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text("Placa"),
                                          Text(
                                            "Placa",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          Text("Marca/Modelo")
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text("Renavam"),
                                          Text(
                                            "Renavam",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[Text(""), Icon(Icons.arrow_forward_ios)],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 24.0, left: 24.0, right: 24.0),
                            child: Container(
                              width: width - 38,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.blueAccent,
                                  width: 1,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("Placa"),
                                        Text(
                                          "Placa",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Text("Marca/Modelo")
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("Renavam"),
                                        Text(
                                          "Renavam",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[Text(""), Icon(Icons.arrow_forward_ios)],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 24.0),
                            child: Text("Ver Mais"),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


}
