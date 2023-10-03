import 'package:flutter/material.dart';
import 'package:foodpanda_clone/views/checkout/checkout.dart';
import 'package:lottie/lottie.dart';

class Lotti extends StatefulWidget {
  const Lotti({super.key});

  @override
  _LottiState createState() => _LottiState();
}

class _LottiState extends State<Lotti> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed:() {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CheckOut()));
          },
          icon: const Icon(
            Icons.close,
            size: 30,
            color: Colors.black, // Change the icon color to black
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 50),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  "Order Successfully",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink.shade600,
                  ),
                ),
              ),
              LottieBuilder.asset("assets/images/food.json"),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 1),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      border: BorderDirectional(
                        bottom: BorderSide(
                          color: Colors.black12,
                          width: 2,
                        ),
                        end: BorderSide(
                          color: Colors.black12,
                          width: 2,
                        ),
                        start: BorderSide(
                          color: Colors.black12,
                          width: 2,
                        ),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Order Details",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "Your order number: ",
                                style: TextStyle(fontSize: 18),
                              ),
                              const Spacer(),
                              Text(
                                '#sna-d65d',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.blue.shade600,
                                  backgroundColor: Colors.grey.shade100,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              )
                            ],
                          ),
                        ),
                        const Divider(),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Your order from:",
                                style: TextStyle(fontSize: 18),
                              ),
                              Spacer(),
                              Text(
                                'KFC Kampuchea Krom',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Delivery Address: ",
                                style: TextStyle(fontSize: 18),
                              ),
                              Spacer(),
                              Text(
                                '2 St 762, Toul kuk,\n\t\t\t\t\t\t\t\t Phnom Penh ',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 1),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      border: BorderDirectional(
                        bottom: BorderSide(
                          color: Colors.black12,
                          width: 2,
                        ),
                        end: BorderSide(
                          color: Colors.black12,
                          width: 2,
                        ),
                        start: BorderSide(
                          color: Colors.black12,
                          width: 2,
                        ),
                      )),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "1x.\t\t\t Fish chicken",
                                style: TextStyle(fontSize: 16),
                              ),
                              Spacer(),
                              Text(
                                '\$10.5',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(
                                width: 10,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "2x. \t\t\t french fried",
                                style: TextStyle(fontSize: 16),
                              ),
                              Spacer(),
                              Text(
                                '\$13.00',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 1),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      border: BorderDirectional(
                        bottom: BorderSide(
                          color: Colors.black12,
                          width: 2,
                        ),
                        end: BorderSide(
                          color: Colors.black12,
                          width: 2,
                        ),
                        start: BorderSide(
                          color: Colors.black12,
                          width: 2,
                        ),
                      )),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Subtotal",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              Spacer(),
                              Text(
                                '\$25.99',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Delivery fee",
                                style: TextStyle(fontSize: 16),
                              ),
                              Spacer(),
                              Text(
                                '\$0.99',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(
                                width: 10,
                              )
                            ],
                          ),
                        ),
                        Divider(),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Incl. Tax",
                                style: TextStyle(fontSize: 16),
                              ),
                              Spacer(),
                              Text(
                                '\$1.50',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(
                                width: 10,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Voucher: vksm711",
                                style: TextStyle(fontSize: 16),
                              ),
                              Spacer(),
                              Text(
                                '\$-4.00',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 1),
                child: Container(
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.white70,
                  ),
                  child:   Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Total (incl. VAT)",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              Spacer(),
                              Text(
                                '\$8.99',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
