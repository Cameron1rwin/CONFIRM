import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(
          backgroundColor: const Color(0xFF1E3A8A),
          elevation: 0,
          title: const Text(
            "PRICES",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
            ),
            centerTitle: true,
            leading: const Icon(
              Icons.menu,
              color: Colors.white,
              ),
            actions: [
              SizedBox(
                height: double.infinity,
                width: 30.0,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 20.0,
                          height: 20.0,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFBBF24),
                            borderRadius: BorderRadius.circular(100.0)
                          ),
                          child: const Center(child: Text("3")),
                        ),
                      ),
                    ),
                    const Icon(Icons.notifications_outlined, color: Colors.white),
                  ],
                )
                ),
              const SizedBox(width: 8.0),
            ]
      ),
      body: const Column(
        children: [
          _SearchField(),
        ],
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
      child: Container(
        height: 50.0,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: const Color(0xFF64748B).withOpacity(0.4),
          border: Border.all(
            color :const Color(0xFFEAB308).withOpacity(0.25), 
            width: 1.0
            ),
        ),
        child: const Row(
          children: [
            SizedBox(width: 8.0),
            Icon(Icons.search, color: Colors.white),
            SizedBox(width: 8.0),
            Expanded(
              child : TextField(),
            ),
            SizedBox(width: 8.0),
          ],
        ),
      ),
    );
  }
}