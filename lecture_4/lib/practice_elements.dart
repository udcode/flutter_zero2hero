import 'package:flutter/material.dart';

import 'elements_main.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: Scaffold(
        appBar: AppBar(title: Text('Settings Form')),
        body: SettingsForm(
          isDarkMode: _isDarkMode,
          onDarkModeChanged: (value) {
            setState(() {
              _isDarkMode = value;
            });
          },
        ),
      ),
    );
  }
}

class SettingsForm extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onDarkModeChanged;

  const SettingsForm({
    super.key,
    required this.isDarkMode,
    required this.onDarkModeChanged,
  });

  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  bool _receiveNotifications = false;
  double _volume = 50.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Dark Mode', style: TextStyle(fontSize: 18)),
              Switch(
                value: widget.isDarkMode,
                onChanged: widget.onDarkModeChanged,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Receive Notifications',
                  style: TextStyle(fontSize: 18)),
              Checkbox(
                value: _receiveNotifications,
                onChanged: (value) {
                  setState(() {
                    _receiveNotifications = value!;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(_receiveNotifications
                          ? 'Notifications enabled'
                          : 'Notifications disabled'),
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 40),
          const Text('Volume Control', style: TextStyle(fontSize: 18)),
          SliderTheme(
            data: SliderThemeData(
              thumbShape: CustomSliderThumbShape(),
            ),
            child: Slider(
              value: _volume,
              min: 0,
              max: 100,
              divisions: 100,
              label: _volume.round().toString(),
              onChanged: (value) {
                setState(() {
                  _volume = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
