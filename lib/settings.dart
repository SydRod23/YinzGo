import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SettingsPage(),
    );
  }
}

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int _selectedIndex = 0;

  // Switch states
  bool rideFeedback = true;
  bool rideNotifications = true;
  bool specialAnnouncements = true;
  bool locationTracking = true;
  bool voiceAssist = false;
  bool hapticAndVoice = false;
  bool fullScreenNotification = false;
  bool largerTextSize = false;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Settings'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // Preferences Section
          Text(
            'Preferences',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SwitchListTile(
            title: Text('Ride Feedback'),
            subtitle: Text('Answer questions in-ride to help PRT and other riders'),
            value: rideFeedback,
            onChanged: (bool value) {
              setState(() {
                rideFeedback = value;
              });
            },
          ),
          SwitchListTile(
            title: Text('Ride Notifications'),
            subtitle: Text('Receive in-ride updates about stops, route changes, and delays'),
            value: rideNotifications,
            onChanged: (bool value) {
              setState(() {
                rideNotifications = value;
              });
            },
          ),
          SwitchListTile(
            title: Text('Special Announcement Notifications'),
            subtitle: Text('Get notified about important information to Transit, regional services, and app updates'),
            value: specialAnnouncements,
            onChanged: (bool value) {
              setState(() {
                specialAnnouncements = value;
              });
            },
          ),
          Divider(),
          // Privacy and Security Section
          Text(
            'Privacy and Security',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SwitchListTile(
            title: Text('Location Tracking'),
            subtitle: Text('Use GPS location to see what lines are nearby and track routes'),
            value: locationTracking,
            onChanged: (bool value) {
              setState(() {
                locationTracking = value;
              });
            },
          ),
          ListTile(
            title: Text('Clear Personal Data'),
            subtitle: Text('Clears all saved locations, routes, and ride history'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Add functionality here for clearing personal data
            },
          ),
          Divider(),
          // Accessibility Section
          Text(
            'Accessibility',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SwitchListTile(
            title: Text('Voice Assist'),
            subtitle: Text('Allows users to navigate application using voice commands'),
            value: voiceAssist,
            onChanged: (bool value) {
              setState(() {
                voiceAssist = value;
              });
            },
          ),
          SwitchListTile(
            title: Text('Haptic and Voice Notification'),
            subtitle: Text('Notifications will be spoken aloud, appear on-screen, and vibrate device'),
            value: hapticAndVoice,
            onChanged: (bool value) {
              setState(() {
                hapticAndVoice = value;
              });
            },
          ),
          SwitchListTile(
            title: Text('Full-Screen Notification'),
            subtitle: Text('Notifications will appear on the entire screen for easier visibility'),
            value: fullScreenNotification,
            onChanged: (bool value) {
              setState(() {
                fullScreenNotification = value;
              });
            },
          ),
          SwitchListTile(
            title: Text('Larger Text Size'),
            subtitle: Text('Increase size of text for better visibility'),
            value: largerTextSize,
            onChanged: (bool value) {
              setState(() {
                largerTextSize = value;
              });
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.navigation),
            label: 'Navigate',
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          )
          
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
