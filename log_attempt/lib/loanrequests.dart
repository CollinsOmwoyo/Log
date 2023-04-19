import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class MemberCard extends StatelessWidget {
  final String name;
  final String group;
  final String shares;
  final String loanAmount;
  final VoidCallback onReject;
  final VoidCallback onApprove;

  const MemberCard({
    Key? key,
    required this.name,
    required this.group,
    required this.shares,
    required this.loanAmount,
    required this.onReject,
    required this.onApprove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.person),
                SizedBox(width: 8),
                Text(name),
              ],
            ),
            SizedBox(height: 8),
            Text('Group ID: $group'),
            SizedBox(height: 8),
            Text('Shares: $shares'),
            SizedBox(height: 8),
            Text('Loan Amount: $loanAmount'),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: onReject,
                  child: Text('Reject'),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: onApprove,
                  child: Text('Approve'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RequestScreen extends StatelessWidget {
  const RequestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Members'),
      ),
      body: Theme(
        data: ThemeData(
          primaryColor: Colors.amber,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.amber),
        ),
        child: ListView.builder(
          itemCount: 10, // Replace with actual member count
          itemBuilder: (BuildContext context, int index) {
            return MemberCard(
              name: 'Member ${index + 1}',
              group: 'Group ${index % 3 + 1}',
              shares: '${index + 1}',
              loanAmount: '${1000 * (index + 1)}',
              onReject: () {
                // TODO: Implement reject action
              },
              onApprove: () {
                // TODO: Implement approve action
              },
            );
          },
        ),
      ),
    );
  }
}
