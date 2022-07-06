library flutter_skillbox_module2;

void main() {
  var dc = DelimetersCalculator();
  print('Наибольший общий делитель: ${dc.nod2(22, 121)}');
  print('Наименьшее общее кратное: ${dc.nok(4, 14)}');
  int n = 126;
  print('Простые множители числа ${n}: ${dc.getMultiple(n)}');
}

class DelimetersCalculator {
  List<int> swap(int a, int b) {
    int tempNumber;
    tempNumber = a;
    a = b;
    b = tempNumber;
    return [a, b];
  }

  int Nod(int firstNumber, int secondNumber) {
    if (firstNumber < secondNumber) {
      var swap1 = swap(firstNumber, secondNumber);
      firstNumber = swap1[0];
      secondNumber = swap1[1];
    }
    while (secondNumber != 0) {
      firstNumber %= secondNumber;
      var swap1 = swap(firstNumber, secondNumber);
      firstNumber = swap1[0];
      secondNumber = swap1[1];
    }
    return firstNumber;
  }

  int nod2(int firstNumber, int secondNumber) {
    var numberList = [firstNumber, secondNumber];
    if (numberList[0] < numberList[1]) {
      numberList = swap(numberList[0], numberList[1]);
    }
    while (numberList[1] != 0) {
      numberList[0] %= numberList[1];
      numberList = swap(numberList[0], numberList[1]);
    }
    return numberList[0];
  }

  int nok(int firstNumber, int secondNumber) {
    return (firstNumber / nod2(firstNumber, secondNumber) * secondNumber)
        .toInt();
  }

  List<int> getMultiple(int number) {
    List<int> result = List.empty(growable: true);
    num currNumb = number;
    int probe = 2;
    while (currNumb != 1) {
      if (currNumb % probe != 0) {
        probe++;
      } else {
        currNumb = currNumb / probe;
        result.add(probe);
      }
    }
    return result;
  }
}
