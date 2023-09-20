import 'package:trotter/trotter.dart';

class Operator {
  final String symbol;
  final num Function(num, num) operation;

  final bool requiresParentheses;

  const Operator(this.symbol, this.operation, {this.requiresParentheses = false});

  @override
  String toString() => symbol;
}

List<Operator> operators = [
  Operator("+", (a, b) => a + b, requiresParentheses: true),
  Operator("-", (a, b) => a - b, requiresParentheses: true),
  Operator("*", (a, b) => a * b),
  Operator("/", (a, b) => a / b),
];

String? solve(List<num> values, num expected) {
  final solutions = _solve([], [12, 6, 6, 12], expected);

  for (final sol in solutions) {
    print(sol);
  }
}

class Operation {
  final num a;
  final num b;
  final Operator operator;
  final List<num> values;

  const Operation({
    required this.a,
    required this.b,
    required this.operator,
    required this.values,
  });

  @override
  String toString() => "$a $operator $b = ${values[0]}";
}

class Solution {
  final List<Operation> operations;

  const Solution(this.operations);

  @override
  String toString() => operations.join("\n");
}

Iterable<Solution> _solve(List<Operation> stack, List<num> values, num expected) sync* {
  final operations = generateOperations(values);

  for (final operation in operations) {
    final nextStack = [...stack, operation];

    if (operation.values.length == 1) {
      if (operation.values[0] == expected) {
        yield Solution(nextStack);
      }
    } else {
      yield* _solve(nextStack, operation.values, expected);
    }
  }
}

Iterable<Operation> generateOperations(List<num> values) sync* {
  final indexes = List<num>.generate(values.length, (i) => i);
  final combinationsIndexes = Combinations(2, indexes);

  for (final combination in combinationsIndexes.iterable) {
    for (final operator in operators) {
      final nextValues = List<num>.filled(values.length - 1, 0);

      final c1 = combination[0];
      final c2 = combination[1];

      for (int i = 0; i < values.length - 1; i++) {
        if (i == c1) {
          nextValues[i] = operator.operation(values[c1], values[c2]);
        } else if (i == c2) {
          continue;
        } else {
          nextValues[i] = values[i];
        }
      }

      yield Operation(
        a: values[c1],
        b: values[c2],
        operator: operator,
        values: nextValues,
      );
    }
  }
}
