import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:login_app/screens/hod/decision.dart';
import 'package:login_app/supabase/supabase.credentials.dart';

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
      //backgroundColor: Colors.amber,

      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 325,
                height: 250,
              ),
              // ListTileTheme(
              //   contentPadding: const EdgeInsets.all(15),
              //   iconColor: Colors.red,
              //   textColor: Colors.black54,
              //   tileColor: Colors.yellow[100],
              //   style: ListTileStyle.list,
              //   dense: true,

              SizedBox(
                height: 70,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  tileColor: Colors.red,
                  textColor: Colors.white,
                  iconColor: Colors.white,
                  leading: const Icon(Icons.start),
                  title: Text("Student Name: ${widget.results[i]['name']}"),
                  subtitle:
                      Text("Exit time:  ${widget.results[i]['exit_time']}"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 300,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  TextButton.icon(
                    icon: Icon(Icons.assignment),
                    label: Text('View Details'),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              decision(value: widget.results[i])));
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  TextButton.icon(
                      icon: Icon(Icons.arrow_back),
                      label: Text('Previous'),
                      onPressed: () {
                        setState(() {
                          if (i == 0) {
                            i = 0;
                          } else {
                            --i;
                          }
                        });
                      }),
                  const SizedBox(
                    width: 20,
                  ),
                  TextButton.icon(
                    label: Text('Next'),
                    icon: Icon(Icons.arrow_forward),
                    onPressed: () {
                      setState(() {
                        if (i >= widget.results.length - 1) {
                          i = widget.results.length - 1;
                        } else {
                          i++;
                        }
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
