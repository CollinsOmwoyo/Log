import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MemberPage extends StatelessWidget {
  const MemberPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Karibu Member'),
        centerTitle: true,
      ),
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Card(
                  color: Colors.blueGrey,
                  child: InkWell(
                    onTap: () {},
                    splashColor: Colors.blue.withAlpha(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Icon(
                          MdiIcons.account,
                          size: 120.0,
                          color: Colors.white,
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Balances',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30.0,
                ),
                Card(
                  color: Colors.green,
                  child: InkWell(
                    onTap: () {},
                    splashColor: Colors.green.withAlpha(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Icon(
                          MdiIcons.cashSync,
                          size: 120.0,
                          color: Colors.white,
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Loans',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Card(
                  color: Colors.orange,
                  child: InkWell(
                    onTap: () {},
                    splashColor: Colors.orange.withAlpha(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Icon(
                          MdiIcons.cashClock,
                          size: 120.0,
                          color: Colors.white,
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Payments',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30.0,
                ),
                Card(
                  color: Colors.deepPurple,
                  child: InkWell(
                    onTap: () {},
                    splashColor: Colors.deepPurple.withAlpha(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Icon(
                          MdiIcons.bankOutline,
                          size: 120.0,
                          color: Colors.white,
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Shares',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Card(
                  color: Colors.orange,
                  child: InkWell(
                    onTap: () {},
                    splashColor: Colors.orange.withAlpha(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Icon(
                          MdiIcons.cashClock,
                          size: 120.0,
                          color: Colors.white,
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Payments',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30.0,
                ),
                Card(
                  color: Colors.deepPurple,
                  child: InkWell(
                    onTap: () {},
                    splashColor: Colors.deepPurple.withAlpha(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Icon(
                          MdiIcons.bankOutline,
                          size: 120.0,
                          color: Colors.white,
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Shares',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
