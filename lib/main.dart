import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
                backgroundColor: Colors.white,
                toolbarHeight: 80,
                leading: const BackButton(
                  color: Colors.grey,
                ),
                title: const Text(
                  'CASA',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Zen Antique Soft',
                  ),
                )),
            body: const Center(
              child: Text('XXXXXXX'),
            )));
  }
}
