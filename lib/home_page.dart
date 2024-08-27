import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(
          backgroundColor: const Color(0xFF3B82F6),
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
                              borderRadius: BorderRadius.circular(100.0)),
                          child: const Center(child: Text("3")),
                        ),
                      ),
                    ),
                    const Icon(Icons.notifications_outlined,
                        color: Colors.white),
                  ],
                )),
            const SizedBox(width: 8.0),
          ]),
      body: const Column(
        children: [
          _SearchField(),
          SizedBox(height: 8.0),
          SizedBox(height: 30, child: _Filters()),
          _Cryptos(),
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
              color: const Color(0xFFEAB308).withOpacity(0.25), width: 1.0),
        ),
        child: Row(
          children: [
            const SizedBox(width: 8.0),
            const Icon(Icons.search, color: Colors.white),
            const SizedBox(width: 8.0),
            Expanded(
              child: TextField(
                controller: TextEditingController(),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.3))),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(width: 8.0),
          ],
        ),
      ),
    );
  }
}

class _Filters extends StatelessWidget {
  const _Filters({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      children: const [
        SizedBox(width: 16.0),
        _Filter(name: "Tradeable", isActive: true),
        _Filter(name: "Watchlist"),
        _Filter(name: "Top on Confirm"),
        _Filter(name: "meme"),
        _Filter(name: "Rewards"),
        _Filter(name: "Top % 24hr"),
        _Filter(name: "Top % 24hr"),
      ],
    );
  }
}

class _Filter extends StatelessWidget {
  const _Filter({super.key, required this.name, this.isActive = false});

  final String name;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 40.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: isActive ? const Color(0xFFDBEAFE) : Colors.transparent,
          border: Border.all(
            color: isActive ? Colors.blue : Colors.transparent,
          )),
      child: Center(
        child: Text(name,
            style: TextStyle(
                color: isActive ? Colors.blue : const Color(0xFF3B82F6))),
      ),
    );
  }
}

class _Cryptos extends StatelessWidget {
  const _Cryptos({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: const [
        _CryptoToken(
            name: "Bitcoin",
            description: "BTC",
            value: "\$ 200,000",
            growth: -6.25,
            image: "images/bitcoin.png"),
      ],
    );
  }
}

class _CryptoToken extends StatelessWidget {
  const _CryptoToken(
      {super.key,
      required this.name,
      required this.description,
      required this.value,
      required this.growth,
      required this.image});

  final String image;
  final String name;
  final String description;
  final String value;
  final double growth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80.0,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(children: [
        Image.asset(image, width: 40.0, height: 40.0),
        const SizedBox(width: 16.0),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(color: Color(0xFF0F172A)),
            ),
            const SizedBox(height: 8.0),
            Text(
              description,
              style: TextStyle(
                color: const Color(0xFF0F172A).withOpacity(0.5),
              ),
            ),
          ],
        ),
        const Spacer(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              name,
              style: const TextStyle(color: Color(0xFF0F172A)),
            ),
            const SizedBox(height: 8.0),
            Text(
              "$growth%",
              style: TextStyle(
                color: growth < 0 ? Colors.red : Colors.green
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
