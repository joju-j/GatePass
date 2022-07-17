import 'package:flutter/material.dart';
import 'package:login_app/screens/hod/decison.dart';

void main() {
  runApp(const hodreq());
}

class hodreq extends StatelessWidget {
  const hodreq({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // Remove the debug banner
        debugShowCheckedModeBanner: false,
        title: ' x',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  // Generate some dummy data
  final List<Map<String, dynamic>> _items = List.generate(
      100,
      (index) => {
            "id": index,
            "title": "Name $index",
            "subtitle": "Time $index",
            "subtitle": "Time $index"
          });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Request List'),
      ),
      body: ListTileTheme(
        contentPadding: const EdgeInsets.all(15),
        iconColor: Colors.red,
        textColor: Colors.black54,
        tileColor: Colors.yellow[100],
        style: ListTileStyle.list,
        dense: true,
        child: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (_, index) => Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              title: Text(_items[index]['title']),
              subtitle: Text(_items[index]['subtitle']),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => decision()));
                      },
                      icon: const Icon(Icons.assignment)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.check)),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.block_rounded)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
