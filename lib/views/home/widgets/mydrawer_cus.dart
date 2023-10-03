import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawerCus extends StatelessWidget {
  const MyDrawerCus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: MediaQuery.of(context).size.width * .85,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.pink[700],
                ),
                currentAccountPicture: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network('https://i.pinimg.com/originals/5f/b2/1a/5fb21aefc0aa94d8a84531611d8fe708.png')),
                currentAccountPictureSize:const Size.square(50),
                accountName: const Text("Veasna",style: TextStyle(
                  fontWeight: FontWeight.bold
                ),),
                accountEmail:null),
            const ListTile(
              title: Text("Become a pandapro"),
              leading: Icon(Icons.pages_rounded,color: Colors.pinkAccent,),
            ),
            const ListTile(
              title: Text("Voucher & Offers"),
              leading: Icon(Icons.confirmation_num_outlined,color: Colors.pinkAccent),
            ),
            const ListTile(
              title: Text("Orders & reordering"),
              leading: Icon(Icons.library_books_sharp,color: Colors.pinkAccent),
            ),
            const ListTile(
              title: Text("Profile"),
              leading: Icon(Icons.perm_identity_rounded,color: Colors.pinkAccent),
            ),
            const ListTile(
              title: Text("Address"),
              leading: Icon(Icons.location_on_outlined,color: Colors.pinkAccent),
            ),
            const ListTile(
              title: Text("Payment methods"),
              leading: Icon(Icons.payment_rounded,color: Colors.pinkAccent),
            ),
            const ListTile(
              title: Text("panda rewards"),
              leading: Icon(Icons.wallet_giftcard,color: Colors.pinkAccent),
            ),
            const ListTile(
              title: Text("Help center"),
              leading: Icon(Icons.help,color: Colors.pinkAccent),
            ),
            const ListTile(
              title: Text("Invite friends"),
              leading: Icon(Icons.card_giftcard_rounded,color: Colors.pinkAccent),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 22),
              child: RichText(text: const TextSpan(
                  style: TextStyle(color: Colors.black,
                    fontSize: 17,
                    height: 2,
                  ),
                  children: [
                    TextSpan(text: "Settings\n"),
                    TextSpan(text: "Terms & Conditions / Privacy\n"),
                    TextSpan(text: "Log out\n")
                  ]
              )),
            )
          ],
        )
    );
  }
}