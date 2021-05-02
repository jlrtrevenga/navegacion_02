/// Flutter code sample for BottomNavigationBar
import 'package:flutter/material.dart';

/// Heater01 stateful widget that the main application instantiates.
class Heaterl2Mode extends StatefulWidget {
  //const Heaterl2Actual({Key? key}) : super(key: key);

  @override
  _Heaterl2ModeState createState() => _Heaterl2ModeState();
}

/// Heater01State private State class.
class _Heaterl2ModeState extends State<Heaterl2Mode> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Heater Mode'),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: Text('Auto'),
            ),
            Center(
              child: Text('Ajuste'),
            ),
            Center(
              child: Text('Manual'),
            ),
            Center(
              child: Text('Antifrezze'),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.brightness_auto),
              label: 'Auto',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.toggle_on),
              label: "Ajuste",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.pan_tool),
              label: 'Manual',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit),
              label: 'DeFreeze',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          unselectedItemColor: Colors.grey[400],
          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
