void main() {
  MapInList mapInList = MapInList();
  List<String> list = [
    'one',
    'two',
    'three',
    'one',
    'one',
    'four',
    'three',
    'one',
    'five',
    'three',
    'two'
  ];
  mapInList.getMapFromList(list).forEach((key, value) {
    print('Слово\"$key\" встречается $value раз(а)');
  });
}

class MapInList {
  Map<String, int> getMapFromList(List<String> str) {
    var map = <String, int>{};
    int count = 1;

    for (int i = 0; i < str.length - 1; i++) {
      for (int j = i + 1; j < str.length; j++) {
        if (str[i] == str[j]) {
          count++;
          str.removeAt(j);
          j--;
        }
        if (j == str.length - 1) {
          var v = {str[i]: count};
          map.addAll(v);
          count = 1;
          str.removeAt(0);
          i--;
        }
        if (str.length == 1) {
          var v = {str[0]: count};
          map.addAll(v);
        }
      }
    }
    return map;
  }
}
