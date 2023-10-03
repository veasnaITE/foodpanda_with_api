
import 'package:flutter/material.dart';

class SliderThreeCard extends StatelessWidget {
  const SliderThreeCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            child: Row(
              children: [
                Expanded(
                  child:  Container(
                    height: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: RichText(text: const TextSpan(
                              children: [
                                TextSpan(text: "Groceries\n",style:
                                TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black87
                                )),
                                TextSpan(text: "Supermarkets, Marts, Shops, & More",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black54
                                    )),
                              ]
                          )),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(left: 70,bottom: 5),
                          child: Image.asset('assets/images/drink.png'),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 6,),
                Expanded(
                    child: SizedBox(
                      height: 250,
                      child: Column(
                        children: [
                          Expanded(
                              flex:4,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 10,left: 10),
                                        child: RichText(text: const TextSpan(
                                            children: [
                                              TextSpan(text: "Pick-up\n",style:
                                              TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                  color: Colors.black87
                                              )),
                                              TextSpan(text: "Up to 50% off",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black54
                                                  )),
                                            ]
                                        )),
                                      ),
                                    ),
                                    Container(

                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 110,bottom: 5),
                                        child: Image.asset('assets/images/pickup.png'),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          const SizedBox(height: 5,),
                          Expanded(
                              flex:2,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                       SizedBox(width: 5,),
                                       SizedBox(
                                         width: 110,
                                         child: RichText(text: const TextSpan(
                                              children: [
                                                TextSpan(text: "Pandasen\n",style:
                                                TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                    color: Colors.black87
                                                )),
                                                TextSpan(text: "send parcels in a tap",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black54
                                                    )),
                                              ]
                                          )),
                                       ),
                                    Container(
                                      width: 70,
                                        height: 80,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage("assets/images/sender.jpg"),
                                            fit: BoxFit.contain),
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                        ],
                      ),
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}