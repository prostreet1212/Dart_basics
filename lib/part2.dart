import 'dart:math';

void main() {
  var dd = DecimalBinary();

  int n = 97;
  print('Число $n в двоичной системе:${dd.decimalToBinary(n)}');
  int m=101101001;
  print('Число $m в десятичной системе:${dd.binaryToDecimal(101101001)}');
}

class DecimalBinary {
  int decimalToBinary(int numb) {
    List<int> result = List.empty(growable: true);
    if (numb == 0) {
      result.add(0);
    } else {
      while (numb != 1) {
        if (numb % 2 == 1) {
          result.add(1);
        } else {
          result.add(0);
        }
        (numb ~/= 2);
      }
      result.add(1);
      result = result.reversed.toList();
    }

    return int.parse('${result.join()}');
  }

  int binaryToDecimal(int numb) {
    String numString = numb.toString();
    if (numString.contains('2') ||
        numString.contains('3') ||
        numString.contains('4') ||
        numString.contains('5') ||
        numString.contains('6') ||
        numString.contains('7') ||
        numString.contains('8') ||
        numString.contains('9')) {
      throw Exception('Число может содержать только 0 и 1');
    } else {
      var tempList = numString.split('');
      List<int> numberList = [];
      int result = 0;

      tempList.forEach((element) {
        numberList.add(int.parse(element));
      });

      for (int i = 0; i < numberList.length; i++) {
        result += numberList[i] * pow(2, numberList.length - 1 - i).toInt();
      }
      return result;
    }
  }
}
