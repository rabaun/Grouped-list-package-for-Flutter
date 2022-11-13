import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

import 'calendar.dart';

List<String> list = <String>['Crypto1', 'Crypto2', 'Crypto3', 'Crypto4'];

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title, required this.elements})
      : super(key: key);
  final String title;
  final List elements;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String dropValue =
      'Crypto'; //This is the selection value. It is also present in my array.
  final dropdownList = [
    'Crypto',
    'Gold',
    'Oil',
    'Currency'
  ]; //This is the array for dropdown
  String dropSells =
      'Crypto sells'; //This is the selection value. It is also present in my array.
  final dropdownSellsList = [
    'Crypto sells',
    'Gold sells',
    'Oil sells',
    'Currency sells'
  ]; //This is the array for dropdown
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Column(children: <Widget>[
          Expanded(
              flex: 1,
              child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Column(children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            margin: const EdgeInsets.all(0.0),
                            padding: const EdgeInsets.all(0.0),
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 0.2),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20))),
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            child: _dropList(),
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  margin: const EdgeInsets.all(0.0),
                                  padding: const EdgeInsets.all(0.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white, width: 0.2),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20))),
                                  height: 100,
                                  width: 100,
                                  child: _dropSellsList(),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  margin: const EdgeInsets.all(0.0),
                                  padding: const EdgeInsets.all(0.0),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white, width: 0.2),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20))),
                                  height: 100,
                                  width: 100,
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CalendarApp()));
                                    },
                                    icon: const Icon(
                                      Icons.calendar_today,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ]))),
          Expanded(
              flex: 3,
              child: Container(
                  child: Column(children: [
                Expanded(
                    flex: 10,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: _groupList(),
                    )),
              ])))
        ]));
  }

  _groupList() {
    return GroupedListView<dynamic, String>(
      elements: widget.elements,
      groupBy: (element) => element['group'],
      groupComparator: (value1, value2) => value2.compareTo(value1),
      itemComparator: (item1, item2) => item1['name'].compareTo(item2['name']),
      order: GroupedListOrder.DESC,
      useStickyGroupSeparators: true,
      groupSeparatorBuilder: (String value) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          value,
          textAlign: TextAlign.start,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
        ),
      ),
      itemBuilder: (c, element) {
        return Card(
          elevation: 8.0,
          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: SizedBox(
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
              leading: (Text(element['name']) == const Text('Sell DOT'))
                  ? const Icon(Icons.do_disturb_on_outlined)
                  : const Icon(Icons.add_circle_outline),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    element['name'],
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    element['date'],
                    textAlign: TextAlign.start,
                    style: const TextStyle(fontSize: 10),
                  ),
                ],
              ),
              trailing: Column(
                children: [
                  Text(element['price']),
                  Text(element['subprice']),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  _dropSellsList() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
      child: DropdownButton<String>(
        value: dropSells,
        dropdownColor: Colors.blue,
        icon: const Icon(Icons.expand_more),
        elevation: 16,
        underline: Container(
          height: MediaQuery.of(context).size.width,
        ),
        onChanged: (String? value) {
          // This is called when the user selects an item.
          setState(() {
            dropSells = value!;
          });
        },
        items: dropdownSellsList.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
            ),
          );
        }).toList(),
      ),
    );
  }

  _dropList() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
      child: DropdownButton<String>(
        value: dropValue,
        dropdownColor: Colors.blue,
        icon: const Icon(Icons.expand_more),
        elevation: 16,
        underline: Container(
          height: MediaQuery.of(context).size.width,
        ),
        onChanged: (String? value) {
          // This is called when the user selects an item.
          setState(() {
            dropValue = value!;
          });
        },
        items: dropdownList.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 35),
            ),
          );
        }).toList(),
      ),
    );
  }
}
