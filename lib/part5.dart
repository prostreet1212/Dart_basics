void main() {
  FindNumbers fn = FindNumbers();
  var input = ['one', 'two', 'three', 'cat', 'dog','zero', 'eight','ball','log','two','dart'];

  print('Список: ${input}, содержит следующие цифры: ${fn.findNumbersInList(input)}');
}

class FindNumbers {
  static final List<String> numbers = [
    'zero',
    'one',
    'two',
    'three',
    'four',
    'five',
    'six',
    'seven',
    'eight',
    'nine'
  ];

  Set<int> findNumbersInList(List<String> str) {
    Set<int> result = {};
    str.forEach((element) {
      if (getNumberFromString(element) != -1) {
        result.add(getNumberFromString(element));
      }
      //или
      /*if (numbers.contains(element)) {
        result.add(getNumberFromString(element));
      }*/
    });
    return result;
  }

  int getNumberFromString(String s) {
    if (s == numbers[0]) {
      return 0;
    } else if (s == numbers[1]) {
      return 1;
    } else if (s == numbers[2]) {
      return 2;
    } else if (s == numbers[3]) {
      return 3;
    } else if (s == numbers[4]) {
      return 4;
    } else if (s == numbers[5]) {
      return 5;
    } else if (s == numbers[6]) {
      return 6;
    } else if (s == numbers[7]) {
      return 7;
    } else if (s == numbers[8]) {
      return 8;
    } else if (s == numbers[9]) {
      return 9;
    } else {
      return -1;
    }
  }
}
