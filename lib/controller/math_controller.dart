import 'package:math_expressions/math_expressions.dart';

class MathController {
  String equation = "";
  String result = "";
  List<String> results = [];

  void addNumber(String num) {
    if (num == '.' && equation.endsWith('.')) {
      equation = equation.substring(0, equation.length - 1);
      return;
    }
    equation += num;
  }

  //! Handle Basic Logic
  void addOperator(String op) {
    if (equation.isEmpty) {
      if (op == '-') {
        equation += op;
      }
      return;
    }

    //! get lastChar to check if it operator or no --> if operator remove it
    final String lastChar = equation[equation.length - 1];
    if ('+-/x%'.contains(lastChar)) {
      equation = equation.substring(0, equation.length - 1) + op;
    } else {
      equation += op;
    }
  }

  void clear() {
    equation = "";
    result = "";
  }

  void backSpace() {
    if (equation.isEmpty) return;
    equation = equation.substring(0, equation.length - 1);
  }

  void toggleSign() {
    if (equation.isEmpty) return;

    if (equation.startsWith('-')) {
      equation = equation.substring(1);
    } else {
      equation = '-$equation';
    }
  }

  void evaluate() {
    if (equation.isEmpty) return;

    String expStr = equation.replaceAll('x', '*').replaceAll('%', '/100');

    try {
      ShuntingYardParser parser = ShuntingYardParser();
      Expression exp = parser.parse(expStr);

      var evaluator = RealEvaluator(ContextModel());
      num eval = evaluator.evaluate(exp);

      result = eval.toString(); // النتيجة
      results.add('$equation = $result');
    } catch (e) {
      result = "please enter a valid equation";
    }
  }
}
