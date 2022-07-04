
extension on num{

  double mabs(double x) {
    return (x < 0) ? -x : x;
  }

  double getPow(double num, int exp) {
    double result = num;
    for (int i = 1; i < exp; i++) {
      result = result * num;
    }
    return result;
  }

  num rootToDegree(int degree) {
    num A=this;
    int count = 0;
    if(A<0||degree<0){
      throw Exception('Входные значения должны быть больше 0');
    }else{
      //Начальное  приближенное значение (как его посчичтать Википедия молчит, поэтому так)
      double x = A / degree;
      while (mabs(A - getPow(x, degree)) > 0.00001) {
        x = (1 / degree) * ((degree - 1) * x + (A / (getPow(x, degree - 1))));
        //print(x);
        count++;
        if(count>10000){
          throw Exception('Не получилось извлечь корень из числа');
        }
      }
      print(count);
      return x;
    }

  }
}

void main() {
  num n=123;
  int degree=0;

print('Корень $degree-степени, числа $n равен:${n.rootToDegree(degree)}');


}






