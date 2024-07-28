import 'package:edupoto/receipt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class TerekaAsome extends StatefulWidget {
  const TerekaAsome({Key? key}) : super(key: key);

  @override
  State<TerekaAsome> createState() => _TerekaAsomePageState();
}

class _TerekaAsomePageState extends State<TerekaAsome> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  bool querySuccess = false;
  bool isSubmitting = false;
  bool isProcessing = false;
  String? selectedProduct = "Rudishule Edubox";
  String? selectedItem = "Rudishule Edubox Standard";
  String accountNumber = '';
  String amount = '';
  TextEditingController amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _controller.forward();

    amountController.text = '';
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: Container(
            padding: EdgeInsets.only(left: 14),
            child: Image(
              image: AssetImage("assets/images/back.png"),
              width: 10,
              // height: 40,
            ),
          ),
        ),
        title: Text(
          'Deposit on Tereka Asome',
          style: TextStyle(fontWeight: FontWeight.bold,
          fontSize: 20),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child:       querySuccess ?
          SlideTransition(
            position: _offsetAnimation,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 24,
                  ),
                  InfoCard(smartcardNumber: accountNumber,
                      name: "Kajimu Musa",
                      school: "Kitante Primary school",
                      product: "00011-Rudishule Edubox Standard"),
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                    'Choose the Product to pay for',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: selectedItem,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedItem = newValue;
                      });
                    },
                    items: <String?>['Rudishule Edubox Standard', 'Rudishule Edubox Prime', 'Kiddotab', 'Bingwa Magazine']
                        .map<DropdownMenuItem<String>>((String? value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value!),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black,
                              width: 2
                          )
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),
                    controller: amountController,
                    onChanged: (value) {
                      amount = value;
                      amountController.text = value;
                    },
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      _AmountTextInputFormatter(), // Custom formatter for adding commas
                    ],
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                          color: Colors.black
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black,
                              width: 2
                          )
                      ),
                      labelText: 'Enter Amount',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 65,
                    child: isProcessing?
                    LinearProgressIndicator(
                      backgroundColor: Colors.white,
                      color: Colors.black,
                    ) :
                    ElevatedButton(
                      onPressed: () {
                        // Add functionality for deposit button
                        setState(() {
                          isProcessing = true;
                        });

                        Future.delayed(Duration(seconds: 3), () {
                          setState(() {
                            isProcessing = false;
                            // _controller.reverse();
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Receipt(smartcardNumber: accountNumber, name: 'Kajimu Musa',
                                  product: "00011-Rudishule Edubox Standard", amount: amountController.text, school: 'Kitante Primary school')), // Navigate to DepositPage
                            );
                          });
                        });
                      },
                      child: Text(
                        'Pay',
                        style: TextStyle(color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.black),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ) :
          SlideTransition(
            position: _offsetAnimation,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Choose the Product to pay for',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: selectedProduct,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedProduct = newValue;
                      });
                    },
                    items: <String?>['Rudishule Edubox', 'Product 1', 'Product 2', 'Product 3', 'Product 4']
                        .map<DropdownMenuItem<String>>((String? value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value!),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black,
                              width: 2
                          )
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    onChanged: (value) {
                      accountNumber = value;
                    },
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                          color: Colors.black
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black,
                              width: 2
                          )
                      ),
                      labelText: 'Enter Student Smart Card Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 65,
                    child: isSubmitting?
                    LinearProgressIndicator(
                      backgroundColor: Colors.white,
                      color: Colors.black,
                    ) :
                    ElevatedButton(
                      onPressed: () {
                        // Add functionality for deposit button
                        FocusScope.of(context).unfocus();
                        setState(() {
                          isSubmitting = true;
                        });

                        Future.delayed(Duration(seconds: 3), () {
                          setState(() {
                            querySuccess = true;
                            isSubmitting = false;
                            // _controller.reverse();
                          });
                        });
                      },
                      child: Text(
                        'Proceed',
                        style: TextStyle(color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.black),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )

    );
  }
}

class InfoCard extends StatelessWidget {
  final String smartcardNumber;
  final String name;
  final String school;
  final String product;

  const InfoCard({
    Key? key,
    required this.smartcardNumber,
    required this.name,
    required this.school,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2),
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.zero,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Smartcard Number:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            smartcardNumber,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: 12),
          Text(
            'Name:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            name,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: 12),
          Text(
            'School:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            school,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: 12),
          Text(
            'Product:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            product,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }
}

class _AmountTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    final double amount = double.parse(newValue.text.replaceAll(',', ''));

    final formatter = NumberFormat("#,##0", "en_US");
    final newText = formatter.format(amount);

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}

