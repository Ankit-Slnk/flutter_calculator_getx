import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/calculator_controller.dart';
import '../widgets/calculator_button.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final calculatorController = Get.put(CalculatorController());

    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Calculator')),
      body: Column(
        children: [
          // Display the current expression and the result
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Obx(
                    () => Text(
                      calculatorController.expression.value,
                      style: const TextStyle(fontSize: 30),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Obx(
                    () => Text(
                      calculatorController.result.value,
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Calculator buttons
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.all(24),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: 20,
            itemBuilder: (context, index) {
              final buttonLabels = [
                '7',
                '8',
                '9',
                '/',
                '4',
                '5',
                '6',
                '*',
                '1',
                '2',
                '3',
                '-',
                'C',
                '0',
                '=',
                '+',
                'DEL',
                '.',
                '(',
                ')'
              ];

              final label = buttonLabels[index];
              return CalculatorButton(
                label: label,
                onPressed: () {
                  if (label == 'C') {
                    calculatorController.clear();
                  } else if (label == 'DEL') {
                    calculatorController.deleteLastCharacter();
                  } else if (label == '=') {
                    calculatorController.calculateResult();
                  } else {
                    calculatorController.addCharacter(label);
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
