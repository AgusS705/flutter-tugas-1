import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_app/data.dart';

Color kPrimaryColor = Color(0xffFFCC24);
List<Person> listPerson = getPersonList();

class AboutPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Container(
                height: 210,
                color: kPrimaryColor,
                child: Padding(
                    padding: EdgeInsets.only(
                        top: 30, bottom: 30, right: 23, left: 23),
                    child: Column(
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold),
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
                    )),
              ),
              Positioned(
                  top: 130,
                  left: 16,
                  right: 16,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: buildPersonList(),
                  ))
            ],
          )
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
          child: Image(
              width: 144,
              image: AssetImage(
                person.photo,
              )),
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
