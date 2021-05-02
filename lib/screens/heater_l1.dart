/// Flutter code sample for BottomNavigationBar
import 'package:flutter/material.dart';

/// Heater01 stateful widget that the main application instantiates.
class HeaterMain extends StatefulWidget {
  const HeaterMain({Key? key}) : super(key: key);

  @override
  _HeaterMainState createState() => _HeaterMainState();
}

/// Heater01State private State class.
class _HeaterMainState extends State<HeaterMain> {
  int _selectedIndex = 0;
  bool _manualAdjust = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Heater'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.today),
                text: 'Hoy',
              ),
              Tab(
                icon: Icon(Icons.calendar_today),
                text: 'Semana',
              ),
              Tab(
                icon: Icon(Icons.announcement),
                text: 'Excepciones',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ScreenHoy(),
            Center(
              child: Text('Semana'),
            ),
            Center(
              child: Text('Excepciones'),
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
              icon: Icon(Icons.pan_tool),
              label: 'Manual',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit),
              label: 'AntiHielo',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Theme.of(context).accentColor,
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
/*
    if (index == 0)
      Navigator.pushNamed(context, '/Heaterl2Mode');
    else if (index == 1) Navigator.pushNamed(context, '/Heaterl2Config');
*/
  }
}

// TODO: Implementar estado y memorizar los datos.
class ScreenHoy extends StatelessWidget {
  bool _manualAdjust = false;
  double _manualOverride = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.brightness_auto,
                    color: Theme.of(context).accentColor,
                  ),
                  Text('   Automático'),
                ],
              ),
              ElevatedButton(
                child: Text('Programa'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/Heaterl2Config');
                },
              ),
            ],
          ),
          Container(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 30,
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
                child:
                    Text('24º C', style: Theme.of(context).textTheme.headline3),
              ),
              Text(' / ', style: Theme.of(context).textTheme.headline5),
              Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
                child: Text(
                  '22º C',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ],
          ),
          Container(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 30,
              ),
              Row(children: [
                Text('Programa: '),
                Text('Comfort'),
              ]),
            ],
          ),
          Container(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 30,
              ),
              Container(
                width: 30,
              ),
              Container(
                width: 30,
              ),
              Row(children: [
                Icon(Icons.local_fire_department),
                Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: Text(
                    '65º C',
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
              ]),
            ],
          ),
          Container(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Switch(
                  value: _manualAdjust,
                  onChanged: (bool newValue) {
                    _manualAdjust = !_manualAdjust;
                    //Hay que llamar a SetState para que lo mantenga y redibuje
                  },
                  activeColor: Theme.of(context).accentColor,
                ),
              ),
              Center(
                child: Text('Ajuste Manual '),
              ),
            ],
          ),
          Container(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Icon(Icons.arrow_left),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  //side: BorderSide(color: Colors.red),
                ),
                onPressed: () => {_manualOverride--},
              ),
              Container(
                width: 20,
              ),
              Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
                child: Text(
                  '+0 ºC',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              Container(
                width: 20,
              ),
              ElevatedButton(
                child: Icon(Icons.arrow_right),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  //side: BorderSide(color: Colors.red),
                ),
                onPressed: () => {_manualOverride++},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
