import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:random_string/random_string.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() {
  runApp(const MyTransactions());
}

class MyTransactions extends StatelessWidget {
  const MyTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Transactions',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const TransactionHistory(),
    );
  }
}

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TransactionHistoryState createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _date = DateTime.now();
  List<Map<String, dynamic>> _transactions = [];
  late Database _database;
  double _amount = 0.0;

  @override
  void initState() {
    super.initState();
    _initializeDatabase();
  }

  void _initializeDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'transactions.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE transactions (
          id TEXT PRIMARY KEY,
          title TEXT,
          amount REAL,
          date TEXT
        )
        ''');
      },
    );

    _loadTransactions();
  }

  void _loadTransactions() async {
    final transactions = await _database.query('transactions');
    setState(() {
      _transactions = transactions;
    });
  }

  void _addTransaction(String title, double amount, DateTime date) async {
    final newTransaction = {
      'id': randomAlphaNumeric(5).toUpperCase(),
      'title': title,
      'amount': amount,
      'date': DateFormat('yyyy-MM-dd').format(date),
    };

    await _database.insert('transactions', newTransaction);

    _loadTransactions();

    _titleController.clear();
    _amountController.clear();
    setState(() {
      _date = DateTime.now();
    });
  }

  void _deleteTransaction(String id) async {
    await _database.delete('transactions', where: 'id = ?', whereArgs: [id]);

    _loadTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Transaction History'),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            child: DataTable(
              columns: const <DataColumn>[
                DataColumn(
                  label: Text('Ledger ID'),
                ),
                DataColumn(
                  label: Text('Member'),
                ),
                DataColumn(
                  label: Text('Amount'),
                ),
                DataColumn(
                  label: Text('Date'),
                ),
                DataColumn(
                  label: Text('Actions'),
                ),
              ],
              rows: _transactions
                  .map(
                    (transaction) => DataRow(
                      cells: <DataCell>[
                        DataCell(Text(transaction['id'])),
                        DataCell(Text(transaction['title'])),
                        DataCell(Text(transaction['amount'].toString())),
                        DataCell(Text(transaction['date'].toString())),
                        DataCell(
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              _deleteTransaction(transaction['id']);
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
                  title: const Text('Add Transaction'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        decoration: const InputDecoration(labelText: 'Member'),
                        controller: _titleController,
                      ),
                      TextField(
                        decoration: const InputDecoration(labelText: 'Amount'),
                        keyboardType: TextInputType.number,
                        onChanged: (value) =>
                            _amount = double.tryParse(value) ?? 0.0,
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
                        _addTransaction(_titleController.text, _amount, _date);
                        _titleController.clear();
                        setState(() {
                          _amount = 0.0;
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
