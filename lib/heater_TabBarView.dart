/// Flutter code sample for BottomNavigationBar
import 'package:flutter/material.dart';
import 'package:navegacion_02/heater_l2_State_old.dart';

/// Heater01 stateful widget that the main application instantiates.
class HeaterMain extends StatefulWidget {
  const HeaterMain({Key? key}) : super(key: key);

  @override
  _HeaterMainState createState() => _HeaterMainState();
}

/// Heater01State private State class.
class _HeaterMainState extends State<HeaterMain> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    if (index == 0)
      Navigator.pushNamed(
        context,
        '/Heaterl2Actual',
      );

    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Heater'),
/*
            bottom: const TabBar(
              tabs: <Widget>[
                Tab(
                  text: "now",
                  icon: Icon(Icons.today, size: 20,),
                ),
                Tab(
                  text: "week program",
                  icon: Icon(Icons.calendar_today, size: 20,),
                ),
                Tab(
                  text: "exceptions",
                  icon: Icon(Icons.announcement, size: 20,),
                ),
              ],
            ),
*/
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: Text('Diario'),
            ),
            Center(
              child: Text('Semanal'),
            ),
            Center(
              child: Text('Excepciones'),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.thermostat_rounded),
              label: 'State',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.palette),
              label: 'Mode',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Patterns',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
