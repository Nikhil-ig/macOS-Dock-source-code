///
/// This project is built without any third party packages!!
/// Only used Flutter and Dart core!!
///

import 'package:dock/core/global_variable.dart';
import 'package:flutter/material.dart';

import 'widget/dock_bar.dart';
import 'widget/screen_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Dock',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
              GlobalVaribles.backgroundImage,
            ),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          alignment: Alignment.bottomCenter,
          margin: const EdgeInsets.only(bottom: 8),
          height: MediaQuery.sizeOf(context).height,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              homeScreenApps(setState),
              dockBar(setState),
            ],
          ),
        ),
      ),
    );
  }
}

// extension SwappableList<E> on List<E> {
//   void swap(int first, int second) {
//     final temp = this[first];
//     this[first] = this[second];
//     this[second] = temp;
//   }
// }
