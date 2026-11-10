// file: main.dart
import 'calc.dart';

void main() {
  final processor = Calc(0.5);

  // 1) діапазон за замовчуванням [-5, 5]
  processor.runCalc();
  print("\nmin = ${processor.min}");
  print("max = ${processor.max}");

  // 2) змінений діапазон
  print("\n--- setRange(-2, 2) ---\n");
  processor.setRange(-2, 2);
  processor.runCalc();
  print("\nmin = ${processor.min}");
  print("max = ${processor.max}");
}