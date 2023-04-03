import 'dart:math';

import 'package:flutter/material.dart';
import 'memberscontainer.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Member Containers',
      home: AdminMemberPage(),
    );
  }
}

class AdminMemberPage extends StatefulWidget {
  const AdminMemberPage({Key? key}) : super(key: key);

  @override
  _MemberPageState createState() => _MemberPageState();
}

class _MemberPageState extends State<AdminMemberPage> {
  List<Member> members = [];

  final nameController = TextEditingController();
  final contributionsController = TextEditingController();
  final shareValueController = TextEditingController();
  final loanAmountController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    contributionsController.dispose();
    shareValueController.dispose();
    loanAmountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Members'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: members.length,
              itemBuilder: (context, index) {
                return MemberContainer(
                  member: members[index],
                  onDelete: () {
                    setState(() {
                      members.removeAt(index);
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: TextButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Add Member'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: 'Name',
                      ),
                    ),
                    TextField(
                      controller: contributionsController,
                      decoration: const InputDecoration(
                        labelText: 'Contributions',
                      ),
                    ),
                    TextField(
                      controller: shareValueController,
                      decoration: const InputDecoration(
                        labelText: 'Share Value',
                      ),
                    ),
                    TextField(
                      controller: loanAmountController,
                      decoration: const InputDecoration(
                        labelText: 'Loan Amount',
                      ),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        members.add(
                          Member(
                            name: nameController.text,
                            groupId: _generateRandomString(5),
                            contributions: double.parse(
                              contributionsController.text,
                            ),
                            shareValue: double.parse(
                              shareValueController.text,
                            ),
                            loanAmount: double.parse(
                              loanAmountController.text,
                            ),
                          ),
                        );
                      });
                      nameController.clear();
                      contributionsController.clear();
                      shareValueController.clear();
                      loanAmountController.clear();
                      Navigator.pop(context);
                    },
                    child: const Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  String _generateRandomString(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random.secure();
    return List.generate(length, (index) => chars[random.nextInt(chars.length)])
        .join();
  }
}
