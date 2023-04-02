import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'membertransactions.dart';
import 'homepage.dart';

class AlterPage extends StatelessWidget {
  const AlterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Karibu Member'),
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
                      MdiIcons.account,
                      'Balances',
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AlterPage()),
                        );
                      },
                    ),
                    _buildCard(
                      context,
                      Colors.green,
                      MdiIcons.cashSync,
                      'Loans',
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TransactionPage()),
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
                      Colors.orange,
                      MdiIcons.cashClock,
                      'Payments',
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DailyPage()),
                        );
                      },
                    ),
                    _buildCard(
                      context,
                      Colors.deepPurple,
                      MdiIcons.bankOutline,
                      'Shares',
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
                      MdiIcons.cashClock,
                      'Payments',
                      () {},
                    ),
                    _buildCard(
                      context,
                      Colors.deepPurple,
                      MdiIcons.bankOutline,
                      'Shares',
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
                  style: TextStyle(
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
