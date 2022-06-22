import 'package:flutter/material.dart';

class CreateView extends StatelessWidget {
  const CreateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Add new pokemon")),
      body: _FormSave(),
    );
  }
}

class _FormSave extends StatelessWidget {
final savename = TextEditingController();
final savegen = TextEditingController();
final savedescript = TextEditingController();
final saveelement = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Form(
        child: Column(
          children: [
            const SizedBox(height: 2, width: 20,),
            const Text("Nombre"),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty){
                  return "Necesita un nombre";
                }
                return "guardado correctamente";
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
                return "guardado correctamente";
              },
              controller: savegen,
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
                return "guardado correctamente";
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
              onPressed: (){if(true){}}, 
              child: const Text("Add"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(255, 231, 140, 133))
              ),
            ),
          ],
        ),
      ),
    );
  }
}