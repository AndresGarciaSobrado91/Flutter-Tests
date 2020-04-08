import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guinartbudgetsexample/customComponents/customAppBar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Assesments'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _goToPrevPage() {}

  void _goToTaskSelection() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        widget.title,
        true,
        onLeadingPressed: _goToPrevPage,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: double.infinity,
                      ),
                      Text(
                        'Customer Name',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        'Project Name',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(
                        color: Colors.grey.shade300,
                        thickness: 1.5,
                      ),
                      Text(
                        '497 Evergreen Rd. Roseville',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 30.0,
                  ),
                  Icon(
                    Icons.edit,
                    color: Colors.blue.shade900,
                    size: 25.0,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'Task',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Select a task',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Container(
                        width: 70.0,
                        child: FlatButton(
                          onPressed: _goToTaskSelection,
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.blue.shade900,
                            ),
                          ),
                        ),
                      )
                      /*Container(
                        width: 25.0,
                        child: IconButton(
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.blue.shade900,
                            ),
                            onPressed: null),
                      ),*/
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Center(
                child: Text(
                  'There are no tasks in this project',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
