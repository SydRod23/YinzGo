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
      home: RewardsCenterPage(),
    );
  }
}

class RewardsCenterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rewards Center'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // Header Section
          Text(
            "You're a transit star!",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          SizedBox(height: 8),
          // Star Balance Section
Row(
  children: [
    Text(
      '243',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
    ),
    SizedBox(width: 4),
    Icon(Icons.star, color: Colors.amber),
    Spacer(),
    Row(
      children: [
        ElevatedButton(
          onPressed: () {
            // Redeem stars functionality
          },
          child: Text('Redeem Stars'),
        ),
        SizedBox(width: 8), // Space between buttons
        ElevatedButton(
          onPressed: () {
            // "Tell Us About This Trip" functionality
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber, // Customize button color
          ),
          child: Text('Tell Us About Your Trip and Earn Stars'),
        ),
      ],
    ),
  ],
),

          Text(
            'star balance',
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 16),

        // Progress Bar Section
        Container(
          height: 60, // Adjust container height if needed
          child: Stack(
            children: [
              // Line
              Align(
                alignment: Alignment.center,
                child: Divider(
                  thickness: 2,
                  color: Colors.grey[300],
                ),
              ),
              // Blue dot (adjust the position here)
              Positioned(
                left: 300, // Adjust horizontal position
                top: 20, // Adjust vertical position (lower it by increasing the value)
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.blue,
                ),
              ),
            ],
          ),
        ),


          // Star Rewards Section
          Text(
            'Star Rewards',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 8),
          _buildRewardTile(250, 'Unlock Free 3 Hour Pass - Full Fare', Colors.red),
          _buildRewardTile(500, 'Unlock Free 7 Rides - Full Fare', Colors.orange),
          _buildRewardTile(750, 'Unlock Free Day Pass - Full Fare', Colors.green),
          _buildRewardTile(1000, 'Unlock Free 14 Rides - Full Fare', Colors.blue),

          SizedBox(height: 16),

          // Current Campaigns Section
          Text(
            'Current Campaigns',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 8),
         Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: _buildCampaignTile(
                  'Start a Ride To or From a Pittsburgh Park',
                  '25 points',
                  'assets/pittsburgh-park.jpeg', // Replace with actual image path
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: _buildCampaignTile(
                  'Keep Up a 7 Day Ride Streak',
                  '40 points',
                  'assets/pittsburgh-prt.jpg', // Replace with actual image path
                ),
              ),
            ],
          ),

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
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 1, // Set this to indicate the active tab
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          // Handle navigation logic here
        },
      ),
    );
  }

  Widget _buildRewardTile(int stars, String description, Color color) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        radius: 12,
        child: Text(
          stars.toString(),
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
      ),
      title: Text(description),
    );
  }

 Widget _buildCampaignTile(String title, String points, String imagePath) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        width: double.infinity,
        height: 150, // Adjust the height for a more square layout
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
      SizedBox(height: 8),
      Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      Text(points, style: TextStyle(color: Colors.grey)),
    ],
  );
}

}
