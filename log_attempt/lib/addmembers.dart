import 'package:flutter/material.dart';
import 'memberscontainer.dart';

class AddMemberDialog extends StatefulWidget {
  const AddMemberDialog({Key? key}) : super(key: key);

  @override
  _AddMemberDialogState createState() => _AddMemberDialogState();
}

class _AddMemberDialogState extends State<AddMemberDialog> {
  late String _name;
  late String _groupId;
  late double _contributions;
  late double _shareValue;
  late double _loanAmount;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add New Member'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a name';
                }
                return null;
              },
              onSaved: (value) {
                _name = value!;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Group ID'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a group ID';
                }
                return null;
              },
              onSaved: (value) {
                _groupId = value!;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Contributions'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a contribution amount';
                }
                return null;
              },
              onSaved: (value) {
                _contributions = double.parse(value!);
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Share Value'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a share value';
                }
                return null;
              },
              onSaved: (value) {
                _shareValue = double.parse(value!);
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Loan Amount'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a loan amount';
                }
                return null;
              },
              onSaved: (value) {
                _loanAmount = double.parse(value!);
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              final newMember = Member(
                name: _name,
                groupId: _groupId,
                contributions: _contributions,
                shareValue: _shareValue,
                loanAmount: _loanAmount,
              );
              Navigator.of(context).pop(newMember);
            }
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}
