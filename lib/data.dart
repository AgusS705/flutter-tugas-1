class Person { //membuat class person
  String name;
  String nim;
  String photo;

  Person(this.name, this.nim, this.photo);
}

List<Person> getPersonList() { //membuat list dengan nama getPersonList
  return <Person>[
    Person('Jendra Bayu Nugraha', '182410102043', 'assets/images/jendra.png'),
    Person('Agus Sepriyandiansah', '182410102081', 'assets/images/agus.png'),
    Person('M. Fathony Ramdhan', '182410102019', 'assets/images/toni.png')
  ];
}
