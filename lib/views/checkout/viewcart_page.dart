import 'package:flutter/material.dart';
import 'package:foodpanda_clone/views/checkout/checkout.dart';
import 'package:foodpanda_clone/views/checkout/widgets/orderCart.dart';
class ViewCartPage extends StatefulWidget {
  const ViewCartPage({super.key});

  @override
  State<ViewCartPage> createState() => _ViewCartPageState();
}

class _ViewCartPageState extends State<ViewCartPage> {
  late bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        leading: const Icon(
          Icons.close,
          color: Colors.pinkAccent,
          size: 30,
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Cart",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Text(
              "Marugame BENTO",
              style: TextStyle(fontSize: 15),
            )
          ],
        ),
        actions: const [
          Icon(
            Icons.shopping_bag_outlined,
            color: Colors.pinkAccent,
          ),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 100,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Image.asset('assets/images/rider.jpg')),
                      const Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Deliver time",
                              ),
                              Text(
                                "ASAP (20min)",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text(
                                "Change",
                                style: TextStyle(color: Colors.pinkAccent),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(flex: 1, child: Icon(Icons.add)),
                      Expanded(
                        flex: 5,
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: const Image(
                                width: 70,
                                height: 70,
                                fit: BoxFit.fitHeight,
                                image: AssetImage('assets/images/cofee4.png'),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "Bang Dub",
                              style: TextStyle(color: Colors.pinkAccent),
                            )
                          ],
                        ),
                      ),
                      const Expanded(flex: 1, child: Text("\$ 1.00")),
                    ],
                  ),
                ),
              ),
              Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(color: Colors.grey.shade200, width: 1)),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: TextButton(
                      child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Add more items',
                            style: TextStyle(color: Colors.pinkAccent),
                          )),
                      onPressed: () {},
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Popular Restaurants",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "Other customers also bought these",
                        style: TextStyle(fontSize: 15, color: Colors.black45),
                      ),
                      const SizedBox(height: 20,),
                      SizedBox(
                        height: 240,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return const Padding(
                              padding: EdgeInsets.only(right: 15, top: 10),
                              child: OrderCart(),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 70,
                  child: Row(
                    children: [
                      const Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Want free delivery with pro?",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(
                                "Subscribe from \$2.10/month! Mi...",
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Add...cart",
                                style: TextStyle(
                                    color: Colors.pinkAccent,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ))),
                    ],
                  ),
                ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 170,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Subtotal",
                            style: TextStyle(fontSize: 17),
                          ),
                          Text("\$ 1.00", style: TextStyle(fontSize: 17))
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Delivery fee",
                                style: TextStyle(fontSize: 17),
                              ),
                              Text("Welcome gift: free delivery",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black54))
                            ],
                          ),
                          Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  color: Colors.pink[50]),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 7.0, vertical: 2),
                                child: Text(
                                  "Free",
                                  style: TextStyle(
                                      color: Colors.pinkAccent,
                                      fontWeight: FontWeight.bold),
                                ),
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        children: [
                          Icon(
                            Icons.bookmark_border,
                            color: Colors.pinkAccent,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Apply a voucher",
                            style: TextStyle(
                                color: Colors.pinkAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                color: Colors.white,
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                            children: [
                              Icon(
                                Icons.book_online_outlined,
                                color: Colors.pinkAccent,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Cutlery",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Switch(
                            activeColor: Colors.pinkAccent,
                            value: isChecked,
                            onChanged: (bool value) {
                              setState(() {
                                isChecked = value;
                              });
                            },
                          ),
                        ],
                      ),
                      const Text(
                          "The restaurant will provide cutlery, if available.")
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 120,
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 36),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Total ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: '(incl. VAT)', style: TextStyle(fontSize: 25))
                      ],
                    ),
                    textScaleFactor: 0.5,
                  ),
                  const Text(
                    '\$ 1.00',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CheckOut()));
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.pinkAccent,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "1",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 18),
                        ),
                        Text(
                          "View your cart",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        Text(
                          "\$ 2.25",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
