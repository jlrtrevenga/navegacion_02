/// Flutter code sample for BottomNavigationBar
import 'package:flutter/material.dart';


/// Heater01 stateful widget that the main application instantiates.
class Heaterl2Actual extends StatefulWidget {
  //const Heaterl2Actual({Key? key}) : super(key: key);

  @override
  _Heaterl2ActualState createState() => _Heaterl2ActualState();
}

/// Heater01State private State class.
class _Heaterl2ActualState extends State<Heaterl2Actual> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Index 0: Home', style: optionStyle,),
    Text('Index 1: Business', style: optionStyle,),
    Text('Index 2: School', style: optionStyle,),
  ];

  void _onItemTapped(int index) {
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
            title: const Text('Heater Status'),
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
                icon: Icon(Icons.today),
                label: 'now',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today),
                label: 'week program',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.announcement),
                label: 'exceptions',
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
    }



