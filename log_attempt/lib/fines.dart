import 'package:flutter/material.dart';

class LateRepaymentPenalty extends StatefulWidget {
  const LateRepaymentPenalty({super.key});

  @override
  _LateRepaymentPenaltyState createState() => _LateRepaymentPenaltyState();
}

class _LateRepaymentPenaltyState extends State<LateRepaymentPenalty> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  double _amount = 0.0;
  int _daysLate = 0;

  void _calculatePenalty() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        int num10DayPeriods = (_daysLate / 10).ceil();
        double penalty = _amount * (0.05 * num10DayPeriods);
        double totalAmount = _amount + penalty;

        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Late Repayment Penalty'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Amount: ${_amount.toStringAsFixed(2)}'),
                  Text('Days Late: $_daysLate'),
                  Text('Penalty: ${penalty.toStringAsFixed(2)}'),
                  Text('Total Amount Due: ${totalAmount.toStringAsFixed(2)}'),
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Close'),
                ),
              ],
            );
          },
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Late Repayment Penalty Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the amount';
                  }
                  return null;
                },
                onSaved: (value) {
                  _amount = double.parse(value!);
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Days Late'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the number of days late';
                  }
                  return null;
                },
                onSaved: (value) {
                  _daysLate = int.parse(value!);
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _calculatePenalty,
                child: const Text('Calculate Penalty'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
