class Person {
  final String name;
  final int age;
  final String dep;
  Person(this.name, this.age, this.dep);
  void greeting() {
    print('Hi ${this.name}');
  }
}

Person alemu = new Person("alemu", 37, "Software");
