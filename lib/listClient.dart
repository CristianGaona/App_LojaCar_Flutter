import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import './client.dart';
import 'dart:io';


class ClientsRegistry extends StatefulWidget {

  @override
  _User createState() => new _User();

}
class DetailPage extends StatelessWidget{
  final ClientRest user;
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
    child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
           /* Image.asset('', height: 2,),
            SizedBox(height: 30,),*/
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
      ),
    );
  }
}
class _User extends State<ClientsRegistry> {
  //Esto es para el comboBox

  Future<List<ClientRest>> getUsers() async {
    var data = await http.get(
        "https://app-clientes-service.herokuapp.com/lojacar/v1/clientes");
    var jsonData = json.decode(data.body);
    List<ClientRest> users = [];

    for (var u in jsonData) {
      ClientRest user = ClientRest(
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
        title: new Text('Clientes Registrados'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Client()),
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
                      /*leading: CircleAvatar(
                        radius: 25.0,
                        backgroundImage: NetworkImage(
                            snapshot.data[index].url
                        ),
                      ),*/
                      leading:Icon(Icons.contact_mail, size: 50.0),
                      /*leading: CircleAvatar(
                        radius: 25.5,

                      ),*/
                      title: Text(snapshot.data[index].nombres+" "+ snapshot.data[index].apellidos),
                      subtitle: Text(snapshot.data[index].correo_electronico),
                      trailing: Icon(Icons.keyboard_arrow_right),
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

class ClientRest{
  //final id;
  //final username;
//final password;
  final nombres;
  final apellidos;
  final  correo_electronico;
  final url = "https://www.callcentermexico.com.mx/hs-fs/hubfs/iconos_clientes-1.png?width=402&name=iconos_clientes-1.png";

  ClientRest (this.nombres, this.apellidos, this.correo_electronico);
//User (this.nombre);
}