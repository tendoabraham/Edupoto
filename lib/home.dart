import 'package:edupoto/tereka_asome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String nameOfUser = "John Baptist";

  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image(
          image: AssetImage("assets/images/edupoto.png"),
          width: 160,
          // height: 40,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(" Welcome, $nameOfUser"),
                CircleAvatar(
                  // Replace with user's photo
                  backgroundImage: AssetImage('assets/user_photo.jpg'),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
            child: Card(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero
                ),
              child: Padding(
                padding: EdgeInsets.only(left: 16, top: 16, right: 0, bottom: 8),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Account Overview"),
                    _isSelected ?
                    const Text("UGX 222,358",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      ),) :
                    const Text("UGX XXXX XXXX",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      ),),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                    ),
                    Row(
                      children: [
                        const Text("+256 7** *** *16"),
                        Spacer(),
                        Transform.scale(
                          scale: 0.6,
                          child: Switch(
                            value: _isSelected,
                            onChanged: (value) {
                              setState(() {
                                _isSelected = value;
                              });
                            },
                            activeColor: Colors.black,
                            activeTrackColor: Colors.black45,
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                        )
                      ],
                    )
                  ], // Replace with actual balance
                ),
              )
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: Card(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero
                      ),
                    child: Padding(padding: EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 8,
                        ),
                        Image(
                          image: AssetImage("assets/images/uparrow2.png"),
                          width: 40,
                          height: 40,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Income"),
                            Text("UGX 500,000"),
                          ],// Replace with actual income
                        )
                      ],
                    ),)
                  ),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: Card(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero
                      ),
                      child: Padding(padding: EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 8,
                            ),
                            Image(
                              image: AssetImage("assets/images/downarrow.png"),
                              width: 40,
                              height: 40,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Expenditure"),
                                Text("UGX 2,000,000"),
                              ],// Replace with actual income
                            )
                          ],
                        ),)
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(child: Container(
            color: Colors.black,
            child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(" Financial Services",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CustomCard(
                            title: "Deposit on Tereka Asome",
                            icon: Icons.account_balance_wallet,
                            summery: "6",
                            // Add functionality for deposit
                          ),
                        ),
                        SizedBox(width: 8.0),
                        Expanded(
                          child: CustomCard(
                            title: "Fund Pocket Money Card",
                            icon: Icons.credit_card,
                            summery: "0",
                            // Add functionality for fund
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CustomCard(
                            title: "Savings Progress\n",
                            icon: Icons.savings,
                            summery: "37%",
                            // Add functionality for savings
                          ),
                        ),
                        SizedBox(width: 8.0),
                        Expanded(
                          child: CustomCard(
                            title: "Transaction History\n",
                            icon: Icons.history,
                            summery: "26",
                            // Add functionality for transaction history
                          ),
                        ),
                      ],
                    ),
                  ],
                )
            ),
          ),)
        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String summery;

  const CustomCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.summery
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TerekaAsome()), // Navigate to DepositPage
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.zero,
                    ),
                    child: Icon(
                      icon,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                  Spacer(),
                  Text(summery)
                ],
              ),
              SizedBox(height: 8.0),
              Text(
                title,
                style: TextStyle(fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}