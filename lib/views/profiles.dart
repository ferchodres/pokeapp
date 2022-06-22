import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Profile"), backgroundColor: Colors.red),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(140),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 10,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: 120,
                  backgroundImage: NetworkImage(
                      "https://i.pinimg.com/originals/18/d9/e1/18d9e1307018dbc76750ca7d5124fccd.png"),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Ash Ketchum ",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 18,
              ),
              Text("Maestro pokemon"),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    icon: FaIcon(FontAwesomeIcons.github),
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                      padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      ),
                    ),
                    label: Text(
                      "GH",
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton.icon(
                    icon: FaIcon(FontAwesomeIcons.linkedin),
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                      padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      ),
                    ),
                    label: Text(
                      "LIn",
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton.icon(
                    icon: FaIcon(FontAwesomeIcons.twitter),
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                      padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      ),
                    ),
                    label: Text(
                      "Tt",
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton.icon(
                    icon: FaIcon(FontAwesomeIcons.facebook),
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                      padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      ),
                    ),
                    label: Text(
                      "Fb",
                    ),
                  ),
                  SizedBox(
                    width: 18,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
