import 'package:flutter/cupertino.dart'; 
import 'package:flutter/material.dart'; //import library pihak ketiga atau package widgets
import 'package:my_first_app/data.dart';  //import file data.dart

Color kPrimaryColor = Color(0xffFFCC24); //mendefinisakan kPrimaryColor
AssetImage kLogo = AssetImage('assets/images/logo.png'); //mendefinisakan kLogo
List<Person> listPerson = getPersonList(); //menambilkan getPersonList di file data.dart

class AboutPage extends StatefulWidget { //membuat class aboutpage
  @override
  State<StatefulWidget> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) { //widget utama
    return Scaffold(
      appBar: AppBar( //membuat appbar
        backgroundColor: kPrimaryColor, //kPrimaryColor didapat oleh kPrimaryColor diatas
        elevation: 0,
        title: Column( //membuat title
          crossAxisAlignment: CrossAxisAlignment.start, //menempatkan text di tengah layar
          children: <Widget>[ //maksud dari children ialah didalamny terdapat lebih dari 1 widget
            Text(  // membuat text
              "SDGs 7",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            GestureDetector( //digunakan untuk mendeteksi gesture widget seperti ontap, doubletab dll.
                child: Text( //maksud dari child ialah didalamny terdapat hanya 1 widget
              'Afforfable and Clean Energy',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black54,
              ),
            ))
          ],
        ),
        centerTitle: false, //membuat centertitle tidak ditengah
        actions: <Widget>[ //membuat action 
          Container( //membuat wadah kLogo
            margin: EdgeInsets.only( //Membuat margin dimana semua offset bernilai
              right: 16,
              top: 8,
            ),
            width: 50,
            child: CircleAvatar( //membuat avatar berbentuk lingkaran
              backgroundImage: kLogo, //kLogo didapat oleh kLogo diatas
            ),
          ),
        ],
      ),
      body: Stack( //membuat body dan stack untuk mengatur tatak letak secara custom
        children: <Widget>[ //maksud dari children ialah didalamny terdapat lebih dari 1 widget
          Positioned( //mengontrol posisi widget
              top: 0,
              child: Container( //membuat wadah
                width: MediaQuery.of(context).size.width,
                height: 210,
                color: kPrimaryColor, //kPrimaryColor didapat oleh kPrimaryColor diatas
                padding: EdgeInsets.only(top: 20, right: 23, left: 23),
                child: Column( //membuat colom
                  children: <Widget>[ //maksud dari children ialah didalamny terdapat lebih dari 1 widget
                    Row( //untuk menempatkan widget- widget lainnya secara horizontal
                      mainAxisAlignment: MainAxisAlignment.start, //membuat colom nempel di pinggir
                      children: <Widget>[ //maksud dari children ialah didalamny terdapat lebih dari 1 widget
                        Container( //membuat wadah logo
                          margin: EdgeInsets.only(right: 16),
                          child: Image( //maksud dari child ialah didalamny terdapat hanya 1 widget img
                            image: AssetImage('assets/images/logo.png'),
                            width: 71,
                          ),
                        ),
                        Container( //membuat wadah text
                          child: Column( //maksud dari child ialah didalamny terdapat hanya 1 widget colom
                            mainAxisAlignment: MainAxisAlignment.center, //membuat posisi text center
                            crossAxisAlignment: CrossAxisAlignment.start, ////membuat colom nempel di pinggir
                            children: <Widget>[ //maksud dari children ialah didalamny terdapat lebih dari 1 widget
                              Text( //membbuat text
                                'SDGs 7',
                                style: TextStyle(
                                    fontSize: 23, fontWeight: FontWeight.bold),
                              ),
                              Text( //membbuat text
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
