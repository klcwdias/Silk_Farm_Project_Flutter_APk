import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';




void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Silk Coperation',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SplashScreen(), // Show the SplashScreen first
      routes: {
        '/Light Intensity': (context) => CalendarScreen(),
        '/Humidity': (context) => CalendarScreen(),
        '/Temperature': (context) => CalendarScreen(),
        '/Fertigation Tank': (context) => CalendarScreen(),
        '/EC': (context) => CalendarScreen(),
        '/Water Level': (context) => CalendarScreen(),
        '/calendar': (context) => CalendarScreen(),
        '/notes': (context) => NotesReminder(),
        '/About Us': (context) => Aboutusscreen(),
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Show the logo and loading bar
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF00AF41),
                  Color(0xFFB1B1B1),
                ],
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('assets/images/logo.png'),
                    height: 120.0,
                  ),
                  SizedBox(height: 16.0),
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ],
              ),
            ),
          ),
          // Show the main screen once it's ready
          FutureBuilder(
            future: Future.delayed(Duration(seconds: 3)), // Simulate a delay of 3 seconds
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return MainScreen();
              } else {
                return Container(); // Show an empty container while waiting
              }
            },
          ),
        ],
      ),
    );
  }
}


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _children = [    Home(),    CalendarScreen(),    Adjust(),    Graph(),    Financial(),  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Silk Corporation'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Silk Corporation',
                style: TextStyle(fontSize: 24),
              ),
              decoration: BoxDecoration(
                color: Colors.green,
              ),
            ),
            ListTile(
              title: Text('Light Intensity'),
              onTap: () {
                Navigator.pushNamed(context, '/Light Intensity');
              },
            ),
            ListTile(
              title: Text('Humidity'),
              onTap: () {
                Navigator.pushNamed(context, '/Humidity');
              },
            ),
            ListTile(
              title: Text('Temperature'),
              onTap: () {
                Navigator.pushNamed(context, '/Temperature');
              },
            ),
            ListTile(
              title: Text('Fertigation Tank'),
              onTap: () {
                Navigator.pushNamed(context, '/Fertigation Tank');
              },
            ),
            ListTile(
              title: Text('EC'),
              onTap: () {
                Navigator.pushNamed(context, '/EC');
              },
            ),
            ListTile(
              title: Text('Water Level'),
              onTap: () {
                Navigator.pushNamed(context, '/Water Level');
              },
            ),
            ListTile(
              title: Text('Notes'),
              onTap: () {
                Navigator.pushNamed(context, '/Notes');
              },
            ),
            ListTile(
              title: Text('About Us'),
              onTap: () {
                Navigator.pushNamed(context, '/About Us');
              },
            ),
          ],
        ),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        selectedItemColor: Colors.green,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.adjust),
            label: 'Adjust',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.graphic_eq),
            label: 'Graph',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Financial',
          ),
        ],
      ),
    );
  }
}


class Aboutusscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Silk Coperation'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 16.0),
            CircleAvatar(
              radius: 80.0,
              backgroundImage: AssetImage('assets/images/logo.png'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Silk Coperation',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce sollicitudin velit non elit varius, sit amet pulvinar orci accumsan. Nunc blandit magna vel sem auctor, non bibendum dolor fringilla. Curabitur sit amet consequat lacus. Vestibulum euismod est sed nisl vestibulum, et aliquam metus ullamcorper. In eget felis eget augue iaculis vehicula. Sed eu mauris sagittis, ultricies magna ac, pretium lacus. Integer lacinia odio eget velit rhoncus, sit amet iaculis est molestie. Donec vulputate lacinia sapien, et congue massa porta quis. Duis sed lorem felis. Nam aliquam lobortis ex, vel ultrices enim dictum ut. Donec ut eleifend lectus, at malesuada magna. Sed maximus laoreet dolor, quis venenatis augue sodales in.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {},
              child: Text('Contact Us'),
            ),
          ],
        ),
      ),
    );
  }
}

class CalendarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: Center(
        child: TableCalendar(
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: DateTime.now(),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                // Add code to navigate to the note screen
              },
            ),
            IconButton(
              icon: Icon(Icons.note),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotesReminder()),
                );

              },
            ),
          ],
        ),
      ),
    );
  }
}



class NotesReminder extends StatefulWidget {
  @override
  _NotesReminderState createState() => _NotesReminderState();
}

class _NotesReminderState extends State<NotesReminder> {
  // form fields
  String _title = '';
  String _location = '';
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now();
  String _note = '';

