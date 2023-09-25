import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int count = 0;
  bool buttonDisabled = false;
  String currentName = "-";

  void incrementCount() {
    setState(() {
      if (count < 3) {
        count++;
        // Update the name based on the count.
        switch (count) {
          case 1:
            currentName = "Rohan Pandey";
            break;
          case 2:
            currentName = "Mahsa Abadian";
            break;
          case 3:
            currentName = "Silvia Figueira";
            break;
          default:
            currentName = "";
            break;
        }
      } else {
        // If the count reaches 3, disable the button and show an error.
        buttonDisabled = true;
        _showErrorDialog();
      }
    });
  }

  void resetCount() {
    setState(() {
      // Reset the count, name, and enable the button.
      count = 0;
      currentName = "-";
      buttonDisabled = false;
    });
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text("Only 3 attempts allowed."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Name App"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Business'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'School'
          ),
        ],
      ),
      drawer: const Drawer(
        child: Text('Rohan is working on it !!!'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Name: $currentName",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              "Count: $count",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: buttonDisabled ? null : incrementCount,
              child: Text("Click Me"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: resetCount,
              child: Text("Reset"),
            ),
          ],
        ),
      ),
    );
  }
}