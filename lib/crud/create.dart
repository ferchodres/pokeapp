import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:poke_app/views/list_view.dart';

class CreateView extends StatefulWidget {
  const CreateView({Key? key}) : super(key: key);

  @override
  _CreateViewState createState() => _CreateViewState();
}

class _CreateViewState extends State<CreateView>{
  final _formkey = GlobalKey<FormState>() ;
  TextEditingController savename = TextEditingController();
  TextEditingController saveweight = TextEditingController();
  TextEditingController savedescript = TextEditingController();
  TextEditingController saveelement = TextEditingController();
  late DatabaseReference _ref;
  var _id = 10;

@override
void initState() {
  super.initState();
  savename = TextEditingController();
  saveweight = TextEditingController();
  savedescript = TextEditingController();
  saveelement = TextEditingController();
  _ref = FirebaseDatabase.instance.ref("registros/registros/");
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
            const SizedBox(height: 2, width: 20,),
            const Text("Nombre"),
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

            const Text("generación"),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty){
                  return "Necesita un nombre";
                }

              },
              controller: saveweight,
              maxLength: 40,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "generación"
              ),
            ),

            const Text("Descripcion"),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty){
                  return "Necesita un nombre";
                }
              },
              controller: savedescript,
              maxLength: 255,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "descripción"
              ),
            ),

            const Text("Elemento(s)"),
            TextFormField(
              controller: saveelement,
              maxLength: 255,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Elemento"
              ),
            ),

            ElevatedButton(
              onPressed: (){
                if(!_formkey.currentState!.validate()){
                  //return print("saved" + savename.text); 
                }
                _formkey.currentState!.save();
                _ref.child(_id.toString()).push().set({"name": savename.text, 
                                "description":savedescript.text,
                                "type":saveelement.text,
                                "weight": saveweight.text}).then(
                                  (value) => Navigator.push(
                                    context, MaterialPageRoute(builder: (context)=>const ListViewPoke())) );
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