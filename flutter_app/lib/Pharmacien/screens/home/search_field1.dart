import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:just_audio/just_audio.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import '../../model/qr_scan_screen.dart';

class SearchField1 extends StatefulWidget {
  const SearchField1({super.key});

  @override
  _SearchField1State createState() => _SearchField1State();
}

class _SearchField1State extends State<SearchField1> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      // Traitement du code QR scanné (scanData)
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _takePhoto() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      // Traitement de l'image prise (pickedFile)
      print('Image prise: ${pickedFile.path}');
    }
  }

 void _startScanning() async {
 
    Navigator.push(context,
                MaterialPageRoute(builder: (context) => QRScanScreen()));
  
}

  final stt.SpeechToText _speechToText = stt.SpeechToText();

  void _startListening() async {
    if (await _speechToText.initialize()) {
      _speechToText.listen(
        onResult: (result) {
          String text = result.recognizedWords;
          // Traitement du texte reconnu (text)
          print('Texte reconnu: $text');
        },
      );
    } else {
      print("Échec de l'initialisation de la reconnaissance vocale");
    }
  }

  void _stopListening() {
    _speechToText.stop();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFf3f3f3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      centerTitle: true,
      title: TextField(
        onChanged: (value) => log(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          hintText: "Search",
          prefixIcon: Icon(Icons.search),
          hintStyle: TextStyle(
            fontSize: 14,
            color: Color(0xFFBDBDBD),
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.camera_alt),
          onPressed: _takePhoto,
        ),
        IconButton(
          icon: Icon(Icons.qr_code_scanner_outlined),
          onPressed: _startScanning,
        ),
        IconButton(
          icon: Icon(Icons.mic),
          onPressed: () {
            if (_speechToText.isListening) {
              _stopListening();
            } else {
              _startListening();
              // Pour arrêter l'écoute après un certain temps :
              // Future.delayed(Duration(seconds: 5), () => _stopListening());
            }
          },
        ),
      ],
    );
  }
}

class QRViewExample extends StatefulWidget {
  const QRViewExample({required this.qrKey});

  final GlobalKey qrKey;

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    }
    controller?.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QRView(
        key: widget.qrKey,
        onQRViewCreated: _onQRViewCreated,
      ),
    );
  }

  QRViewController? controller;

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      // Traitement du code QR scanné (scanData)
      Navigator.pop(context, scanData);
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}

