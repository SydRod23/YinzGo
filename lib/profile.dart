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
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Example streak count. In a real app, this would be stored persistently.
  int streakDays = 7; // Example streak of 7 days
  bool isStreakActive = true; // Flag to check if streak is active

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // Streaks Feature at the top of the profile page
          _buildStreaksSection(),
          SizedBox(height: 24),

          // Profile Header
          Row(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.grey[300],
                child: Icon(Icons.person, size: 40, color: Colors.grey),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lauren J.',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Rider since September 2021',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 24),

          // Saved Routes Section
          _buildSectionHeader('My Saved Routes', '+ add saved route'),
          _buildSavedItem('Work → Home'),
          _buildSavedItem('Home → Point Park Campus'),
          _buildSavedItem('Home → LA Fitness'),
          SizedBox(height: 16),

          // Saved Locations Section
          _buildSectionHeader('My Saved Locations', '+ add saved location'),
          _buildSavedItem('Home'),
          _buildSavedItem('Work'),
          _buildSavedItem('Point Park Campus'),
          SizedBox(height: 16),

          // Ride History Section
          _buildSectionHeader('Ride History', 'view more ride history'),
          _buildHistoryItem('09/24/2024', 'Trip from Southside to Point Park Campus'),
          _buildHistoryItem('09/20/2024', 'Trip from Work to LA Fitness'),
          _buildHistoryItem('09/19/2024', 'Trip from Giant Eagle Market District to Home'),
          SizedBox(height: 16),

          // Purchase Passes Section
          Text(
            'Purchase Passes',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildFareTypeButton('Full Fare', true),
              _buildFareTypeButton('Incline Only', false),
            ],
          ),
          SizedBox(height: 16),
          _buildFareOption('3 Hour Pass - Full Fare', '\$2.75'),
          _buildFareOption('Day Pass - Full Fare', '\$7.00'),
          _buildFareOption('7 Day Pass - Full Fare', '\$25.00'),
          _buildFareOption('31 Day Pass - Full Fare', '\$97.50'),
          _buildFareOption('Annual Pass - Full Fare', '\$1,072.50'),
          SizedBox(height: 16),

          // Active Passes Section
          Text(
            'Active Passes',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          _buildActivePass('31 Day Pass - Full Fare', '24 days remaining'),
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
  currentIndex: 0, // Highlight the Home tab
  selectedItemColor: Colors.blue, // Color for the selected icon and label
  unselectedItemColor: Colors.grey, // Color for unselected icons and labels
  onTap: (index) {
    // Handle navigation logic here
    // You can add navigation logic based on the tapped index
  },
),

    );
  }

  // Streaks Section
Widget _buildStreaksSection() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    decoration: BoxDecoration(
      color: Colors.blue[50],
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Your Streak',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 8),
                    Icon(
                      Icons.local_fire_department, // Flame icon
                      color: Colors.orange,
                      size: 24,
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  '$streakDays days',
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
              ],
            ),
          ],
        ),
        Icon(
          isStreakActive ? Icons.check_circle : Icons.remove_circle,
          color: isStreakActive ? Colors.green : Colors.red,
          size: 30,
        ),
      ],
    ),
  );
}




  // Saved Routes Section
  Widget _buildSectionHeader(String title, String actionText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: () {
            // Handle action
          },
          child: Text(
            actionText,
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }

  // Saved Item
  Widget _buildSavedItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(text, style: TextStyle(color: Colors.grey[700])),
    );
  }

  // History Item
  Widget _buildHistoryItem(String date, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        '$date - $description',
        style: TextStyle(color: Colors.grey[700]),
      ),
    );
  }

  // Fare Type Button
  Widget _buildFareTypeButton(String text, bool isSelected) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.green : Colors.grey[300],
        foregroundColor: isSelected ? Colors.white : Colors.black,
      ),
      onPressed: () {
        // Handle fare type selection
      },
      child: Text(text),
    );
  }

  // Fare Option
  Widget _buildFareOption(String title, String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Text(price, style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }

  // Active Pass
  Widget _buildActivePass(String title, String validity) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Text(
          validity,
          style: TextStyle(color: Colors.green),
        ),
      ],
    );
  }
}

