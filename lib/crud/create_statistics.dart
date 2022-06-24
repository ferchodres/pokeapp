import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:poke_app/views/list_view.dart';

class CreateStatisticsView extends StatefulWidget {
  const CreateStatisticsView({Key? key}) : super(key: key);

  @override
  _CreateStaticticsState createState() => _CreateStaticticsState();
}

class _CreateStaticticsState extends State<CreateStatisticsView>{
  final _formkey = GlobalKey<FormState>() ;
  TextEditingController saveatack = TextEditingController();
  TextEditingController savedefense = TextEditingController();
  TextEditingController savevelocity = TextEditingController();
  late DatabaseReference _ref;
  var _id = 9;

@override
void initState() {
  super.initState();
  saveatack = TextEditingController();
  savevelocity = TextEditingController();
  savedefense = TextEditingController();
    _id++;
  _ref = FirebaseDatabase.instance.ref("registros/registros/$_id");
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

            // form 1
            TextFormField(
              validator: (value) {
                if (value!.isEmpty){
                  return "Necesita un nombre";
                }
              },
              controller: saveatack,
              maxLength: 40,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Pikachu"
              ),
            ),

            const Text("peso"),
            //form 2
            TextFormField(
              validator: (value) {
                if (value!.isEmpty){
                  return "añade un peso";
                }
              },
              controller: savevelocity,
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
              controller: savedefense,
              maxLength: 255,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "100 cm"
              ),
            ),


            ElevatedButton(
              onPressed: (){
                if(!_formkey.currentState!.validate()){
                  //return print("saved" + saveatack.text); 
                }
                _formkey.currentState!.save();
                _ref.child("statistics").set({
                                "attack": double.parse(saveatack.text), 
                                "defense":double.parse(savedefense.text),
                                "weight": double.parse(savedefense.text),
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