import 'package:flutter/material.dart';
import 'requestloan.dart';

class LoansActivity extends StatefulWidget {
  const LoansActivity({super.key});

  @override
  _LoansActivityState createState() => _LoansActivityState();
}

class _LoansActivityState extends State<LoansActivity> {
  // Sample data for loans
  List<Map<String, dynamic>> _currentLoans = [
    {
      'loanNumber': 'LN001',
      'amount': 1000.0,
      'dueDate': DateTime.now().add(const Duration(days: 10)),
      'status': 'Current',
    },
    {
      'loanNumber': 'LN002',
      'amount': 2000.0,
      'dueDate': DateTime.now().add(const Duration(days: 15)),
      'status': 'Current',
    },
  ];

  List<Map<String, dynamic>> _loanHistory = [
    {
      'loanNumber': 'LN003',
      'amount': 500.0,
      'dueDate': DateTime(2022, 3, 25),
      'status': 'Paid',
    },
    {
      'loanNumber': 'LN004',
      'amount': 1500.0,
      'dueDate': DateTime(2022, 4, 1),
      'status': 'Late',
    },
    {
      'loanNumber': 'LN005',
      'amount': 1000.0,
      'dueDate': DateTime(2022, 4, 10),
      'status': 'Paid',
    },
    {
      'loanNumber': 'LN006',
      'amount': 2000.0,
      'dueDate': DateTime(2022, 4, 15),
      'status': 'Current',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Chama Loans'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.amber,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Current Loans',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        _buildCurrentLoans(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Loan History',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            _buildLoanHistory(),
            const SizedBox(height: 16.0),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Request Loan',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            _buildRequestLoan(),
          ],
        ),
      ),
    );
  }

  Widget _buildRequestLoan() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RequestLoanActivity(),
            ),
          );
        },
        child: Text('Request Loan'),
      ),
    );
  }

  Widget _buildLoanHistory() {
    if (_loanHistory.isEmpty) {
      return Text('No loan history');
    } else {
      return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: _loanHistory.length,
        itemBuilder: (BuildContext context, int index) {
          final loan = _loanHistory[index];
          return ListTile(
            title: Text('Loan Number: ${loan['loanNumber']}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Amount: ${loan['amount']}'),
                Text('Due Date: ${loan['dueDate']}'),
                Text('Status: ${loan['status']}'),
              ],
            ),
          );
        },
      );
    }
  }

  Widget _buildCurrentLoans() {
    if (_currentLoans.isEmpty) {
      return const Text('No current loans');
    } else {
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _currentLoans.length,
        itemBuilder: (BuildContext context, int index) {
          final loan = _currentLoans[index];
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Loan Number: ${loan['loanNumber']}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Amount: ${loan['amount']}',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Due Date: ${loan['dueDate'].toString().substring(0, 10)}',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Status: ${loan['status']}',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }
}
