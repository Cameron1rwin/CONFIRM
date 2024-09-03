import "package:flutter/material.dart";
import "package:nfc_manager/nfc_manager.dart";

class NFCNotifier extends ChangeNotifier {
  bool _isProcessing = false;
  String _message = "";

  bool get isProcessing => _isProcessing;

  String get message => _message;

  Future<void> startNFCOperation(
      {required NFCOperation nfcOperation, String dataType = ""}) async {
    try {
      _isProcessing = true;
      notifyListeners();

      bool isAvail = await NfcManager.instance.isAvailable();

      if (isAvail) {
        if (nfcOperation == NFCOperation.read) {
          _message = "Scanning";
        } else if (nfcOperation == NFCOperation.write) {
          _message = "Writing To Tag";
        }

        notifyListeners();

        NfcManager.instance.startSession(onDiscovered: (NfcTag nfcTag) async {
          if (nfcOperation == NFCOperation.read) {
            _readFromTag(nfcTag: nfcTag);
          } else if (nfcOperation == NFCOperation.write) {
            _writeToTag(nfcTag : nfcTag, dataType: dataType);
          }

          _isProcessing = false;
          notifyListeners();
          await NfcManager.instance.stopSession();
        }, onError: (e) async {
          _isProcessing = false;
          _message = e.toString();
          notifyListeners();
        });
      } else {
        _isProcessing = false;
        _message = "Please Enable NFC from Settings";
        notifyListeners();
      }
    } catch (e) {
      _isProcessing = false;
      _message = e.toString();
      notifyListeners();
    }
  }

  Future<void> _readFromTag({required NfcTag nfcTag}) async {
    //Extract info from NFC
    Map<String, dynamic> nfcData = {
      'nfca': nfcTag.data,
      'mifarevultralight': nfcTag.data['mifarevultralight'],
      'ndef': nfcTag.data['ndef']
    };

    String? decodedText;
    if (nfcData.containsKey('ndef')) {
      List<int> payload =
          nfcData['ndef']['cachedMessage']?['records']?[0]['payload'];
      decodedText = String.fromCharCodes(payload);
    }

    _message = decodedText ?? "No Data Found";
  }

  Future<void> _writeToTag(
      {required NfcTag nfcTag, required String dataType}) async {
    NdefMessage message = _createNdefMessage(dataType: dataType);
    await Ndef.from(nfcTag)?.write(message);
    _message = "DONE";
  }

  NdefMessage _createNdefMessage({required String dataType}) {
    switch (dataType) {
      case 'URL':
        {
          return NdefMessage([
            NdefRecord.createUri(Uri.parse('https://agmnt.xyz/')),
          ]);
        }
        case 'MAIL' :
        {
          return NdefMessage([
            NdefRecord.createUri(
              Uri.parse("mailto:agmnt.xyz@gmail.com")
            ),
          ]);
        }



      default:
        return const NdefMessage([]);
    }
  }
}

enum NFCOperation { read, write }
