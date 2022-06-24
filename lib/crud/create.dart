import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:poke_app/crud/create_statistics.dart';
import 'package:poke_app/views/list_view.dart';

class CreateView extends StatefulWidget {
  const CreateView({Key? key}) : super(key: key);

  @override
  _CreateViewState createState() => _CreateViewState();
}

class _CreateViewState extends State<CreateView>{
  final _formkey = GlobalKey<FormState>() ;
  TextEditingController savename = TextEditingController();
  TextEditingController saveheight = TextEditingController();
  TextEditingController saveweight = TextEditingController();
  TextEditingController savedescript = TextEditingController();
  TextEditingController saveurl = TextEditingController();
  late DatabaseReference _ref;
  var _id = 9;

@override
void initState() {
  super.initState();
  savename = TextEditingController();
  saveweight = TextEditingController();
  savedescript = TextEditingController();
  saveheight = TextEditingController();
  saveurl = TextEditingController();
  _ref = FirebaseDatabase.instance.ref("registros/registros");
  _id++;
}




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title:const Text("Add new pokemon"),),
      body: Container(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formkey,
        child: Column(
          children: [
            const Text("Nombre"),

            // form 1
            TextFormField(
              validator: (value) {
                if (value!.isEmpty){
                  return "Necesita un nombre";
                }
              },
              controller: savename,
              maxLength: 40,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Pikachu"
              ),
            ),

            const Text("peso"),
            //form 2
            TextFormField(
              //keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty){
                  return "añade un peso";
                }
              },
              controller: saveweight,
              maxLength: 40,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "1 g"
              ),
            ),

            //form 3
            const Text("Altura"),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty){
                  return "añade la altura";
                }
              },
              controller: saveheight,
              maxLength: 255,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "100 cm"
              ),
            ),

            //form 4
            const Text("image"),
            TextFormField(
              controller: saveurl,
              maxLength: 255,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "añade el link de una imagen"
              ),
            ),

            //form 5
            const Text("Drescripción"),
            TextFormField(
              controller: savedescript,
              maxLength: 255,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Descripción"
              ),
            ),

            ElevatedButton(
              onPressed: (){
                if(!_formkey.currentState!.validate()){
                  //return print("saved" + savename.text); 
                }
                _formkey.currentState!.save();
                _ref.child(_id.toString()).set({
                                "name": savename.text, 
                                "description":savedescript.text,
                                "height": double.parse(saveheight.text),
                                "weight": double.parse(saveweight.text),
                                "image":"https://images.wikidexcdn.net/mwuploads/wikidex/thumb/f/ff/latest/20200825140315/Zorua.png/1200px-Zorua.png",
                                "statistics":{"attack":double.parse("0"),
                                              "defense":double.parse("0"),
                                              "velocity":double.parse("0")},
                                "type":{"0":"algo"},
                                "weakneseses":{"0":"esto",
                                                "1":"lo otro"},
                                }).then(
                                  (value) => Navigator.push(
                                    context, MaterialPageRoute(
                                      builder: (context)=>const ListViewPoke())) );
                }, 
              child: const Text("Add"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(255, 231, 140, 133))
              ),
            ),
          ],
        ),
      ),
    ),);
  }
}