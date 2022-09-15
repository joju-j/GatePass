import 'package:flutter/material.dart';
import 'info.dart';

class historylist extends StatelessWidget {
  var results;

  historylist({Key? key, required this.results}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History List'),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: results.length,
          itemBuilder: (context, index) => Card(
            elevation: 6,
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.purple,
                child: Text('${results[index]['req_id']}'),
              ),
              title: Text('${results[index]["name"]}'),
              subtitle: Text('Request Date: ${results[index]["created"]}'),
              trailing: TextButton.icon(
                icon: Icon(Icons.assignment),
                label: Text('View Details'),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => info(value: results[index])));
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
