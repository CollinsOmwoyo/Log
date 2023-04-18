import 'package:flutter/material.dart';
import 'adminmembers.dart';
import 'addmembers.dart';

class Member {
  final String name;
  final String groupId;
  final double contributions;
  final double shareValue;
  final double loanAmount;

  Member({
    required this.name,
    required this.groupId,
    required this.contributions,
    required this.shareValue,
    required this.loanAmount,
  });
}

class MemberContainer extends StatefulWidget {
  const MemberContainer(
      {Key? key, required Null Function() onDelete, required Member member})
      : super(key: key);

  @override
  _MemberContainerState createState() => _MemberContainerState();
}

class _MemberContainerState extends State<MemberContainer> {
  List<Member> _members = [
    Member(
      name: 'John Doe',
      groupId: 'G001',
      contributions: 100.0,
      shareValue: 10.0,
      loanAmount: 50.0,
    ),
    Member(
      name: 'Jane Smith',
      groupId: 'G001',
      contributions: 50.0,
      shareValue: 10.0,
      loanAmount: 0.0,
    ),
  ];

  void _addMember(Member newMember) {
    setState(() {
      _members.add(newMember);
    });
  }

  void _deleteMember(Member memberToDelete) {
    setState(() {
      _members.remove(memberToDelete);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Member List'),
      ),
      body: ListView.builder(
        itemCount: _members.length,
        itemBuilder: (BuildContext context, int index) {
          final member = _members[index];
          return ListTile(
            leading: const Icon(Icons.person),
            title: Text(member.name),
            subtitle: Text('Group ID: ${member.groupId}\n'
                'Contributions: ${member.contributions}\n'
                'Share Value: ${member.shareValue}\n'
                'Loan Amount: ${member.loanAmount}'),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                _deleteMember(member);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newMember = await showDialog<Member>(
            context: context,
            builder: (BuildContext context) {
              return const AddMemberDialog();
            },
          );
          if (newMember != null) {
            _addMember(newMember);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
