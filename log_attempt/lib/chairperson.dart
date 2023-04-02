import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ChairPersonPage extends StatelessWidget {
  const ChairPersonPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  child: InkWell(
                    onTap: () {},
                    splashColor: Colors.blue.withAlpha(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Icon(
                          MdiIcons.account,
                          size: 50.0,
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Members',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 40.0,
                ),
                Card(
                  child: InkWell(
                    onTap: () {},
                    splashColor: Colors.blue.withAlpha(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Icon(
                          MdiIcons.clipboardAccount,
                          size: 60.0,
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Ledger',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
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
                  child: InkWell(
                    onTap: () {},
                    splashColor: Colors.blue.withAlpha(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Icon(
                          MdiIcons.cashClock,
                          size: 60.0,
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Fines',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
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
                  child: InkWell(
                    onTap: () {},
                    splashColor: Colors.blue,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: <Widget>[
                        const Icon(
                          MdiIcons.calculator,
                          size: 60.0,
                        ),
                        const SizedBox(height: 10.0),
                        const Text(
                          'Calculator',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
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
