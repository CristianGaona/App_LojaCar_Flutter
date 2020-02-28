import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';

class User extends StatefulWidget {

  @override
  _User createState() => new _User();

}

  class _User extends State<User> {
    //Esto es para el comboBox

  Future<List<UserRest>> getUsers() async {
      var data = await http.get(
          "https://app-clientes-service.herokuapp.com/lojacar/v1/clientes");
      var jsonData = json.decode(data.body);
      List<UserRest> users = [];

      for (var u in jsonData) {
        UserRest user = UserRest(
             u["nombres"], u["apellidos"], u["correo_electronico"],
            );
        users.add(user);
      }
      print(users.length);
      return users;
    }

    @override
    Widget build(BuildContext context) {

      return new Scaffold(
        appBar: new AppBar(
          title: new Text('Usuarios'),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddUser()),
            );
          },
          label: Text('Crear Usuario',),
          icon: Icon(Icons.add),
          backgroundColor: Colors.green,
        ),
        body: Container(

          child: FutureBuilder(
              future: getUsers(),
              builder: (BuildContext context, AsyncSnapshot snapshot){
                if(snapshot.data==null){
                  return Container(
                      child:Center(
                        child: Text("Loading...") ,
                      )
                  );
                }else{

                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index){
                      return ListTile(
                        leading: CircleAvatar(
                          radius: 25.0,
                          backgroundImage: NetworkImage(
                              snapshot.data[index].url
                          ),
                        ),
                        title: Text(snapshot.data[index].nombres+" "+ snapshot.data[index].apellidos),
                        subtitle: Text(snapshot.data[index].correo_electronico),
                        onTap:(){
                          Navigator.push(context, new MaterialPageRoute(builder: (context)=>DetailPage(snapshot.data[index]))
                          );
                        },

                      );
                    },
                  );
                }

              }
          ),

        ),

      );
    }


  }

  //Detalle de cada usuario
class DetailPage extends StatelessWidget{
  final UserRest user;
DetailPage(this.user);
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Información del personal '),
      elevation: 0,
    ),
    body: Container(
      padding: const EdgeInsets.all(15),
      color: Theme.of(context).primaryColor,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          /*Image.asset('', height: 10,),
            SizedBox(height: 100,),*/
          Image(
              image: NetworkImage(user.url)),
          TextField(
            style: TextStyle(fontSize: 18, color: Colors.black54),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: user.nombres.toUpperCase(),
              contentPadding: const EdgeInsets.all(15),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(5),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          SizedBox(height: 10,),
          TextField(
            style: TextStyle(fontSize: 18, color: Colors.black54),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: user.apellidos.toUpperCase(),
              contentPadding: const EdgeInsets.all(15),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(5),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          SizedBox(height: 10,),
          TextField(
            style: TextStyle(fontSize: 18, color: Colors.black54),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: user.correo_electronico.toUpperCase(),
              contentPadding: const EdgeInsets.all(15),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(5),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
}
//Agregau un nuevo cliente
class AddUser extends StatelessWidget{

  String _mySelection;

  final String url = "https://app-clientes-service.herokuapp.com/lojacar/v1/empleados";

  List data = List(); //edited line

  Future<String> getSWData() async {
    var res = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    var resBody = json.decode(res.body);
    data = resBody;

    /*  setState(() {
      data = resBody;
    });*/

    print(resBody);

    return "Sucess";
  }
  //esto es otra forma
 final Future<Post> post;
  AddUser({Key key, this.post}) : super(key: key);
static   String  cliente = "1";
   String CREATE_POST_URL = 'https://app-clientes-service.herokuapp.com/lojacar/v1/empleado/'+cliente+'/cliente';
 // TextEditingController myController = new TextEditingController();
  TextEditingController myController2 = new TextEditingController();
  TextEditingController myController3 = new TextEditingController();
  TextEditingController myController4 = new TextEditingController();
  TextEditingController myController5 = new TextEditingController();
  TextEditingController myController6 = new TextEditingController();
  TextEditingController myController7 = new TextEditingController();
  TextEditingController myController8 = new TextEditingController();
  Dialog dialog = new Dialog();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    this.getSWData();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        color: Theme.of(context).primaryColor,
        width: double.infinity,
        child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: myController2,
              style: TextStyle(fontSize: 18, color: Colors.black54),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'nombres',
                contentPadding: const EdgeInsets.all(15),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(5),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: myController3,
              style: TextStyle(fontSize: 18, color: Colors.black54),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'apellidos',
                contentPadding: const EdgeInsets.all(15),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(5),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: myController4,
              style: TextStyle(fontSize: 18, color: Colors.black54),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'casa',
                contentPadding: const EdgeInsets.all(15),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(5),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: myController5,
              style: TextStyle(fontSize: 18, color: Colors.black54),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'movil',
                contentPadding: const EdgeInsets.all(15),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(5),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: myController6,
              style: TextStyle(fontSize: 18, color: Colors.black54),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'email',
                contentPadding: const EdgeInsets.all(15),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(5),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: myController7,
              style: TextStyle(fontSize: 18, color: Colors.black54),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'profesion',
                contentPadding: const EdgeInsets.all(15),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(5),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: myController8,
              style: TextStyle(fontSize: 18, color: Colors.black54),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'detalle',
                contentPadding: const EdgeInsets.all(15),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(5),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            SizedBox(height: 20,),
             new DropdownButton(

             // hint: Center(child: Text("Seleccione empleado")),
              items: data.map((clientes) {
                return new DropdownMenuItem(
                  child: new Text(clientes['nombres']),
                  value: clientes['id'].toString(),

                );
              }).toList(),
              onChanged: (newVal) {

                _mySelection = newVal;
                //hint: Center(child: Text("$_mySelection"));
                print(newVal);
              },
              value: _mySelection,
               isExpanded: false,
               hint: Center(child: Text("Seleccione empleado")),
            ),
           FlatButton(
              child: Text(
                'Registrar Cliente',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              shape: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(5),
              ),
              padding: const EdgeInsets.all(15),
              textColor: Colors.white,
              onPressed: () async {
                Post newPost = new Post(
                    id:0, nombres: myController2.text, apellidos: myController3.text, telefono_casa: myController4.text, telefono_movil: myController5.text,
                    correo_electronico: myController6.text, profesion: myController7.text, detalle: myController8.text
                );
                Post p = await createPost(CREATE_POST_URL, body2: newPost.toMap());
                dialog.information(context, 'Confirmación', 'Incidente almacenado con éxito');
                print(p.nombres);
              },
            ),
          ],
        ),
        ),
      ),
    );
  }
}
class UserRest{
  //final id;
  //final username;
//final password;
  final nombres;
  final apellidos;
  final  correo_electronico;
  final url = "https://img2.freepng.es/20190123/pgg/kisspng-customer-insight-computer-icons-scalable-vector-gr-customer-insight-svg-png-icon-free-download-3512-5c48ee0c8f6552.4757278615482834045874.jpg";

