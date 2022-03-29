import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Map<String, dynamic> map = {
      "config" : {
        "haha" : "hoho",
        "ihhou" : {
          "hihi" : "oh no",
          "hehe" : "yes",
          "yiha" : {
            "test1" : "test1",
            "test2" : "test2"
          }
        }
      }
    };

    return Scaffold(
      body: Center(
        child: TestingWidget(
          map: map,
        ),
      ),
    );
    return Scaffold(
      body: Center(
        child: ListTile(
          title: IntrinsicWidth(
            child: Row(
              children: [
                Text("PRODUCT NAME"),
                Expanded(
                  child: TextField(),
                ),
                Text('PRICE'),
                Expanded(
                  child: TextField(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TestingWidget extends StatelessWidget {
  final Map<String, dynamic> map;
  const TestingWidget({
    Key? key,
    required this.map
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];
    map.forEach((key, value) {
      if (value is String) {
        items.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Expanded(child: Text(key)), Spacer(), Expanded(child: Text(value))],
          )
        );
      } else {
        items.add(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(key),
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: TestingWidget(
                  map: value
                ),
              ),
            ],
          )
        );
      }
    });
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [...items],
    );
  }
}
