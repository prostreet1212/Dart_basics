void main() {
  String input ='\"Это 57 строка 65 столбец\"';

print('Поиск чисел в строке $input\nНайденные числа: ${findNumbers(input)}');
}

List<num> findNumbers(String str){
  List<num> result=List.empty(growable: true);
  var strList=str.split(' ');
  for (var value in strList) {
    if(num.tryParse(value) is num){
      result.add(int.parse(value));
    }
  }
return result;
}