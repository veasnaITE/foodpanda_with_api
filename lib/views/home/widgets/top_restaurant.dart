import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:foodpanda_clone/views/DetailRestaurant/detailRetaurant.dart';
import 'package:foodpanda_clone/views/home/widgets/insert.dart';
import 'package:foodpanda_clone/views/home/widgets/update.dart';
import 'package:http/http.dart' as http;
class TopRestaurant extends StatefulWidget {
  final idpass;
  final item;
  final refreshCallback;
  const TopRestaurant({
    required this.item,
    required this.idpass,
    required this.refreshCallback,
    super.key,
  });
  @override
  State<TopRestaurant> createState() => _TopRestaurantState();
}

class _TopRestaurantState extends State<TopRestaurant> {
  Future<void> deleteRestaurant(int id) async {
    final response = await http.delete(
      Uri.parse('https://cms.istad.co/api/food-panda-restaurants/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      // Delete operation successful, trigger data refresh
      setState(() {
        widget.refreshCallback;
      });
    } else {
      // Handle the error case
    }
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Restaurant()),
          );
        },
      onLongPress: (){
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children:[
                  ListTile(
                    leading:  const Icon(Icons.add_circle_outline_outlined,size: 30),
                    title:  const Text('Insert',style: TextStyle(fontSize: 20),),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  RestaurantForm(refreshCallback: widget.refreshCallback,)));
                    },
                  ),
                  ListTile(
                    leading:  const Icon(Icons.remove_circle_outline_outlined,size: 30),
                    title: const Text('Delete',style: TextStyle(fontSize: 20)),
                    onTap: ()async {
                      if (await confirm(context)) {
                         return deleteRestaurant(widget.idpass!);
                      }
                    },
                  ),
                  ListTile(
                    leading:  const Icon(Icons.draw_outlined,size: 30,),
                    title:  const Text('Update',style: TextStyle(fontSize: 20)),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  UpdateRestaurantForm(item: widget.item,idpass: widget.idpass,)));
                    },
                  ),
                ],
              );
            });
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 200,
        alignment: Alignment.centerLeft,
        child: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black12,
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * .9,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      child: Stack(
                        children: [
                          SizedBox(
                            width: double.maxFinite,
                            height: 200,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                'https://cms.istad.co${widget.item?.picture?.data?.attributes?.url}',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 10,
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(50),
                                    bottomRight: Radius.circular(50)),
                                color: Colors.black87,
                              ),
                              child: const Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Text(
                                    "Top restaurant",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 10,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white,
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    "${widget.item?.deliveryTime} mn",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87),
                                  )),
                            ),
                          ),
                        ],
                      )),
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      "${widget.item?.name}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17
                      ),
                    ),
                  ),
                  const SizedBox(height:3,),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      "\$\$\$ ${widget.item?.category}",
                      style: const TextStyle(
                        fontSize: 16
                      ),
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(height:3,),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      "\$ ${widget.item?.deliveryFee.toString()} delivery fee",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
