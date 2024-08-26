import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
          backgroundColor: Colors.grey,
          elevation: 0,
          title: const Text(
            "PRICES",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
            ),
            centerTitle: true,
            leading: const Icon(Icons.menu),
            actions: [
              SizedBox(
                height: double.infinity,
                width: 30.0,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 10.0,
                        height: 10.0,
                        color: Colors.red,
                        child: const Center(child: Text("3")),
                      ),
                    ),
                    const Icon(Icons.notifications_outlined),
                  ],
                )
                ),
              SizedBox(width: 8.0),
            ]
      ),
    );
  }
}