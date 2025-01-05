import 'package:get/get.dart';
import 'package:expressions/expressions.dart'; // Import the expressions package

class CalculatorController extends GetxController {
  var expression = ''.obs; // The expression entered by the user
  var result = ''.obs; // The calculated result

  // Add a character (digit or operator) to the expression
  void addCharacter(String character) {
    expression.value += character;
  }

  // Clear the expression and result
  void clear() {
    expression.value = '';
    result.value = '';
  }

  // Delete the last character in the expression
  void deleteLastCharacter() {
    if (expression.value.isNotEmpty) {
      expression.value =
          expression.value.substring(0, expression.value.length - 1);
    }
  }

  // Evaluate the expression and update the result
  void calculateResult() {
    result.value = _calculateResult(expression.value);
  }

  // Helper function to evaluate the expression
  String _calculateResult(String expression) {
    try {
      final exp = Expression.parse(expression); // Parse the expression
      const evaluator = ExpressionEvaluator();
      final evaluationResult =
          evaluator.eval(exp, {}); // Evaluate the parsed expression

      if (evaluationResult is double || evaluationResult is int) {
        return evaluationResult.toString(); // Convert the result to a string
      } else {
        return 'Error'; // Return "Error" for invalid results
      }
    } catch (e) {
      return 'Error'; // If the evaluation fails, return "Error"
    }
  }
}
