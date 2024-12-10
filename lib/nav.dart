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
      home: NavigationPage(),
    );
  }
}

class NavigationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Greeting Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello, Lauren',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  'Where to today?',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                SizedBox(height: 16),
      Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    // Search Field
    Expanded(
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: 'Work',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          fillColor: Colors.grey[200],
          filled: true,
        ),
      ),
    ),
    SizedBox(width: 8),
    Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // ETA Text
        Text(
          'ETA: 20 minutes',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey[700],
          ),
        ),
        SizedBox(height: 4),
        // Refresh Button
        IconButton(
          icon: Icon(Icons.refresh, color: Colors.blue),
          tooltip: 'Refresh Routes',
          onPressed: () {
            // Refresh logic here
            print('Refresh button pressed');
          },
        ),
      ],
    ),
  ],
),


              ],
            ),
          ),

          // Map Section (Placeholder for actual map widget)
         Expanded(
            child: Image.asset(
              'assets/pittsburgh-map.webp', // Path to your map image
              fit: BoxFit.cover,       // Ensures the image covers the available space
              width: double.infinity,  // Makes the image stretch to the full width
              height: double.infinity, // Makes the image stretch to the full height
            ),
          ),


          // Destination and Transit Info
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '620 Liberty Ave, Pittsburgh PA',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildTransitButton('67', Colors.green),  // Highlighted (active) button
                    _buildTransitButton('81', Colors.blue),  // Blue for inactive
                    _buildTransitButton('56', Colors.orange), // Orange for inactive
                    _buildTransitButton('71B', Colors.purple), // Purple for inactive
                  ],
                ),

                SizedBox(height: 16),
                Column(
                  children: [
                    _buildTransitInfo('67 Downtown via Oakland', '2 min'),
                    _buildTransitInfo('61A Downtown via Oakland', '6 min'),
                    _buildTransitInfo('61C Downtown via Oakland', '10 min'),
                  ],
                ),
              ],
            ),
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
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: 2, // Highlight the Navigate tab
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          // Handle navigation logic here
        },
      ),
    );
  }

Widget _buildTransitButton(String text, Color color) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Text(
      text,
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
  );
}


  Widget _buildTransitInfo(String route, String time) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(route, style: TextStyle(fontSize: 16)),
          Text(time, style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
