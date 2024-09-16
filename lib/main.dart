import 'package:crypto_nfc_01/home_page.dart';
import 'package:crypto_nfc_01/nfc_page.dart';
import 'package:crypto_nfc_01/services/web3_connect.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web3modal_flutter/web3modal_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'NFC Crypto App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF007ACC)),
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  // var connectedWallet = String;

  // void connectWallet() {
  //   if (connectedWallet == (current)) {
  //     favorites.remove(current);
  //   } else {
  //     favorites.add(current);
  //   }
  //   notifyListeners();
  // }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  var selectedIndex = 0;

  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = const HomePage();
        break;
      case 1:
        page = const NfcPage();
        break;
      case 2:
        page = const HomePage();
        break;

      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Row(
          children: [
            SafeArea(
              child: NavigationRail(
                extended: false,
                destinations: const [
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text('Home'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.favorite),
                    label: Text('Favorites'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.rocket_launch),
                    label: Text('MORE'),
                  ),
                ],
                selectedIndex: selectedIndex,
                onDestinationSelected: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
              ),
            ),
            Expanded(
              child: Column(
                children: [
                                    const Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [walletWidget()]),
                  ),
                  Flexible(
                    flex: 12,
                    fit: FlexFit.loose,
                    child: Container(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      child: page,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
