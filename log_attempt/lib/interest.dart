import 'package:flutter/material.dart';

class InterestCalculator extends StatefulWidget {
  const InterestCalculator({super.key});

  @override
  _InterestCalculatorState createState() => _InterestCalculatorState();
}

class _InterestCalculatorState extends State<InterestCalculator> {
  TextEditingController _amountController = TextEditingController();
  TextEditingController _interestRateController = TextEditingController();
  double _interestDue = 0;

  void _calculateInterest() {
    double amount = double.parse(_amountController.text);
    double interestRate = double.parse(_interestRateController.text);
    double interestDue = (amount * interestRate) / 100;
    setState(() {
      _interestDue = interestDue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interest Calculator'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Amount',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _interestRateController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Interest Rate',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _calculateInterest,
              child: const Text('Calculate Interest'),
            ),
            const SizedBox(height: 16),
            Text(
              'Interest Due: $_interestDue',
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
