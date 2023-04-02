import 'package:flutter/material.dart';
import 'database.dart';
import 'treasurer.dart';
import 'homepage.dart';
import 'chairperson.dart';
import 'member.dart';
import 'register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Colors.amberAccent;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'M_CHAMA',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/login': (context) => const LoginPage(),
        '/treasurer': (context) => const TreasurerPage(),
        '/chairperson': (context) => const ChairPersonPage(),
        '/member': (context) => const MemberPage(),
        '/register': (context) => const RegisterPage(),
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _authenticateUser() async {
    setState(() {
      _isLoading = true;
    });

    String email = _emailController.text;
    String password = _passwordController.text;

    DatabaseHelper databaseHelper = DatabaseHelper();
    User? user = await databaseHelper.authenticate(email, password);

    if (user != null) {
      // Authentication successful
      // Navigate to the appropriate screen based on user role
      if (user.role == 'treasurer') {
        Navigator.pushReplacementNamed(context, '/treasurer');
      } else if (user.role == 'chairperson') {
        Navigator.pushReplacementNamed(context, '/chairperson');
      } else {
        Navigator.pushReplacementNamed(context, '/member');
      }
    } else {
      // Authentication failed
      showDialog(
          context: context,
          builder: (BuildContext dialogContext) {
            return AlertDialog(
              title: const Text('Authentication failed'),
              content: const Text('Invalid email or password'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(dialogContext).pop();
                    },
                    child: const Text('OK'))
              ],
            );
          });
    }

    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _registerUser() async {
    // Navigate to registration screen
    Navigator.pushNamed(context, '/register');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chama Login'),
        centerTitle: true,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          labelText: 'Email', border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          labelText: 'Password', border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _authenticateUser();
                        }
                      },
                      child: const Text('Login'),
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: _registerUser,
                      child: const Text('Register'),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
