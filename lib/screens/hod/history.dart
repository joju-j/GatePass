import 'package:flutter/material.dart';
import 'package:login_app/screens/hod/decision.dart';
import 'package:login_app/screens/hod/info.dart';

void main() {
  runApp(history());
}

// class history extends StatelessWidget {
//   const history({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       // Remove the debug banner
//       debugShowCheckedModeBanner: false,
//       title: 'History',
//       home: HomePage(),
//     );
//   }
// }

class history extends StatefulWidget {
  const history({Key? key}) : super(key: key);

  @override
  _historyState createState() => _historyState();
}

class _historyState extends State<history> {
  // This holds a list of fiction users
  // You can use data fetched from a database or a server as well
  final List<Map<String, dynamic>> _allUsers = [
    {"id": 1, "name": "Andy", "class": "CSA", "time": "11:00"},
    {"id": 2, "name": "Aragon", "class": "CSA", 'time': "12:34"},
    {"id": 3, "name": "Bob", "class": "CSA", "time": "10:00"},
    {"id": 4, "name": "Barbara", "class": "CSA", "time": "10:00"},
    {"id": 5, "name": "Candy", "class": "CSA", "time": "10:00"},
    {"id": 6, "name": "Colin", "class": "CSA", "time": "10:00"},
    {"id": 7, "name": "Audra", "class": "CSA", "time": "10:00"},
    {"id": 8, "name": "Banana", "class": "CSA", "time": "10:00"},
    {"id": 9, "name": "Caversky", "class": "CSA", "time": "10:00"},
    {"id": 10, "name": "Becky", "class": "CSA", "time": "10:00"},
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    // at the beginning, all users are shown
    _foundUsers = _allUsers;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      results += _allUsers
          .where((user) => user["class"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                  labelText: 'Search', suffixIcon: Icon(Icons.search)),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: _foundUsers.isNotEmpty
                  ? ListView.builder(
                      itemCount: _foundUsers.length,
                      itemBuilder: (context, index) => Card(
                        key: ValueKey(_foundUsers[index]["id"]),
                        color: Color.fromARGB(255, 238, 178, 174),
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                            leading: Text(
                              _foundUsers[index]["id"].toString(),
                              style: const TextStyle(fontSize: 24),
                            ),
                            title: Text(_foundUsers[index]['name']),
                            subtitle: Text(
                                '${_foundUsers[index]["class"].toString()} '),
                            trailing: IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => info()));
                                },
                                icon: const Icon(Icons.assignment))
                            //Text('${_foundUsers[index]["time"].toString()} '),
                            ),
                      ),
                    )
                  : const Text(
                      'No results found',
                      style: TextStyle(fontSize: 24),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
