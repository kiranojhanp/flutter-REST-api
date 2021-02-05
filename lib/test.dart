void main() {
  test1();
}

void test1() {
  String myString = '15abc';
  try {
    double myStringDouble = double.parse(myString);
    print(myStringDouble + 20);
  } catch (e) {
    print(e);
  }
}
