import 'package:flutter/material.dart';
import 'package:web3modal_flutter/web3modal_flutter.dart';

class walletWidget extends StatefulWidget {
  const walletWidget({super.key});

  @override
  State<walletWidget> createState() => _walletWidgetState();
}

class _walletWidgetState extends State<walletWidget> {
 late W3MService _w3mService;

  @override
  void initState(){
    super.initState();
    initializeState();
  }

  void initializeState() async {
    _w3mService = W3MService(
      projectId: '62c8eaca39c29a52da1d714e6bb1df02',
      metadata: const PairingMetadata(
        name: 'AppKit Flutter Example',
        description: 'AppKit Flutter Example',
        url: 'https://walletconnect.com/',
        icons: [
          'https://docs.walletconnect.com/assets/images/web3modalLogo-2cee77e07851ba0a710b56d03d4d09dd.png'
        ],
        redirect: Redirect(
          native: 'web3modalflutter://',
          universal: 'https://walletconnect.com/appkit',
        ),
      ),
    );
    await _w3mService.init();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        W3MConnectWalletButton(service: _w3mService),
        const SizedBox(height:16),
        W3MNetworkSelectButton(service: _w3mService),
        const SizedBox(height:16),
        W3MAccountButton(service: _w3mService),

      ],
    );
  }
}