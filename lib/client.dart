import 'package:flutter/material.dart';
import './user.dart';
import './main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class Client extends StatefulWidget {

  @override
  _Client createState() => new _Client();
}

class _Client extends State<Client>{
 // @override

  String _mySelection;
  final String url = "https://app-clientes-service.herokuapp.com/lojacar/v1/empleados";
  List data = List();
  String idEmployee;
  int idCar;

  Future<String> getSWData() async {
    var res = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    var resBody = json.decode(res.body);


    setState(() {
      data = resBody;
    });

    print(resBody);

    return "Sucess";
  }

 String mySelectionCar;

  final String urlCar = "https://app-clientes-service.herokuapp.com/lojacar/v1/vehiculos";
  List dataCar = List();
  Vehiculos veh;
  Future<String> getSWDataCar() async {
    var res = await http
        .get(Uri.encodeFull(urlCar), headers: {"Accept": "application/json"});
    var resBodyCar = json.decode(res.body);


    setState(() {
      dataCar = resBodyCar;
    });

    print(resBodyCar);

    return "Sucess";
  }

  @override
  void initState() {
    super.initState();
    this.getSWData();
    this.getSWDataCar();
  }

  final List<String> values = <String>['One', 'Two', 'Free', 'Four','Five','Six','Seven','Eigth','Nine','Ten','Eleven','Twelve','Threrten','Forten','Fivften','Sixten'];
  final List<String> selectedValues = <String>[];


  Future<Post> post;
  _Client({Key key, this.post});

  TextEditingController myController2 = new TextEditingController();
  TextEditingController myController3 = new TextEditingController();
  TextEditingController myController4 = new TextEditingController();
  TextEditingController myController5 = new TextEditingController();
  TextEditingController myController6 = new TextEditingController();
  TextEditingController myController7 = new TextEditingController();
  TextEditingController myController8 = new TextEditingController();
  Dialog dialog = new Dialog();
  List<Vehiculos> vehiculos1 = new List<Vehiculos>();
  //Vehiculos  v1;
  //Vehiculos  v2=  Vehiculos(id: 2);


