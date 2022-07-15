import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

void main() => runApp(RequestScreen());

class RequestScreen extends StatefulWidget {
  @override
  _DateTimePickerState createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<RequestScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

final List<String> items = [
  'HOD CSE',
  'HOD ECE',
  'HOD EEE',
  'HOD CE',
  'HOD EI',
  'HOD ME'
];
String? selectedValue;

List<DropdownMenuItem<String>> _addDividersAfterItems(List<String> items) {
  List<DropdownMenuItem<String>> _menuItems = [];
  for (var item in items) {
    _menuItems.addAll(
      [
        DropdownMenuItem<String>(
          value: item,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              item,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ),
        //If it's last item, we will not add Divider after it.
        if (item != items.last)
          const DropdownMenuItem<String>(
            enabled: false,
            child: Divider(),
          ),
      ],
    );
  }
  return _menuItems;
}

List<int> _getDividersIndexes() {
  List<int> _dividersIndexes = [];
  for (var i = 0; i < (items.length * 2) - 1; i++) {
    //Dividers indexes will be the odd indexes
    if (i.isOdd) {
      _dividersIndexes.add(i);
    }
  }
  return _dividersIndexes;
}

class _HomeScreenState extends State<HomeScreen> {
  String _date = "Not set";
  String _time = "Not set";
  @override
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
                  width: 360,
                  height: 550,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 227, 144, 135),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: 260,
                        height: 500,
                        child: Column(
                          children: [
                            // const TextField(
                            //   decoration: InputDecoration(
                            //     labelText: "HOD:",
                            //     filled: true,
                            //     fillColor: Colors.white,
                            //     border: OutlineInputBorder(
                            //       borderRadius:
                            //           BorderRadius.all(Radius.circular(100)),
                            //     ),
                            //   ),
                            // ),
                            DropdownButtonHideUnderline(
                              child: DropdownButton2(
                                isExpanded: true,
                                hint: Text(
                                  '    Select HOD:',
                                  style: TextStyle(
                                    fontSize: 18,
                                    //color: Theme.of(context).hintColor,
                                  ),
                                ),
                                items: _addDividersAfterItems(items),
                                customItemsIndexes: _getDividersIndexes(),
                                customItemsHeight: 5,
                                value: selectedValue,
                                buttonDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                    color: Colors.black26,
                                  ),
                                  color: Color.fromARGB(255, 246, 242, 242),
                                ),
                                dropdownDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: Color.fromARGB(255, 201, 181, 181),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    selectedValue = value as String;
                                  });
                                },
                                buttonHeight: 55,
                                buttonWidth: 300,
                                itemHeight: 40,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const TextField(
                              decoration: InputDecoration(
                                labelText: "CLASS:",
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100)),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            // const TextField(
                            //   decoration: InputDecoration(
                            //     labelText: "TIME:",
                            //     filled: true,
                            //     fillColor: Colors.white,
                            //     border: OutlineInputBorder(
                            //       borderRadius:
                            //           BorderRadius.all(Radius.circular(100)),
                            //     ),
                            //   ),
                            // ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Time of exit:  ",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 85, 31, 31),
                                    fontSize: 15,
                                    fontFamily: 'Calistoga',
                                    //fontWeight: FontWeight.bold
                                  ),
                                ),
                                // SizedBox(
                                //   height: 10.0,
                                // ),
                                RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100)),
                                  elevation: 4.0,
                                  onPressed: () {
                                    DatePicker.showTimePicker(context,
                                        theme: DatePickerTheme(
                                          containerHeight: 200.0,
                                        ),
                                        showTitleActions: true,
                                        onConfirm: (time) {
                                      print('confirm $time');
                                      _time = '${time.hour} : ${time.minute} ';
                                      setState(() {});
                                    },
                                        currentTime: DateTime.now(),
                                        locale: LocaleType.en);
                                    setState(() {});
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 50.0,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Container(
                                              child: Row(
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.access_time,
                                                    size: 18.0,
                                                    color: Colors.teal,
                                                  ),
                                                  Text(
                                                    " $_time",
                                                    style: TextStyle(
                                                        color: Colors.teal,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15.0),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        Text(
                                          "  Change",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 212, 97, 20),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                  color: Colors.white,
                                )
                              ],
                            ),
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            // children: [
                            //   const SizedBox(
                            //     width: 20,
                            //   ),
                            //   Text(
                            //     "Time:",
                            //     style: TextStyle(
                            //       fontSize: 28,
                            //       fontFamily: 'Calistoga',
                            //     ),
                            //   ),
                            //   const SizedBox(
                            //     width: 80,
                            //   ),
                            //   Text(
                            //     "${selectedTime.hour}:${selectedTime.minute}",
                            //     style: TextStyle(
                            //       fontSize: 28,
                            //       fontFamily: 'Calistoga',
                            //     ),
                            //   ),
                            // ],
                            const SizedBox(
                              height: 30,
                            ),
                            const SizedBox(
                              width: 500,
                              child: TextField(
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                decoration: InputDecoration(
                                  labelText: "REASON:",
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 50, horizontal: 20),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            ElevatedButton(
                              onPressed: () => {},
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.only(
                                    left: 40, right: 40, top: 10, bottom: 10),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                primary: Color.fromARGB(255, 122, 30, 172),
                                shadowColor: Colors.black,
                                elevation: 10,
                              ),
                              child: Text(
                                'Submit Request',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  //fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
