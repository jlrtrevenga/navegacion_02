import 'package:flutter/material.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/services.dart';
import 'package:navegacion_02/screens/heater_l1.dart';
//import 'package:navegacion_02/heater_l2_State.dart';
import 'package:navegacion_02/screens/heater_l2_Mode.dart';
import 'package:navegacion_02/screens/heater_l2_Pattern.dart';
//import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

class Gadget {
  final int index;
  final String type;
  final String name;
  final String route;

  Gadget(this.index, this.type, this.name, this.route);
}

List<Gadget> gadgets = [
  Gadget(0, 'heater', 'Termostato', 'images/termostato01.jpg'),
  Gadget(1, 'bot', 'Mbot Izda', 'images/Mbot_Izda.jpg'),
  Gadget(2, 'bot', 'Mbot Frente', 'images/Mbot_Frente.jpg'),
  Gadget(3, 'bot', 'Mbot Dcha', 'images/Mbot_Dcha.jpg'),
];

// Void main() => runApp(Nav2App());  // alternative call
void main() {
  runApp(Nav2App());
}

class Nav2App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomeScreen(),
        '/Heaterl1Devices': (context) => HeaterMain(),
        '/Heaterl2Mode': (context) => Heaterl2Mode(),
        '/Heaterl2Config': (context) => Heaterl2Config(),
//        '/Heaterl2Actual': (context) => Heaterl2Actual(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Devices'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: null,
            //onPressed: () => Navigator.pushNamed(context, '/settings'),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Add Device'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          for (var gadget in gadgets)
            ListTile(
              leading: Image.asset(gadget.route),
              title: Text(gadget.name),
              subtitle: Text(gadget.type),
              trailing: Icon(Icons.keyboard_arrow_right),
              enableFeedback: true,
              onTap: () {
                _onItemTapped(context, gadget);
              },
            ),
        ],
      ),
    );
  }

  void _onItemTapped(BuildContext context, Gadget gadget) {
    //print(gadget.index);
    if (gadget.type == 'heater') {
      Navigator.pushNamed(context, '/Heaterl1Devices');
    } else {
      showAlertDialog((context),
          'TODO: Functionality NOT implemented for this device type');
    }
  }
}

// TODO: Functionality not implemented, TODO MESSAGE.
showAlertDialog(BuildContext context, String message) {
  // set up the button
  Widget okButton = TextButton(
    child: Text("ACCEPT"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("ALERT MESSAGE"),
    content: Text(message),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

/*
  void _onItemTapped(BuildContext context, Gadget gadget) {
    //print(gadget.index);
    if (gadget.type == 'heater') {
      Navigator.pushNamed(context, '/Heaterl1Devices');
//      Navigator.pushReplacementNamed(context, '/Heaterl1Devices');   
//      Navigator.push(
//        context,
//        MaterialPageRoute(builder: (context) => HeaterMain()),
      );
    } else {
      showAlertDialog((context),
          'TODO: Functionality NOT implemented for this device type');
    }
  }
}
*/
