import 'package:flutter/material.dart';

import 'QR_generator.dart';
import 'home.dart';

class Receipt extends StatefulWidget {
 // Map containing prices for each ticket category
  final String smartcardNumber;
  final String name;
  final String product;
  final String amount;
  final String school; // Add venue information

  Receipt({
    required this.smartcardNumber,
    required this.name,
    required this.product,
    required this.amount,
    required this.school
  });

  @override
  _ReceiptState createState() => _ReceiptState();
}

class _ReceiptState extends State<Receipt> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 55,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);

                  },
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: const Icon(
                      Icons.close_outlined,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                ),
              ),
          Card(
                  margin: const EdgeInsets.all(16.0),
                  surfaceTintColor: Colors.white,
                  elevation: 8.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10,),
                        const Row(
                          children: [
                            Image(
                              image: AssetImage("assets/images/tick.png"),
                              width: 80,
                              // height: 40,
                            ),
                            SizedBox(width: 10),
                            Expanded(child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Success',
                                  style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Your request has been received and is being processed',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ))
                          ],
                        ),
                        SizedBox(height: 16.0),
                        Divider(
                          color: Colors.black,
                        ),
                        SizedBox(height: 16.0),
                        Row(
                          children: [
                            _buildReceiptDetail('Name', widget.name),
                            Spacer(),
                            _buildReceiptDetail('Student Card Number', widget.smartcardNumber),
                          ],
                        ),
                        _buildReceiptDetail('School', widget.school),
                        _buildReceiptDetail('Product', widget.product),
                        _buildReceiptDetail('Amount', widget.amount),
                        SizedBox(height: 16.0),
                        // Center(
                        //   child: QRCodeGenerator(
                        //     name: widget.name,
                        //     smartcardNumber: widget.smartcardNumber,
                        //     school: widget.school,
                        //     product: widget.product,
                        //     amount: widget.amount,
                        //   ),
                        // ),
                        SizedBox(height: 15,),
                        Center(
                          child: Image(
                            image: AssetImage("assets/images/edupoto.png"),
                            width: 160,
                            // height: 40,
                          ),
                        ),
                        SizedBox(height: 10,),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        )
      ),
    );
  }

  Widget _buildReceiptDetail(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.grey,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.0),
      ],
    );
  }
}
