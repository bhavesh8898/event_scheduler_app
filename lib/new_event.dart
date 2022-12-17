import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewEventScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewEventScreen();
}

class _NewEventScreen extends State<NewEventScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1baaab),
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
          // <-- SEE HERE
        ),
        backgroundColor: Color(0xff3ebcda),
        title: Text("New Event",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            )),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: TextField(
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xffeeeef5),
                fontSize: 20,
              ),
              decoration: InputDecoration(
                filled: true, //<-- SEE HERE
                fillColor: Colors.black,
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 3, color: Colors.black), //<-- SEE HERE
                  borderRadius: BorderRadius.circular(20.0),
                ),

                labelText: 'Enter the Event',
                labelStyle: TextStyle(
                  color: Colors.white, //<-- SEE HERE
                ),
              ),
              controller: _textEditingController,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Builder(builder: (context) {
            return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.fromLTRB(80, 10, 80, 10),
                  primary: Colors.black,
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontStyle: FontStyle.italic),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  shadowColor: Colors.grey,
                ),
                onPressed: () {
                  String newEventText = _textEditingController.text;
                  Navigator.of(context).pop(newEventText);
                },
                child: Text("ADD"));
          }),
        ],
      ),
    );
  }
}
