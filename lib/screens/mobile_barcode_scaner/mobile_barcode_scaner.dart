import 'package:barcodescaner/screens/mobile_barcode_scaner/barcode_scaner_with_controller.dart';
import 'package:barcodescaner/screens/mobile_barcode_scaner/barcode_scaner_without_controller.dart';
import 'package:barcodescaner/screens/mobile_barcode_scaner/barcode_scanning_returning_image.dart';
import 'package:flutter/material.dart';


class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Demo Home Page')),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const BarcodeScannerWithController(),
                  ),
                );
              },
              child: const Text('MobileScanner with Controller'),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.of(context).push(
            //       MaterialPageRoute(
            //         builder: (context) => const BarcodeScannerReturningImage(),
            //       ),
            //     );
            //   },
            //   child:
            //       const Text('MobileScanner with Controller (returning image)'),
            // ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        const BarcodeScannerWithoutController(),
                  ),
                );
              },
              child: const Text('MobileScanner without Controller'),
            ),
          ],
        ),
      ),
    );
  }
}