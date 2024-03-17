import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: const [
                    Icon(
                      Icons.male,
                      size: 120,
                    ),
                    Text("Male"),
                  ]),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: const [
                    Icon(
                      Icons.female,
                      size: 120,
                    ),
                    Text("FeMale"),
                  ]),
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: const [
                    Text("176",
                        style: TextStyle(fontSize: 50, color: Colors.amber)),
                    Text("Male"),
                  ]),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: const [
                    Icon(
                      Icons.female,
                      size: 120,
                    ),
                    Text("FeMale"),
                  ]),
                )
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
