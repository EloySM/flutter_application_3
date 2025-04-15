import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<Map<String, dynamic>> transactionsData = [
  {
    'icon': FaIcon(FontAwesomeIcons.burger, color: Colors.white,),
    'color': Colors.yellow[800],
    'name': 'Food',
    'totalAmount': '-\$45.00',
    'date': 'Today',
  },
  {
    'icon': FaIcon(FontAwesomeIcons.bagShopping, color: Colors.white),
    'color': Colors.pink[300],
    'name': 'Shopping',
    'totalAmount': '-\$230.00',
    'date': 'Today',
  },
  {
    'icon': FaIcon(FontAwesomeIcons.heartPulse, color: Colors.white),
    'color': Colors.green[500],
    'name': 'Health',
    'totalAmount': '-\$79.00',
    'date': 'Yesterday',
  },
  {
    'icon': FaIcon(FontAwesomeIcons.plane, color: Colors.white),
    'color': Colors.lightBlue[400],
    'name': 'Travel',
    'totalAmount': '-\$350.00',
    'date': 'Yesterday',
  }
];