import 'package:event_manager/new_event.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Myapp();
}

class _Myapp extends State<MyApp> {
  final List<Widget> _list = [
    Text(
      "Event 1",
      style: TextStyle(fontSize: 20),
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xff1baaab),
        appBar: AppBar(
          backgroundColor: Color(0xff3ebcda),
          title: Text(
            "Event Scheduler",
            style: TextStyle(
              color: Color(0xff050d0e),
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          toolbarHeight: 70,
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: _list.length,
          itemBuilder: ((context, index) {
            return Column(children: [
              ListTile(
                tileColor: Color(0xff050d0e),
                textColor: Color(0xfff1f7f8),
                shape: RoundedRectangleBorder(
                  //<-- SEE HERE
                  side: BorderSide(width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                leading: Icon(Icons.calendar_month, color: Color(0xfff1f7f8)),
                trailing: Icon(Icons.circle, color: Color(0xfff1f7f8)),
                title: _list[index]

              ),
              SizedBox(
                height: 5,
              ),
            ]);
          }),
        ),
        floatingActionButton: Builder(builder: (context) {
          return FloatingActionButton(
            onPressed: () async {
              String newText = await Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => NewEventScreen()));
              setState(() {
                _list.add(Text(newText , style: TextStyle(fontSize: 20),));
              });
            },
            child: Icon(Icons.add),
            backgroundColor: Color(0xff0e1a25),
          );
        }),
      ),
    );
  }
}
