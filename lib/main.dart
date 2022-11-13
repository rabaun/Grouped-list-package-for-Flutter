import 'package:flutter/material.dart';

import 'home_page.dart';

void main() => runApp(MyApp());

List _elements = [
  {
    'name': 'Sell DOT',
    'group': 'Yesterday',
    'date': '10/12/2022',
    'price': '- 10.00 DOT',
    'subprice': '- 189.82 USD'
  },
  {
    'name': 'Sell DOT',
    'group': 'Monday',
    'date': '10/12/2022',
    'price': '- 10.00 DOT',
    'subprice': '- 189.82 USD'
  },
  {
    'name': 'Sell DOT',
    'group': 'Wednesday',
    'date': '10/12/2022',
    'price': '- 10.00 DOT',
    'subprice': '- 189.82 USD'
  },
  {
    'name': 'Buy BTC',
    'group': 'Thursday, Dec 9, 2021',
    'date': '10/12/2022',
    'price': '- 10.00 DOT',
    'subprice': '- 189.82 USD'
  },
  {
    'name': 'Sell DOT',
    'group': 'Wednesday, Dec 8, 2021',
    'date': '10/12/2022',
    'price': '- 10.00 DOT',
    'subprice': '- 189.82 USD'
  },
  {
    'name': 'Sell DOT',
    'group': 'Thursday, Dec 9, 2021',
    'date': '10/12/2022',
    'price': '- 10.00 DOT',
    'subprice': '- 189.82 USD'
  },
  {
    'name': 'Sell DOT',
    'group': 'Thursday, Dec 9, 2021',
    'date': '10/12/2022',
    'price': '- 10.00 DOT',
    'subprice': '- 189.82 USD'
  },
  {
    'name': 'Sell DOT',
    'group': 'Thursday, Dec 9, 2021',
    'date': '10/12/2022',
    'price': '- 10.00 DOT',
    'subprice': '- 189.82 USD'
  },
  {
    'name': 'Sell DOT',
    'group': 'Wednesday',
    'date': '10/12/2022',
    'price': '- 10.00 DOT',
    'subprice': '- 189.82 USD'
  },
  {
    'name': 'Sell DOT',
    'group': 'Wednesday',
    'date': '10/12/2022',
    'price': '- 10.00 DOT',
    'subprice': '- 189.82 USD'
  },
];

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Transaction History',
        color: Colors.black,
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: MyHomePage(
          title: 'Transaction History',
          elements: _elements,
        ));
  }
}
