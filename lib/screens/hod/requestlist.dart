import 'package:flutter/material.dart';
import 'package:login_app/screens/hod/decision.dart';
import '../../supabase/supabase.queries.dart';

class requestlist extends StatelessWidget {
  var results, title;

  requestlist({required this.results, required this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Request List'),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            ListView.builder(
              itemCount: results.length,
              itemBuilder: (context, index) => Card(
                elevation: 6,
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.purple,
                    child: Text(results[index]["request_id"].toString()),
                  ),
                  title: Text(results[index]["name"]),
                  subtitle: Text('Exit Time: ${results[index]["exit_time"]}'),
                  trailing: TextButton.icon(
                    icon: Icon(Icons.assignment),
                    label: Text('View Details'),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              decision(value: results[index])));
                    },
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment(0.95, 0.95),
              child: FloatingActionButton(
                onPressed: () async {
                  var allres = await SupabaseCredentials.allrequests(title);
                  if (allres.length > 0) {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            requestlist(results: allres, title: title),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                            "No requests available at the moment! Try again later!"),
                      ),
                    );
                  }
                },
                child: const Icon(Icons.refresh),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
