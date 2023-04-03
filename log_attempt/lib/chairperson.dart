import 'package:flutter/material.dart';
import 'package:log_attempt/tranactions.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'membertransactions.dart';
import 'alter.dart';
import 'adminmembers.dart';
import 'members.dart';
import 'chamacalculations.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Administrator Account'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _buildCard(
                      context,
                      Colors.blueGrey,
                      MdiIcons.accountMultipleCheckOutline,
                      'Chama Accounts',
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MembersActivity()),
                        );
                      },
                    ),
                    _buildCard(
                      context,
                      Colors.green,
                      MdiIcons.cashLockOpen,
                      'Loan Requests',
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoansActivity()),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              SizedBox(
                height: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _buildCard(
                      context,
                      Colors.brown,
                      MdiIcons.clipboardAccountOutline,
                      'Chama Ledger',
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TransactionHistory()),
                        );
                      },
                    ),
                    _buildCard(
                      context,
                      Colors.deepOrange,
                      MdiIcons.accountDetailsOutline,
                      'Member Shares',
                      () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              SizedBox(
                height: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _buildCard(
                      context,
                      Colors.orange,
                      MdiIcons.calculatorVariant,
                      'Calculator',
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const AdminCalculatorScreen()),
                        );
                      },
                    ),
                    _buildCard(
                      context,
                      Colors.deepPurple,
                      MdiIcons.alertPlusOutline,
                      'Manage Notifications',
                      () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, Color color, IconData icon,
      String text, Function() onTap) {
    return SizedBox(
      width: 160,
      child: Card(
        color: color,
        child: InkWell(
          onTap: onTap,
          splashColor: Colors.white.withOpacity(0.3),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(
                  icon,
                  size: 80.0,
                  color: Colors.white,
                ),
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
