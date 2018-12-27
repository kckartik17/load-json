import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/rendering.dart';

void main() {
  debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Load JSON App')),
        body: Container(
          child: Center(
            child: FutureBuilder(
              future: DefaultAssetBundle.of(context)
                  .loadString('load_json/person.json'),
              builder: (context, snapshot) {
                //Decode JSON
                var mydata = json.decode(snapshot.data.toString());

                return ListView.builder(
                  itemBuilder: (BuildContext context, i) {
                    return Container(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Card(
                        elevation: 5.0,
                        child: Container(
                          padding: EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Text("Name : " + mydata[i]['name']),
                              Text("Age : " + mydata[i]['age']),
                              Text("Height : " + mydata[i]['height']),
                              Text("Gender : " + mydata[i]['gender'])
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: mydata == null ? 0 : mydata.length,
                );
              },
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          elevation: 5.0,
          onPressed: (){},
          child: Icon(Icons.slideshow),
        ),
        );
  }
}
