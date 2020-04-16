import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guinartbudgetsexample/Repo/mainRepo.dart';
import 'package:guinartbudgetsexample/customComponents/customAppBar.dart';
import 'package:guinartbudgetsexample/selectTask.dart';

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
  void _goToPrevPage() => Navigator.pop(context);

  Future navigateToSelectTaskPage(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SelectTask()));
  }

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
              mainCard(),
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
              selectTaskCard(),
              SizedBox(
                height: 20.0,
              ),
              TaskList(),
              //No items in list
              Visibility(
                visible: false,
                child: Center(
                  child: Text(
                    'There are no tasks in this project',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget mainCard() {
    return Card(
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
    );
  }

  Widget selectTaskCard() {
    return Card(
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
                padding: EdgeInsets.all(0.0),
                onPressed: () {
                  navigateToSelectTaskPage(context);
                },
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.blue.shade900,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TaskList extends StatelessWidget {
  final List<Movie> movieList = MainRepo().getUrls();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 220.0,
        child: ListView.builder(
          itemBuilder: (context, position) {
            return GestureDetector(
              onTap: () {
                print('selected is: ' + position.toString());
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: Card(
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.grey, width: 0.2),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Row(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image.network(
                          movieList[position].image,
                          width: 120.0,
                          height: 120.0,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    movieList[position].title,
                                    style: TextStyle(
                                        color: Color(0xFF194B9C),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Icon(
                                    Icons.delete,
                                    color: Color(0xFF194B9C),
                                  )
                                ],
                              ),
                              Text('Description',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600)),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                'Lorep ipsum... klajshdka aslkd nal lasd asd lads laskdnñ laksndl laskjdn la aksld mlas',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(fontSize: 12.0),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: movieList.length,
        ),
      ),
    );
  }
}
