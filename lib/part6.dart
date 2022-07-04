import 'dart:math';

void main() {
  Point point1 = Point(1, 2, 3);
  Point point2 = Point(10, 11, 12);
  print('Расстояние между точками: ${point1.distanceTo(point2)}');

  Point p = Point.zero();
  Point pOne = Point.one();

  Point p1 = Point(1, 1, 1);
  Point p2 = Point(1, 2, 3);
  Point p3 = Point(8, 2, 3);
  print('Площадь треугольника: ${Point.empty().getSuare(p1, p2, p3).toStringAsFixed(2)}');
}

class Point {
  late double x;
  late double y;
  late double z;

  Point(this.x, this.y, this.z);

  Point.empty();

  Point.forXY(this.x, this.y);

  Point.zero() {
    x = 0;
    y = 0;
    y = 0;
  }

  factory Point.one() {
    return Point(1, 1, 1);
  }

  Point.named({required double x, required double y, required double z});

  factory Point.fromJson(Map<String, dynamic> json) {
    return Point.named(
      x: double.parse(json["x"]),
      y: double.parse(json["y"]),
      z: double.parse(json["z"]),
    );
  }

  double distanceTo(Point p) {
    var distance =
        sqrt(pow((p.x - x), 2) + pow((p.y - y), 2) + pow((p.z - z), 2));
    return double.parse(distance.toStringAsFixed(2));
  }

  double getSuare(Point p1, Point p2, Point p3) {
    var AB=sqrt(pow((p1.x-p2.x), 2)+pow((p1.z-p2.z), 2)+pow((p1.y-p2.y), 2));
    var BC=sqrt(pow((p2.x-p3.x), 2)+pow((p2.z-p3.z), 2)+pow((p2.y-p3.y), 2));
    var AC=sqrt(pow((p1.x-p3.x), 2)+pow((p1.z-p3.z), 2)+pow((p1.y-p3.y), 2));
    var P=(AB+BC+AC)/2;
    var S=sqrt((P-AB)*(P-AC)*(P-BC)*P);

    return S;
  }
}
