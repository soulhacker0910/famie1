//file:child_reg.dart
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'home.dart'; // Replace with the path to your HomeScreen widget
import 'main.dart'; // Replace with the path to your MainScreen widget

class ChildRegistrationScreen extends StatefulWidget {
  const ChildRegistrationScreen({super.key});

  @override
  ChildRegistrationScreenState createState() => ChildRegistrationScreenState();
}

class ChildRegistrationScreenState extends State<ChildRegistrationScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? result;
  bool showScanner = false;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _scanQRCode() {
    setState(() {
      showScanner = true;
    });
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[200],
        title: Image.asset(
          'assets/image2.png',
          height: 40.0,
          fit: BoxFit.cover,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            color: Colors.black,
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
                (Route<dynamic> route) => false,
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            color: Colors.black,
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const MyApp()),
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                width: 80,
                height: 80,
                child: MaterialButton(
                  onPressed: _scanQRCode,
                  color: Colors.white,
                  textColor: Colors.black,
                  shape: const CircleBorder(
                    side: BorderSide(color: Colors.black, width: 2),
                  ),
                  child: const Icon(Icons.add, size: 40),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Add Child',
              style: TextStyle(fontSize: 18, fontFamily: 'Georgia', fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(
            color: Colors.green,
            thickness: 2,
            height: 20,
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                if (showScanner) // QR code scanner view
                  QRView(
                    key: qrKey,
                    onQRViewCreated: _onQRViewCreated,
                    overlay: QrScannerOverlayShape(
                      borderColor: Colors.green,
                      borderRadius: 10,
                      borderLength: 30,
                      borderWidth: 10,
                      cutOutSize: MediaQuery.of(context).size.width * 0.8,
                    ),
                  ),
  if (showScanner)
  Positioned(
    top: 10,
    right: 10,
    child: Container(
      padding: EdgeInsets.zero, // Set padding to zero for a smaller box
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.green,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(2),
      ),
      child: IconButton(
        icon: const Icon(
          Icons.close,
          color: Colors.red,
          size: 30, // Set a smaller icon size if desired
        ),
        onPressed: () {
          setState(() {
            showScanner = false;
          });
        },
        padding: const EdgeInsets.all(2), // Adjust padding to change the size of the button
        constraints: const BoxConstraints(), // Apply constraints to reduce the default size of IconButton
      ),
    ),
  ),

                if (showScanner)
                  Positioned(
                    top: 60,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'Place the QR code inside the frame',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                if (result != null)
                  Positioned(
                    bottom: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle the "Next" button press
                        setState(() {
                          showScanner = false;
                        });
                        // Proceed with the result of QR code
                      },
                      child: const Text('Next'),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
