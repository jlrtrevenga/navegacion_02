/// Flutter code sample for BottomNavigationBar
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:navegacion_02/model/heater_model.dart';

/// Heater01 stateful widget that the main application instantiates.
class Heaterl2Config extends StatefulWidget {
  //const Heaterl2Actual({Key? key}) : super(key: key);

  @override
  _Heaterl2ConfigState createState() => _Heaterl2ConfigState();
}

/// Heater01State private State class.
class _Heaterl2ConfigState extends State<Heaterl2Config> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var heater = Provider.of<Heater>(context);

    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Heater Patterns'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.today),
                text: 'Day Pattern',
              ),
              Tab(
                icon: Icon(Icons.calendar_today),
                text: 'Week Pattern',
              ),
              Tab(
                icon: Icon(Icons.thermostat_rounded),
                text: 'Temp Sp',
              ),
            ],
          ),
        ),
        //),
        body: TabBarView(
          children: <Widget>[
            // Day Pattern Class
            DayPattern(),
            // Weekly Pattern Class
            WeekPattern(),
            Center(
              child: Text('Temp. setpoints'),
            ),
          ],
        ),
      ),
    );
  }
}

class DayPattern extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        for (var i = 0; i < 24; i++)
          UnconstrainedBox(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 1),
              color: Colors.black,
              child: Container(
                  color: Colors.deepOrangeAccent, width: 30, height: 6),
            ),
          ),
      ],
    );
  }
}

class WeekPattern extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        for (var j = 0; j < 7; j++)
          Column(
            children: <Widget>[
              for (var i = 0; i < 24; i++)
                UnconstrainedBox(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 1, horizontal: 1),
                    color: Colors.black,
                    child: Container(
                        color: Colors.deepOrangeAccent, width: 30, height: 6),
                  ),
                ),
            ],
          ),
      ],
    );
  }
}

/*
  var questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': ['Black', 'Red', 'Blue', 'Green'],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': ['Dog', 'Cat', 'Rabbit', 'Bird'],
    },
    {
      'questionText': 'What\'s your favorite country?',
      'answers': ['Spain', 'Germany', 'USA', 'France'],
    },
  ];
*/
