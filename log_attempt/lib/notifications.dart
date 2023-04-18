/*import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await tz.initializeTimeZones();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Notifications Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyScreen(),
    );
  }
}

class Reminder {
  final String name;
  final TimeOfDay time;

  Reminder(this.name, this.time);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Reminder &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          time == other.time;

  @override
  int get hashCode => name.hashCode ^ time.hashCode;

  @override
  String toString() {
    return 'Reminder{name: $name, time: $time}';
  }
}

class MyScreen extends StatefulWidget {
  @override
  _MyScreenState createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  final TextEditingController _nameController = TextEditingController();
  TimeOfDay _selectedTime = TimeOfDay.now();
  List<Reminder> _reminders = [];

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    var initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    var initializationSettingsIOS = IOSInitializationSettings();
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: _onSelectNotification);
  }

  Future<void> _onSelectNotification(String payload) async {
    debugPrint("Notification payload: $payload");
  }

  Future<void> _scheduleNotification(Reminder reminder) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      'channel_description',
      importance: Importance.max,
      priority: Priority.high,
    );
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    var time = Time(reminder.time.hour, reminder.time.minute, 0);
    var now = DateTime.now();
    var scheduledTime =
        DateTime(now.year, now.month, now.day, time.hour, time.minute);
    if (scheduledTime.isBefore(now)) {
      scheduledTime = scheduledTime.add(Duration(days: 1));
    }
    await flutterLocalNotificationsPlugin.zonedSchedule(
        reminder.hashCode,
        reminder.name,
        '',
        tz.TZDateTime.from(scheduledTime, tz.local),
        platformChannelSpecifics,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        payload: reminder.hashCode.toString());
  }

  void _addReminder() {
    if (_nameController.text.isNotEmpty) {
      setState(() {
        _reminders.add(Reminder(_nameController.text, _selectedTime));
        _nameController.text = '';
        _selectedTime = TimeOfDay.now();
      });
    }
  }

  void _deleteReminder(Reminder reminder) {
    setState(() {
      _reminders.remove(reminder);
    });
  }

  Widget _buildReminderList() {
    return ListView.builder(
        itemCount: _reminders.length,
        itemBuilder: (BuildContext context, int index) {
          Reminder reminder = _reminders[index];
          return ListTile(
            title: Text(reminder.name),
            subtitle: Text('Time: ${reminder.time.format(context)}'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _deleteReminder(reminder),
            ),
          );
        });
  }

  Widget _buildAddReminderDialog() {
    return AlertDialog(
      title: Text('Add Reminder'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: 'Reminder Name',
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: <Widget>[
              Text('Reminder Time:'),
              SizedBox(width: 16),
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    TimeOfDay selectedTime = await showTimePicker(
                      context: context,
                      initialTime: _selectedTime,
                    );
                    if (selectedTime != null) {
                      setState(() {
                        _selectedTime = selectedTime;
                      });
                    }
                  },
                  child: Text(
                    _selectedTime.format(context),
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      actions: <Widget>[
        ElevatedButton(
          child: Text('CANCEL'),
          onPressed: () => Navigator.pop(context),
        ),
        ElevatedButton(
          child: Text('ADD'),
          onPressed: () {
            _addReminder();
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Notifications Demo'),
      ),
      body: _buildReminderList(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return _buildAddReminderDialog();
            },
          );
        },
      ),
    );
  }
}
*/