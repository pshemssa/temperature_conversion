import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
// ignore: avoid_types_as_parameter_names, non_constant_identifier_names
const HomeScreen({super.key, Key});

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: const Text('Home'),
),
body: Container(
decoration: const BoxDecoration(
image: DecorationImage(
image: AssetImage('assets/images/launch_background.png'),
fit: BoxFit.cover,
),
),
child: const Center(
child: Text(
'Welcome to the Home Screen',
style: TextStyle(
color: Colors.white,
fontSize: 24,
fontWeight: FontWeight.bold,
),
),
),
),
);
}
}