import 'package:numeral/numeral.dart';

void main() {
  print(Numeral(1995).format());
  print(Numeral(1995).format(roundUp: true, fractionDigits: 2));
}