  // dropdown menu items
  List<String> _locations = ['Location A', 'Location B', 'Location C'];
  String _selectedLocation = 'Location A';

  // date and time pickers
  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _startDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _startDate)
      setState(() {
        _startDate = picked;
      });
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _endDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _endDate)
      setState(() {
        _endDate = picked;
      });
  }

  Future<void> _selectStartTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_startDate),
    );
    if (picked != null) {
      final selectedDateTime =
      DateTime(_startDate.year, _startDate.month, _startDate.day, picked.hour, picked.minute);
      setState(() {
        _startDate = selectedDateTime;
      });
    }
  }

  Future<void> _selectEndTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_endDate),
    );
    if (picked != null) {
      final selectedDateTime =
      DateTime(_endDate.year, _endDate.month, _endDate.day, picked.hour, picked.minute);
      setState(() {
        _endDate = selectedDateTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Notes Reminder'),
        ),
        body: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.all(16.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
    TextField(
    decoration: InputDecoration(
    labelText: 'Title',
    border: OutlineInputBorder(),
    ),
    onChanged: (value) {
    setState(() {
    _title = value;
    });
    },
    ),
    SizedBox(height: 16),
    DropdownButtonFormField(
    decoration: InputDecoration(
    labelText: 'Location',
    border: OutlineInputBorder(),
    ),
    value: _selectedLocation,
    items: _locations.map((String location) {
    return DropdownMenuItem(
    value: location,
    child: Text(location),
    );
    }).toList(),
    onChanged: (value) {
    setState(() {
    _selectedLocation = value.toString();
    });
    },
    ),
    SizedBox(height: 16),
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Text('Start Date: ${_startDate.day}/${_startDate.month}/${_startDate.year}'),
    ElevatedButton(
    child: Text('Select Date'),
    onPressed: () => _selectStartDate(context),
    ),
    ],
    ),
    SizedBox(height: 16),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Start Time: ${_startDate.hour}:${_startDate.minute}'),
          ElevatedButton(
            child: Text('Select Time'),
            onPressed: () => _selectStartTime(context),
          ),
        ],
      ),
      SizedBox(height: 16),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('End Date: ${_endDate.day}/${_endDate.month}/${_endDate.year}'),
          ElevatedButton(
            child: Text('Select Date'),
            onPressed: () => _selectEndDate(context),
          ),
        ],
      ),
      SizedBox(height: 16),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('End Time: ${_endDate.hour}:${_endDate.minute}'),
          ElevatedButton(
            child: Text('Select Time'),
            onPressed: () => _selectEndTime(context),
          ),
        ],
      ),
      SizedBox(height: 16),
      TextField(
        decoration: InputDecoration(
          labelText: 'Note',
          border: OutlineInputBorder(),
        ),
        maxLines: 3,
        onChanged: (value) {
          setState(() {
            _note = value;
          });
        },
      ),
      SizedBox(height: 16),
      ElevatedButton(
        child: Text('Add Reminder'),
        onPressed: () {
// TODO: add reminder logic here
        },
      ),
      ],
    ),
    ),
    ),
    );
  }
}

//for nav bar ekat dpm


class Home extends StatelessWidget {
  final int luxValue = 500; // replace with the value obtained from database
  final int temperatureValue = 25; // replace with the value obtained from database
  final int humidityValue = 70; // replace with the value obtained from database

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(8),
                    height: 160,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF35C2D6), Color(0xFF80D6C8)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.lightbulb_outline,
                          color: Colors.white,
                          size: 48,
                        ),
                        Text(
                          'NFT1',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'LUX: $luxValue',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.thermostat_outlined,
                              color: Colors.white,
                              size: 24,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              '$temperatureValue°C',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.opacity_outlined,
                              color: Colors.white,
                              size: 24,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Humidity: $humidityValue%',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(8),
                    height: 160,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF35C2D6), Color(0xFF80D6C8)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.lightbulb_outline,
                          color: Colors.white,
                          size: 48,
                        ),
                        Text(
                          'NFT2',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'LUX: $luxValue',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.thermostat_outlined,
                              color:Colors.white,
                              size: 24,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              '$temperatureValue°C',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.opacity_outlined,
                              color: Colors.white,
                              size: 24,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Humidity: $humidityValue%',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Notifications',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.error_outline,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Warning',
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Temperature in NFT1 is too high',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              '2 min ago',
                              style: TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.error_outline,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Alert',
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Humidity in NFT2 is too low',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              '5 min ago',
                              style: TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class Financial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Financial',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class Graph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Graph',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class Adjust extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Adjust',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class Calendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Calendar',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}