  UserRest (this.nombres, this.apellidos, this.correo_electronico);
//User (this.nombre);
}
class Post{
  final id;
  final nombres;
  final apellidos;
  final telefono_casa;
  final telefono_movil;
  final correo_electronico;
  final profesion;
  final detalle;

  Post({this.id, this.nombres, this.apellidos, this.telefono_casa, this.telefono_movil,
    this.correo_electronico, this.profesion, this.detalle});


  factory Post.fromJson(Map<String, dynamic> json){
    return Post(
      id: json['id'] as int,
      nombres: json['nombres'] as String,
      apellidos: json['apellidos'] as String,
      telefono_casa: json['telefono_casa'] as String,
      telefono_movil: json['telefono_movil'] as String,
      correo_electronico: json['correo_electronico'] as String,
      profesion: json['profesion'] as String,
        detalle: json['detalle'] as String
    );
  }

  Map toMap(){
    var map = new Map<String, dynamic>();
    //map['id'] = id;
    map["nombres"] = nombres;
    map["apellidos"] = apellidos;
    map["telefono_casa"] = telefono_casa;
    map["telefono_movil"] = telefono_movil;
    map["correo_electronico"] = correo_electronico;
    map["profesion"] = profesion;
    map["detalle"] = detalle;


    return map;
  }

}
Future<Post> createPost(String url, {Map body2}) async {
  var b = json.encode(body2);
  return http.post(
      url,
      body: b,
      headers: {
        "content-type": "application/json"
      }
  ).then((http.Response response){
    final int statusCode = response.statusCode;

    if(statusCode < 200 || statusCode > 400 || json == null){
      throw new Exception(statusCode);
    }
    print(statusCode);
    return Post.fromJson(json.decode(response.body));

  });
}

class Dialog{
  information(BuildContext context, String title, String description){
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text(title),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(description)
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => User()),
                  );
                },
                child: Text('Aceptar'),
              )
            ],
          );
        }
    );
  }

}