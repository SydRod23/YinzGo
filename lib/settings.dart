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
  int _selectedIndex = 4; // Default index for Settings tab
  double textSize = 14.0; // Default text size

  // State variables for toggles
  bool rideFeedback = true;
  bool rideNotifications = true;
  bool specialAnnouncements = true;
  bool locationTracking = true;
  bool voiceAssist = false;
  bool hapticAndVoice = false;
  bool fullScreenNotification = false;
  bool darkMode = false; // New toggle for Dark Mode

  // Function to handle navigation
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate to the appropriate page based on the selected index
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home'); // Navigate to Home
        break;
      case 1:
        Navigator.pushNamed(context, '/rewards'); // Navigate to Rewards
        break;
      case 2:
        Navigator.pushNamed(context, '/navigate'); // Navigate to Navigate
        break;
      case 3:
        // Stay on the Settings Page
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
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
              // Add functionality for clearing personal data
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
          // New Dark Mode Toggle
          SwitchListTile(
            title: Text('Dark Mode'),
            subtitle: Text('Switch to a dark theme'),
            value: darkMode,
            onChanged: (bool value) {
              setState(() {
                darkMode = value;
                // Implement dark mode functionality here
              });
            },
          ),
          SizedBox(height: 16),

          // Text Size Adjustment Section
          _buildTextSizeAdjuster(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Rewards',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.navigation),
            label: 'Navigate',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.confirmation_number),
            label: 'Tickets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex, // Highlight Settings tab
        selectedItemColor: Colors.blue, // Highlighted color
        unselectedItemColor: Colors.grey, // Unselected color
        onTap: _onItemTapped,
      ),
    );
  }

  // Widget for adjusting text size
  Widget _buildTextSizeAdjuster() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Text Size',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Small', style: TextStyle(fontSize: 14)),
            Text('Large', style: TextStyle(fontSize: 18)),
          ],
        ),
        Slider(
          value: textSize,
          min: 10.0,
          max: 24.0,
          divisions: 7,
          label: '${textSize.toStringAsFixed(1)} pt',
          onChanged: (double newValue) {
            setState(() {
              textSize = newValue;
            });
          },
        ),
        SizedBox(height: 4),
        Text(
          'Current size: ${textSize.toStringAsFixed(1)} pt',
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}