import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_app/data.dart';

Color kPrimaryColor = Color(0xffFFCC24);
AssetImage kLogo = AssetImage('assets/images/logo.png');
List<Person> listPerson = getPersonList();

class AboutPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "SDGs 7",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            GestureDetector(
                child: Text(
              'Afforfable and Clean Energy',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black54,
              ),
            ))
          ],
        ),
        centerTitle: false,
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(
              right: 16,
              top: 8,
            ),
            width: 50,
            child: CircleAvatar(
              backgroundImage: kLogo,
            ),
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
              top: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 210,
                color: kPrimaryColor,
                padding: EdgeInsets.only(top: 20, right: 23, left: 23),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 16),
                          child: Image(
                            image: AssetImage('assets/images/logo.png'),
                            width: 71,
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'SDGs 7',
                                style: TextStyle(
                                    fontSize: 23, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Afforfable and Clean Energy',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )),
          Positioned(
              top: 120,
              left: 16,
              right: 16,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: buildPersonList(),
              )),
        ],
      ),
    );
  }
}

List<Widget> buildPersonList() {
  List<Widget> list = [];
  for (var person in listPerson) {
    list.add(buildPerson(person));
  }
  return list;
}

Widget buildPerson(Person person) {
  return Container(
    margin: EdgeInsets.only(bottom: 20),
    padding: EdgeInsets.only(top: 10, right: 15),
    width: 370,
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.black12,
        spreadRadius: 3,
        blurRadius: 10,
        offset: Offset(0, 3), // changes position of shadow
      )
    ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
    child: Row(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20))),
          child: ClipRRect(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
            child: Image(
                width: 144,
                image: AssetImage(
                  person.photo,
                )),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Nama :',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    person.name,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'NIM :',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    person.nim,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    ),
  );
}
