import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lojacar_app/listClient.dart';
import './user.dart';
import './client.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
void main() => runApp(MyApp());





class MyApp extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("Ubicaciones Concesionarios"),),
        drawer: MenuLateral(),
        body: MyHomePage()
      )
    );
  }
}


class MenuLateral extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Drawer (
      child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
              accountName: Text("LOJA CAR"),
              accountEmail: Text("info@lojacar.com.ec"),
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage("https://lojacar.com.ec/images/servicios/posventa_lojacar_5.jpg"),
             fit: BoxFit.cover

              )


            ),


          ),

          Ink(
            color: Colors.indigo,
            child: new ListTile(
              title: Text("Usuarios", style: TextStyle(color: Colors.white),),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context,
                    new MaterialPageRoute(
                        builder: (BuildContext) => new User())
                );
              },
            ),
          ),
          new ListTile(
            title: Text("Clientes"),
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context,
                  new MaterialPageRoute(
                      builder: (BuildContext) => new ClientsRegistry())
              );
            },
          )
        ]

      )
    );
  }
}

class Usuarios extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Text("hola usuarios");
  }
}






class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CameraPosition _initialPosition = CameraPosition(target: LatLng(-3.986107, -79.205479), zoom: 18);
  Completer<GoogleMapController> _controller = Completer();
  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: _initialPosition,
            ),
          ],
        ));
  }
}
