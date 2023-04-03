import 'package:flutter/material.dart';

class TransactionPage extends StatelessWidget {
  final List<Map<String, dynamic>> _contributions = [
    {"date": "2023-04-03", "type": "Loan", "amount": 1000},
    {"date": "2023-03-11", "type": "Monthly Contribution", "amount": 5000},
    {"date": "2023-03-06", "type": "Loan", "amount": 2000},
    {"date": "2023-03-09", "type": "Membership Dues", "amount": 500},
    {"date": "2023-02-01", "type": "Penalties", "amount": 750},
    {"date": "2023-02-11", "type": "Loan", "amount": 2500},
    {"date": "2023-01-21", "type": "Monthly Contribution", "amount": 5000},
    {"date": "2022-08-01", "type": "Donation", "amount": 1000},
    {"date": "2022-09-01", "type": "Membership Dues", "amount": 500},
    {"date": "2022-10-01", "type": "Penalties", "amount": 500},
    {"date": "2022-11-01", "type": "Monthly Contribution", "amount": 5000},
    {"date": "202-12-01", "type": "Penalties", "amount": 100},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contribution History"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _contributions.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Date: ${_contributions[index]['date']}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Type: ${_contributions[index]['type']}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Amount: ${_contributions[index]['amount']}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
