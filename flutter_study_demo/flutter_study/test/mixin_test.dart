void main() {
  var message = AB().getMessage();
  print(message);
  var message2 = BA().getMessage();
  print(message2);

  Client().method();

}

// eg1
abstract class Walker {
  // This class is intended to be used as a mixin, and should not be
  // extended directly.
  factory Walker._() => null;

  void walk() {
    print("I'm walking");
  }
}

abstract class Flyer {
  // This class is intended to be used as a mixin, and should not be
  // extended directly.
  factory Flyer._() => null;

  void fly() {
    print("I'm flying");
  }
}

class Animal {}

class Cat extends Animal with Walker {}

class Dove extends Animal with Flyer {}

// eg2
class A {
  String getMessage() => 'A';
}

class B {
  String getMessage() => 'B';
}

class P {
  String getMessage() => 'P';
}

// 在语义上等同
//class PA = P with A;
//class PAB = PA with B;
//
//class AB extends PAB {}
//
//class PB = P with B;
//class PBA = PB with A;
//
//class BA extends PBA {}

class AB extends P with A, B {}

class BA extends P with B, A {}



// eg3
abstract class Super {
  void method() {
    print("Super");
  }
}

class MySuper implements Super {
  void method() {
    print("MySuper");
  }
}

mixin Mixin on Super {
  void method() {
    super.method();
    print("Sub");
  }
}

class Client extends MySuper with Mixin {}


