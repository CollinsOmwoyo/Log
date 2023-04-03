import 'package:flutter/material.dart';

class RequestLoanActivity extends StatefulWidget {
  const RequestLoanActivity({super.key});

  @override
  _RequestLoanActivityState createState() => _RequestLoanActivityState();
}

class _RequestLoanActivityState extends State<RequestLoanActivity> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _loanAmountController = TextEditingController();
  TextEditingController _loanReasonController = TextEditingController();

  @override
  void dispose() {
    _loanAmountController.dispose();
    _loanReasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Request Loan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _loanAmountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Loan Amount',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a loan amount';
                  }
                  final amount = double.tryParse(value);
                  if (amount == null || amount <= 0) {
                    return 'Please enter a valid loan amount';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _loanReasonController,
                decoration: const InputDecoration(
                  labelText: 'Reason for Loan',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a reason for the loan';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final loanAmount = double.parse(_loanAmountController.text);
                    final loanReason = _loanReasonController.text;
                    // Code to handle loan request goes here
                    Navigator.pop(context);
                  }
                },
                child: const Text('Submit Request'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
