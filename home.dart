import 'package:flutter/material.dart';
import 'market.dart';
import 'loan.dart';
import 'scheme.dart';
import 'profile.dart';
import 'settings.dart'; // Import the SettingsPage

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'প্রকৃtiii',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeContentPage(),
    MarketPage(),
    LoanPage(),
    SchemePage(),
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // To show all items
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Market',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on),
            label: 'Loan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.rule),
            label: 'Scheme',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeContentPage extends StatelessWidget {
  // Simulated API call for data
  Future<Map<String, dynamic>> fetchData() async {
    // Replace this with your actual API call
    await Future.delayed(Duration(seconds: 2));
    return {
      'weather': {
        'today': 'Sunny, 25°C',
        'tomorrow': 'Cloudy, 22°C',
      },
      'news': [
        'News item 1: Market updates...',
        'News item 2: New farming techniques...',
        'News item 3: Government schemes...',
      ],
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('প্রকৃtiii'),
      ),
      body: Stack(
        children: [
          // Main content wrapped in SingleChildScrollView for scrollability
          SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: FutureBuilder<Map<String, dynamic>>(
              future: fetchData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Show loading indicator while fetching data
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  // Show error message if any error occurs
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  // Display fetched data
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Search Bar and Profile Icon Row
                      _buildSearchBarWithProfile(context),
                      SizedBox(height: 20),
                      // Weather Forecast Section
                      _buildWeatherForecast(snapshot.data!['weather']),
                      SizedBox(height: 20),
                      // Latest News Section
                      _buildLatestNews(snapshot.data!['news']),
                      SizedBox(
                          height:
                              80), // Extra space to avoid content being hidden behind the assistant box
                    ],
                  );
                } else {
                  return Center(child: Text('No data available'));
                }
              },
            ),
          ),
          // Assistant Box Positioned above the BottomNavigationBar
          Positioned(
            bottom: 80, // Positioned just above the "Medicine" button
            right: MediaQuery.of(context).size.width / 5 -
                30, // Centered above the Medicine button
            child: GestureDetector(
              onTap: () {
                // Handle assistant box tap
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Assistant'),
                    content: Text('How can I help you today?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Close'),
                      ),
                    ],
                  ),
                );
              },
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.green[800],
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: Icon(Icons.mic, color: Colors.white, size: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget for Search Bar and Profile Icon in a single line
  Widget _buildSearchBarWithProfile(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search...',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              filled: true,
              fillColor: Colors.grey[200],
            ),
            onSubmitted: (query) {
              // Handle search logic here
              print('Search query: $query');
            },
          ),
        ),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => UserProfilePage()),
            );
          },
          child: CircleAvatar(
            backgroundColor: Colors.green,
            child: Icon(Icons.person, color: Colors.white),
            // Placeholder for profile picture
            // You can replace with actual profile image
          ),
        ),
      ],
    );
  }

  // Widget for Weather Forecast
  Widget _buildWeatherForecast(Map<String, dynamic> weatherData) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.lightBlue[50],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Weather Forecast',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text('Today: ${weatherData['today']}'),
          Text('Tomorrow: ${weatherData['tomorrow']}'),
        ],
      ),
    );
  }

  // Widget for Latest News
  Widget _buildLatestNews(List<String> newsList) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Latest News',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          ...newsList.map((news) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text(news),
              )),
        ],
      ),
    );
  }
}
