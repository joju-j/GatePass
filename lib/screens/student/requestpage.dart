import 'package:flutter/material.dart';

import 'package:login_app/supabase/supabase.queries.dart';
import 'package:flutter/cupertino.dart';

class RequestScreen extends StatefulWidget {
  var values;
  RequestScreen({Key? key, required this.values}) : super(key: key);

  @override
  _RequestScreenState createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  DateTime time = DateTime.now();

  void _confirmbox(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text('User does not exist'),
              content: const Text('Please Enter A Valid User ID'),
              actions: [
                // The "Yes" button
                TextButton(
                    onPressed: () {
                      // Remove the box
                      Navigator.of(context).pop();
                    },
                    child: const Text('Okay')),
              ],
            ));
  }

  final List<String> items = [
    'CSE',
    'ECE',
    'EEE',
    'CE',
    'EI',
    'ME',
  ];
  String? selectedValue;
  printtime(DateTime time) {
    print(time);
  }

  final clearreason = TextEditingController();
  final clearclass = TextEditingController();
  void clearText() {
    clearclass.clear();
    clearreason.clear();
  }

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
              height: 216,
              padding: const EdgeInsets.only(top: 6.0),
              // The Bottom margin is provided to align the popup above the system navigation bar.
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              // Provide a background color for the popup.
              color: CupertinoColors.systemBackground.resolveFrom(context),
              // Use a SafeArea widget to avoid system overlaps.
              child: SafeArea(
                top: false,
                child: child,
              ),
            ));
  }

  void initState() {
    super.initState();
  }

  TimeOfDay selectedTime = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Color.fromARGB(255, 205, 112, 102),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                const Text(
                  "Request Gate Pass",
                  style: TextStyle(
                    fontSize: 28,
                    fontFamily: 'Calistoga',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.6,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 227, 144, 135),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Group Advisor: ${widget.values[0]['grpadv']} ",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Color.fromARGB(255, 85, 31, 31),
                            fontSize: 20,
                            fontFamily: 'Calistoga',
                          ),
                        ),
                        Text(
                          "Class & Batch: S${widget.values[0]['semester']} ${widget.values[0]['dept']} ${widget.values[0]['batch']}",
                          //
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Color.fromARGB(255, 85, 31, 31),
                            fontSize: 20,
                            fontFamily: 'Calistoga',
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Time of exit:  ",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Color.fromARGB(255, 85, 31, 31),
                                fontSize: 20,
                                fontFamily: 'Calistoga',
                                //fontWeight: FontWeight.bold
                              ),
                            ),
                            CupertinoButton(
                              color: Color.fromARGB(12, 0, 0, 0),
                              // Display a CupertinoDatePicker in time picker mode.
                              onPressed: () => {
                                _showDialog(
                                  CupertinoDatePicker(
                                    initialDateTime: time,
                                    mode: CupertinoDatePickerMode.time,

                                    use24hFormat: true,
                                    // This is called when the user changes the time.
                                    onDateTimeChanged: (DateTime newTime) {
                                      setState(() => time = newTime);
                                    },
                                  ),
                                ),
                              },
                              // In this example, the time value is formatted manually. You can use intl package to
                              // format the value based on the user's locale settings.
                              child: Text(
                                '${time.hour}:${time.minute}',
                                style: const TextStyle(
                                    fontSize: 18.0,
                                    color: Color.fromARGB(255, 85, 31, 31)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.height * 0.4,
                          height: MediaQuery.of(context).size.height * 0.15,
                          child: TextField(
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            controller: clearreason,
                            decoration: InputDecoration(
                              labelText: "REASON:",
                              filled: true,
                              hintText: "(Specify time of entry if exists)",
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 40, horizontal: 20),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => {
                            printtime(time),
                            showDialog(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                      title: const Text('Please Confirm'),
                                      content: const Text(
                                          'Do you want to submit this request?'),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (BuildContext ctx) {
                                                    return AlertDialog(
                                                      content: const Text(
                                                          'Your request has been submitted.'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () async {
                                                            await SupabaseCredentials
                                                                .request(
                                                                    widget
                                                                        .values,
                                                                    clearreason
                                                                        .text,
                                                                    time);
                                                            clearText();
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: const Text(
                                                              'Okay'),
                                                        ),
                                                      ],
                                                    );
                                                  });
                                              // Close the dialog
                                            },
                                            child: const Text('Yes')),
                                        TextButton(
                                            onPressed: () {
                                              // Close the dialog
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('No'))
                                      ],
                                    ))
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 20),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            backgroundColor: Color.fromARGB(255, 122, 30, 172),
                            shadowColor: Colors.black,
                            elevation: 10,
                          ),
                          child: Text(
                            'SUBMIT REQUEST',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              //fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class _DatePickerItem extends StatelessWidget {
  const _DatePickerItem({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: CupertinoColors.inactiveGray,
            width: 0.0,
          ),
          bottom: BorderSide(
            color: CupertinoColors.inactiveGray,
            width: 0.0,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children,
        ),
      ),
    );
  }
}
