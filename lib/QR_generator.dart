import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeGenerator extends StatelessWidget {
  final String smartcardNumber;
  final String name;
  final String product;
  final String amount;
  final String school;

  const QRCodeGenerator({
    Key? key,
    required this.smartcardNumber,
    required this.name,
    required this.product,
    required this.amount,
    required this.school,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Concatenate ticket information into a single string
    String recieptData = "$name|$smartcardNumber|$product|$amount|$school";

    return Center(
      child: Container(
        // You can customize the Container with padding, decoration, etc.
        child: QrImageView(
          data: recieptData,
          version: QrVersions.auto,
          size: 200.0,
        ),
      ),
    );
  }
}
