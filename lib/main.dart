import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MaterialApp(
  title: 'Git Dashboard Sample',
  theme: new ThemeData(primaryColor: Color.fromRGBO(58, 66, 86, 1.0)),
  home: MyApp(),
));

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  bool pressed = false;
  List repos = [];
  String userName = '';

  initState() {
    pressed = false;
  }

  void _callApi() async {
    String url = 'https://api.github.com/users/${userName}/repos';
      final http.Response response = await http.get(url);
      final data = json.decode(response.body);
      setState(() {
        this.repos = data;
        pressed = !pressed;
      });
  }

  void _returnToHome() {
    setState(() {
      pressed = false;
      repos = [];
    });
  }

  final topAppBar = AppBar(
    elevation: 0.1,
    backgroundColor: Colors.green,
    title: Text('Git Dashboard Sample'),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.list),
        onPressed: () {},
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: topAppBar,
      bottomNavigationBar: Container(
        height: 55.0,
        child: BottomAppBar(
          color: Colors.green,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.home, color: Colors.white),
                onPressed: () {
                  _returnToHome();
                },
              ),
              IconButton(
                icon: Icon(Icons.favorite, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.account_box, color: Colors.white),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
      body: ListView(
        children: pressed ? <Widget>[
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: this.repos.length,
            itemBuilder: (BuildContext context, index) {
              return Card(
                  elevation: 8.0,
                  margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      leading: Container(
                      padding: EdgeInsets.only(right: 12.0),
                      decoration: new BoxDecoration(
                      border: new Border(
                      right: new BorderSide(width: 1.0, color: Colors.white24))),
                      child: Icon(Icons.autorenew, color: Colors.white),
                      ),
                      title: Text(
                      this.repos[index]['name'],
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                      ),

                      subtitle: Row(
                        children: <Widget>[
                        Icon(Icons.assignment, color: Colors.black),
                        Text(this.repos[index]['language'], style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                        ],
                      ),
                  ))
              );
            },
          )
        ] :
            <Widget> [
              TextField(
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                    hintText: "Enter Github User Name",
                    contentPadding: const EdgeInsets.all(20.0),
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.red)
                    )
                ),
                autofocus: true,
                onChanged: (v)=>setState((){
                  userName = v;
                }),
              ),
              RaisedButton(
                onPressed: () {
                  _callApi();
                },
                child: new Text('Search'),
              )
            ]
      ),
    );
  }
}
