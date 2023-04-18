import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MemberShare {
  final String memberId;
  final double amount;

  MemberShare(this.memberId, this.amount);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Member Shares Activity',
      home: MemberSharesScreen(),
    );
  }
}

class MemberSharesScreen extends StatefulWidget {
  @override
  _MemberSharesScreenState createState() => _MemberSharesScreenState();
}

class _MemberSharesScreenState extends State<MemberSharesScreen> {
  List<MemberShare> memberShares = [
    MemberShare('Abigael Ondieki', 100),
    MemberShare('Collins Omwoyo', 200),
    MemberShare('Mercy Ngetich', 300),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Member Shares'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: memberShares.length,
        itemBuilder: (context, index) {
          final memberShare = memberShares[index];
          return ListTile(
            title: Text(memberShare.memberId),
            subtitle: Text('${memberShare.amount}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Show a dialog to input the member share details
          showDialog(
            context: context,
            builder: (context) {
              final memberIdController = TextEditingController();
              final amountController = TextEditingController();

              return AlertDialog(
                title: Text('Add Member Share'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: memberIdController,
                      decoration: InputDecoration(
                        labelText: 'Member ID',
                      ),
                    ),
                    TextField(
                      controller: amountController,
                      decoration: InputDecoration(
                        labelText: 'Amount',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      // Add the new member share to the list
                      final memberId = memberIdController.text;
                      final amount =
                          double.tryParse(amountController.text) ?? 0;
                      setState(() {
                        memberShares.add(MemberShare(memberId, amount));
                      });
                      Navigator.pop(context);
                    },
                    child: Text('Add'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