  //List<UserRest> users = [];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Registrar Nuevo Cliente'),

      ),
   //   drawer: MenuLateral(),
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
           DropdownButton(

             hint: Center(child: Text("Seleccione empleado")),
            items: data.map((clientes) {
              return new DropdownMenuItem(
                child: new Text(clientes['nombres']),
                value: clientes['id'].toString(),

              );
            }).toList(),
            onChanged: (newVal) {
                  setState(() {
                    _mySelection = newVal;
                  });
                  idEmployee = newVal;
                  print("hola id" + idEmployee);
              print(newVal);
            },
            value: _mySelection,
            isExpanded: false,

          ),
           /*DropdownButton(

            hint: Center(child: Text("Seleccione Vehiculos")),
            items: dataCar.map((vehiculos) {
              return new DropdownMenuItem(
                child: new Text(vehiculos['modelo']),
                value: vehiculos['id'].toString(),

              );
            }).toList(),
            onChanged: (newValCar) {
              setState(() {
                mySelectionCar = newValCar;

              });
             // vh1 = newValCar;
            // v1 = Vehiculos(id: int.parse(newValCar));
             // vehiculos1.add(v1);
             // print("aqui"+ vehiculos1.length.toString());


            },

            value: mySelectionCar,
            isExpanded: false,

          ),*/
          /* DropdownButton(
              items: [
                DropdownMenuItem(
                  child: Row(
                    children: <Widget>[
                      Checkbox(
                        onChanged: (bool value){

                        },
                          value: true,
                      ),
                      Text('Fist')
                    ],
                  ),
                ),
                DropdownMenuItem(
                  child: Row(
                    children: <Widget>[
                      Checkbox(
                          onChanged: (bool value){

                          },
                        value: true,
                      ),
                      Text('Second')
                    ],
                  ),
                ),
              ],

              onChanged: (value) {
              },
              hint: Text('Select value'),

            ),*/
           DropdownButton<String>(
             value: selectedValues.isEmpty ? null: selectedValues.last,
             onChanged: (String newValue){
               setState(() {
                 if (selectedValues.contains(newValue)) {
                   selectedValues.remove(newValue);
                   veh = Vehiculos(id: int.parse(newValue));
                   vehiculos1.remove(veh);
                 }
                 else {
                   selectedValues.add(newValue);
                   veh = Vehiculos(id: int.parse(newValue));
                   vehiculos1.add(veh);
                 }
               });

             },

             hint: Center(child: Text("Seleccione Vehiculos")),
             items: dataCar.map((vehiculos){
               return DropdownMenuItem<String>(
                 value: vehiculos['id'].toString(),
                 child: Row(
                   mainAxisSize: MainAxisSize.min,
                   children: <Widget>[
                     Icon(
                       Icons.check,
                       color: selectedValues.contains(vehiculos['id'].toString()) ? null: Colors.transparent
                     ),
                     SizedBox(width: 16),
                     Text(vehiculos['modelo']),
                   ],
                 )
               );
           })

               .toList(),
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
                    correo_electronico: myController6.text, profesion: myController7.text, detalle: myController8.text, vehiculos: vehiculos1
                );
                String CREATE_POST_URL = 'https://app-clientes-service.herokuapp.com/lojacar/v1/empleado/$idEmployee/cliente';
                Post p = await createPost(CREATE_POST_URL, body2: newPost.toMap());
                dialog.information(context, 'Confirmación', 'Cliente Registrado con éxito');
               // print(p.nombres);
              },
            ),
        ],
      ),
    ),
      ),
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
                          builder: (BuildContext) => new Client())
                  );
                },
              )
            ]

        )
    );
  }
}


class Post{
  int id;
  String nombres;
  String apellidos;
  String telefono_casa;
  String telefono_movil;
  String correo_electronico;
  String profesion;
  String detalle;
  List<Vehiculos> vehiculos;

  Post({this.id, this.nombres, this.apellidos, this.telefono_casa, this.telefono_movil,
    this.correo_electronico, this.profesion, this.detalle, this.vehiculos});

  Post.fromJson(Map<String, dynamic> json, this.id, this.detalle){
    id= json['id'];
    nombres = json['nombres'];
    apellidos= json['apellidos'];
    telefono_casa= json['telefono_casa'];
    telefono_movil= json['telefono_movil'];
    correo_electronico= json['correo_electronico'];
    profesion= json['profesion'];
    detalle= json['detalle'];
    if(json['vehiculos']!=null){
      vehiculos = new List<Vehiculos>();
      json['vehiculos'].forEach((v){
        vehiculos.add(new Vehiculos.fromJson(json));
      }
      );

    }

  }

  /*factory Post.fromJson(Map<String, dynamic> json){
    return Post(
        id: json['id'] as int,
        nombres: json['nombres'] as String,
        apellidos: json['apellidos'] as String,
        telefono_casa: json['telefono_casa'] as String,
        telefono_movil: json['telefono_movil'] as String,
        correo_electronico: json['correo_electronico'] as String,
        profesion: json['profesion'] as String,
        detalle: json['detalle'] as String;

    );
  }*/
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
    if(this.vehiculos != null){
      map["vehiculos"]= this.vehiculos.map((v)=>v.toJson()).toList();
    }
    return map;
  }

}

class Vehiculos{
  int id;
  Vehiculos({this.id});

  Vehiculos.fromJson(Map<String, dynamic> json){
    id = json['id'];
  }
Map<String, dynamic> toJson(){
    final Map<String, dynamic>  data = new Map<String, dynamic>();

    data['id']= this.id;
    return data;
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
  //  return Post.fromJson(json.decode(response.body));

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
                    MaterialPageRoute(builder: (context) => MyApp()),
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

