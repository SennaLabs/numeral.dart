import 'package:numeral/numeral.dart';

void main() {
  print(Numeral(0).format());
  print(Numeral(00).format());
  print(Numeral(10).format());
  print(Numeral(99).format());
  print(Numeral(2000).format());
  print(Numeral(1995).format());
  print(Numeral(0).format());
  print(Numeral(00).format());
  print(Numeral(-13).format());
  print(Numeral(-99).format());
  print(Numeral(-2000).format());
  print(Numeral(-1995).format());
  print(Numeral(-1995).format(roundUp: true, fractionDigits: 2));
}
