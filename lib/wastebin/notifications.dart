import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:login_app/screens/hod/decision.dart';
import 'package:login_app/supabase/supabase.queries.dart';

// class hodreq extends StatelessWidget {
//   const hodreq({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         // Remove the debug banner
//         debugShowCheckedModeBanner: false,
//         title: ' x',
//         theme: ThemeData(
//           primarySwatch: Colors.red,
//         ),
//         home: HomePage());
//   }
// }

class hodreq extends StatefulWidget {
  var userid, results;

  hodreq({required this.userid, required this.results});

  @override
  State<hodreq> createState() => _hodreqState();
}

class _hodreqState extends State<hodreq> {
  // Generate some dummy data
  int i = 0;
  var a, b;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(
          title: const Text('Request List'),
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.blue,
                height: 100,
                child: Center(
                  child: Text(
                    "Student Name: " + widget.results[i]['name'],
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.blue,
                height: 100,
                child: Center(
                  child: Text(
                    "Exit time: " + widget.results[i]['exit_time'],
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 100,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              decision(value: widget.results[i])));
                    },
                    icon: const Icon(Icons.assignment)),
                const SizedBox(
                  width: 40,
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      // a = json.decode(widget.results[i]['name'].toString());
                      // b = json.decode(widget.results[i]['exit_time'].toString());
                      if (i >= widget.results.length - 1) {
                        i = 0;
                      } else {
                        i++;
                      }
                      print(widget.results.length);
                    });
                  },
                  child: const Icon(Icons.refresh),
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),

            // ListView.builder(
            //     itemCount: 4,
            //     itemBuilder: (context, index) {
            //       return Card(
            //         margin: const EdgeInsets.all(10),
            //         child: ListTile(
            //           leading: Text(
            //             widget.results,
            //             style: TextStyle(color: Colors.black),
            //           ),
            //           title: Text(
            //             widget.results,
            //           ),
            //           // subtitle: Text(_items[index]["description"]),
            //         ),
            //       );
            //     })
          ],
        ));
  }
}

// Stack(
//         children: [
//           ListTileTheme(
//             contentPadding: const EdgeInsets.all(15),
//             iconColor: Colors.red,
//             textColor: Colors.black54,
//             tileColor: Colors.yellow[100],
//             style: ListTileStyle.list,
//             dense: true,
//             child: ListView.builder(
//               itemCount: _items.length,
//               itemBuilder: (_, index) => Card(
//                 margin: const EdgeInsets.all(10),
//                 child: ListTile(
//                   title: Text(_items[index]['title']),
//                   subtitle: Text(_items[index]['subtitle']),
//                   trailing: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       IconButton(
//                           onPressed: () {
//                             print("helloo");
//                             print(context);
//                             Navigator.of(context).push(MaterialPageRoute(
//                                 builder: (context) => decision()));
//                           },
//                           icon: const Icon(Icons.assignment)),
//                       IconButton(
//                           onPressed: () {}, icon: const Icon(Icons.check)),
//                       IconButton(
//                           onPressed: () {},
//                           icon: const Icon(Icons.block_rounded)),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               const SizedBox(
//                 width: double.infinity,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   FloatingActionButton(
//                     onPressed: () {
//                       //supabase indakitt code cheyyam
//                     },
//                     child: const Icon(Icons.refresh),
//                   ),
//                   const SizedBox(
//                     width: 20,
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//             ],
//           )
//         ],
//       ),

//  FutureBuilder<List>(
//         future: results,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             print(snapshot.data);
//             return ListView.builder(
//                 // scrollDirection: Axis.vertical,
//                 physics: NeverScrollableScrollPhysics(),
//                 shrinkWrap: true,
//                 itemCount: snapshot.data?.length,
//                 itemBuilder: (context, i) {
//                   return Column(
//                     children: [
//                       Text(
//                         snapshot.data![i]['name'].toString(),
//                       ),
//                       Text(
//                         snapshot.data![i]['exit_time'].toString(),
//                       ),
//                     ],
//                   );
//                 });
//           } else {
//             return const Center(
//               child: Text("No data available",
//                   style: TextStyle(
//                       color: Colors.blueGrey,
//                       fontFamily: "poppins",
//                       fontSize: 15)),
//             );
//           }
//         },
//       ),