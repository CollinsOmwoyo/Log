import 'package:flutter/material.dart';

class ShareTable extends StatefulWidget {
  final List<Member> members;

  const ShareTable({required this.members});

  @override
  _ShareTableState createState() => _ShareTableState();
}

class _ShareTableState extends State<ShareTable> {
  List<Member> _members = [];

  @override
  void initState() {
    super.initState();
    _members = widget.members;
  }

  void _showDialog(Member? member) {
    String name = member?.name ?? '';
    double shares = member?.shares ?? 0;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(member == null ? 'Add Member' : 'Edit Member'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: 'Name'),
                  onChanged: (value) {
                    name = value;
                  },
                  controller: TextEditingController(text: name),
                ),
                SizedBox(height: 16.0),
                TextField(
                  decoration: InputDecoration(labelText: 'Shares'),
                  onChanged: (value) {
                    shares = double.tryParse(value) ?? 0;
                  },
                  keyboardType: TextInputType.number,
                  controller: TextEditingController(text: shares.toString()),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('CANCEL'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('SAVE'),
              onPressed: () {
                if (member == null) {
                  _members.add(Member(name: name, shares: shares));
                } else {
                  member.name = name;
                  member.shares = shares;
                }
                setState(() {});
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double totalShares = _members.fold(0, (acc, member) => acc + member.shares);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: DataTable(
              columns: [
                DataColumn(label: Text('Member')),
                DataColumn(label: Text('Shares')),
                DataColumn(label: Text('% of Total')),
                DataColumn(label: Text('Edit')),
              ],
              rows: _members.map((member) {
                double percentage = (member.shares / totalShares) * 100;
                return DataRow(
                  cells: [
                    DataCell(Text(member.name)),
                    DataCell(Text(member.shares.toString())),
                    DataCell(Text(percentage.toStringAsFixed(2))),
                    DataCell(
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          _showDialog(member);
                        },
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
        ElevatedButton(
          child: Text('Add Member'),
          onPressed: () {
            _showDialog(null);
          },
        ),
      ],
    );
  }
}

class Member {
  String name;
  double shares;

  Member({required this.name, required this.shares});
}
