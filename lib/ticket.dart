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
      home: TicketPage(), // Set the home page to TicketPage
    );
  }
}

class TicketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tickets'),
      ),
      body: SingleChildScrollView( // Added scrollable container to prevent overflow in extreme cases
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Credit Card-like Cards
            _buildCreditCard(
              title: 'Pittsburgh Regional Transit',
              subtitle: '31 Day Pass - Full Fare',
              validity: '24 days remaining',
              gradientColors: [Colors.orange.shade300, Colors.deepOrange.shade600],
            ),
            SizedBox(height: 16),
            _buildCreditCard(
              title: 'Panther Card - Student',
              subtitle: '',
              validity: '',
              gradientColors: [Colors.blue.shade300, Colors.blue.shade600],
            ),
            SizedBox(height: 24),

            // Purchase Pass Section
            Text(
              'Purchase Pass',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Annual Pass - Full Fare',
                  style: TextStyle(fontSize: 16),
                ),
                GestureDetector(
                  onTap: () {
                    // Handle "Change Selection" logic
                  },
                  child: Text(
                    'change selection',
                    style: TextStyle(fontSize: 14, color: Colors.blue),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              '\$1,072.50',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24),

            // Payment Section
            Text(
              'Payment',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.apple, size: 30),
                SizedBox(width: 16),
                Icon(Icons.payment, size: 30, color: Colors.blue), // PayPal
                SizedBox(width: 16),
                Icon(Icons.credit_card, size: 30), // Visa
                SizedBox(width: 16),
                GestureDetector(
                  onTap: () {
                    // Handle adding payment method
                  },
                  child: Text(
                    'Add Payment Type +',
                    style: TextStyle(fontSize: 14, color: Colors.blue),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),

            // Complete Purchase Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle purchase logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: Size(double.infinity, 50), // Full-width button
                ),
                child: Text(
                  'Complete Purchase',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
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
        currentIndex: 3, // Highlight the Tickets tab
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          // Handle navigation logic here
        },
      ),
    );
  }

  // Credit Card-Like Card Widget
  Widget _buildCreditCard({
    required String title,
    required String subtitle,
    required String validity,
    required List<Color> gradientColors,
  }) {
    return Container(
      width: double.infinity,
      height: 120, // Reduced height to fix overflow
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(0, 4), // Shadow position
          ),
        ],
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Card Title
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18, // Adjusted size for smaller card
              fontWeight: FontWeight.bold,
            ),
          ),
          // Card Subtitle
          if (subtitle.isNotEmpty)
            Text(
              subtitle,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
          // Validity (if applicable)
          if (validity.isNotEmpty)
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                validity,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
