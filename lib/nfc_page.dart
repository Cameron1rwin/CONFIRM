import 'package:crypto_nfc_01/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crypto_nfc_01/core.notifier/nrf_notifier.dart';
import 'package:nfc_manager/nfc_manager.dart';
import "package:crypto_nfc_01/services/dialogs.dart";

class NfcPage extends StatefulWidget {
  const NfcPage({super.key});

  @override
  State<NfcPage> createState() => _NfcPageState();
}

class _NfcPageState extends State<NfcPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => NFCNotifier(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('NFC READ/WRITE'),
            centerTitle: true,
          ),
          body: Builder(
            builder: (BuildContext context) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          scanningDialog(context);
                          Provider.of<NFCNotifier>(context,listen : false).startNFCOperation(nfcOperation: NFCOperation.read);
                        },
                        child: const Text('READ NFC')),
                        const SizedBox(height: 16),
                    ElevatedButton(
                        onPressed: () {
                          scanningDialog(context);
                          Provider.of<NFCNotifier>(context, listen: false)
                              .startNFCOperation(
                                  nfcOperation: NFCOperation.write,
                                  dataType: "URL");
                        },
                        child: const Text('Write NFC Address')),
                        const SizedBox(height: 16),
                    ElevatedButton(
                        onPressed: () {
                          scanningDialog(context);
                          Provider.of<NFCNotifier>(context, listen: false)
                              .startNFCOperation(
                                  nfcOperation: NFCOperation.write,
                                  dataType: "URL");
                        },
                        child: const Text('Write NFC Transaction')),
                    Consumer<NFCNotifier>(builder: (context, provider, _) {
                      if (provider.isProcessing) {
                        return const CircularProgressIndicator();
                      }
                      if (provider.message.isNotEmpty) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          Navigator.pop(context);
                          showResultDialog(context, provider.message);
                        });
                      }
                      return const SizedBox();
                    }),
                  ],
                ),
              );
            },
          ),
        ));
  }
}
