void main() {
  const valueFrom = -4.0;
  const valueTo = 5.0;
  const step = 0.25;

  print("y = (x - 3) / (4 + x)\n");

  var x = valueFrom + step; // межа -4 виключена
  var sum = 0.0;

  while (x < valueTo) {
    final y = calc(x);
    print("x = $x, (x - 3) / (4 + x) = $y");
    sum += y;
    x += step;
  }

  print("\nsum = $sum");
}

double calc(double x) {
  return (x - 3) / (4 + x);
}