import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScanScreen extends StatefulWidget {
  @override
  _QRScanScreenState createState() => _QRScanScreenState();
}

class _QRScanScreenState extends State<QRScanScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  bool isScanning = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('QR Code Scanner')),
      body: Stack(
        alignment: Alignment.center,
        children: [
          QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  isScanning = !isScanning;
                });
                controller?.toggleFlash();
              },
              child: Text(isScanning ? 'Turn off flash' : 'Turn on flash'),
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      // Vous pouvez ici faire quelque chose avec la valeur du code QR scanné, par exemple l'afficher dans une boîte de dialogue ou effectuer une action spécifique.
      print('QR Code scanné: ${scanData.code}');
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
