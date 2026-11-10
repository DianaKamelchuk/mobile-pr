// file: calc.dart
class Calc {
  double _rangeFrom = -5.0; // діапазон за замовчуванням [-5, 5]
  double _rangeTo = 5.0;
  final double step;

  double? _min;
  double? _max;

  /// Крок табулювання вказується в конструкторі
  Calc(this.step);

  double? get min => _min;
  double? get max => _max;

  /// Зміна діапазону табулювання (межі включно)
  void setRange(double from, double to) {
    _rangeFrom = from;
    _rangeTo = to;
  }

  /// Табулювання функції циклом for
  void runCalc() {
    _min = null;
    _max = null;

    final count = ((_rangeTo - _rangeFrom) / step + 1e-9).floor();

    print("y = x^3 - x^2 - x");
    print("range: [$_rangeFrom, $_rangeTo], step: $step\n");

    for (var i = 0; i <= count; i++) {
      final x = _rangeFrom + i * step;
      final y = _calc(x);
      print("x = $x, y = $y");

      if (_min == null || y < _min!) _min = y;
      if (_max == null || y > _max!) _max = y;
    }
  }

  double _calc(double x) {
    return x * x * x - x * x - x;
  }
}