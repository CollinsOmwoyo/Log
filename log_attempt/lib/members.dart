import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:random_string/random_string.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MembersActivity extends StatefulWidget {
  const MembersActivity({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MembersActivityState createState() => _MembersActivityState();
}

class _MembersActivityState extends State<MembersActivity> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _date = DateTime.now();
  List<Map<String, dynamic>> _members = [];
  late Database _database;
  String _phone = ('');

  @override
  void initState() {
    super.initState();
    _initializeDatabase();
  }

  void _initializeDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'members.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE members (
          id TEXT PRIMARY KEY,
          title TEXT,
          phone TEXT,
          date TEXT
        )
        ''');
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        //implement changes here
      },
    );

    _loadMembers();
  }

  void _loadMembers() async {
    final members = await _database.query('members');
    setState(() {
      _members = members;
    });
  }

  void _addMember(String title, String phone, DateTime date) async {
    final newMember = {
      'id': randomAlphaNumeric(5).toUpperCase(),
      'title': title,
      'phone': phone,
      'date': DateFormat('yyyy-MM-dd').format(date),
    };

    await _database.insert('members', newMember);

    _loadMembers();

    _titleController.clear();
    _amountController.clear();
    setState(() {
      _date = DateTime.now();
    });
  }

  void _deleteMember(String id) async {
    await _database.delete('members', where: 'id = ?', whereArgs: [id]);

    _loadMembers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Chama Membership'),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            child: DataTable(
              columns: const <DataColumn>[
                DataColumn(
                  label: Text('Member ID'),
                ),
                DataColumn(
                  label: Text('Member Name'),
                ),
                DataColumn(
                  label: Text('Phone'),
                ),
                DataColumn(
                  label: Text('Date Joined'),
                ),
                DataColumn(
                  label: Text('Role'),
                ),
              ],
              rows: _members
                  .map(
                    (member) => DataRow(
                      cells: <DataCell>[
                        DataCell(Text(member['id'])),
                        DataCell(Text(member['title'])),
                        DataCell(Text(member['phone'] ?? 'Missing')),
                        DataCell(Text(member['date'].toString())),
                        DataCell(
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              _deleteMember(member['id']);
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Add Member'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        decoration: const InputDecoration(labelText: 'Member'),
                        controller: _titleController,
                      ),
                      TextField(
                        decoration: const InputDecoration(labelText: 'Phone'),
                        keyboardType: TextInputType.phone,
                        onChanged: (value) => setState(() => _phone = value),
                      ),
                      ListTile(
                        title: const Text('Date'),
                        subtitle:
                            Text('${_date.year}-${_date.month}-${_date.day}'),
                        onTap: () async {
                          final selectedDate = await showDatePicker(
                            context: context,
                            initialDate: _date,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                          );
                          if (selectedDate != null) {
                            setState(() {
                              _date = selectedDate;
                            });
                          }
                        },
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        _titleController.clear();
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        _addMember(_titleController.text, _phone, _date);
                        _titleController.clear();
                        setState(() {
                          _phone;
                          _date = DateTime.now();
                        });
                        Navigator.of(context).pop();
                      },
                      child: const Text('Add'),
                    ),
                  ],
                );
              },
            );
          },
          child: const Icon(Icons.add),
        ));
  }
}
