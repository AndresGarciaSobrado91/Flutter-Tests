import 'package:flutter/material.dart';

import 'customComponents/customAppBar.dart';

class SelectTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        "Select a task",
        true,
        onLeadingPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              selectTaskCard(),
              SizedBox(height: 15.0),
              /*taskListCard(),*/
            ],
          ),
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
            Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: Icon(
                Icons.search,
                color: Colors.blue.shade900,
                size: 25.0,
              ),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search by name",
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget taskListCard() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(25.0),
        child: ListView.builder(
          itemBuilder: (context, position) {
            return Text("Some task here...");
          },
          itemCount: 5,
        ),
      ),
    );
  }
}
