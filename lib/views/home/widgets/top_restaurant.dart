
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:foodpanda_clone/get_model.dart';
import 'package:foodpanda_clone/views/home/widgets/insert.dart';
import 'package:foodpanda_clone/views/home/widgets/update.dart';
import'package:http/http.dart' as http;
class TopRestaurant extends StatefulWidget {
  const TopRestaurant({
    super.key,
  });

  @override
  State<TopRestaurant> createState() => _TopRestaurantState();
}

class _TopRestaurantState extends State<TopRestaurant> {
  late Future<RestaurantModel> futureRestaurant;
  Future<RestaurantModel> fetchRestaurantData() async {
    final response = await http.get(Uri.parse(
        'https://cms.istad.co/api/food-panda-restaurants?populate=*'));
    if (response.statusCode == 200) {
      return restaurantModelFromJson(response.body);
    } else {
      // Handle the error case
      throw Exception('Failed to fetch restaurant data');
    }
  }

  Future<dynamic> deleteRestaurant(int id) async {
    final response = await http.delete(
      Uri.parse('https://cms.istad.co/api/food-panda-restaurants/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
  @override
  void initState() {
    super.initState();
    futureRestaurant = fetchRestaurantData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<RestaurantModel>(
      future: futureRestaurant,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }
        if (snapshot.hasData) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: snapshot.data!.data!.length,
            itemBuilder: (BuildContext context, int index) {
              final item = snapshot.data!.data![index].attributes;
              final idpass =snapshot.data!.data![index].id?.toInt();
              return Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black12,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        child: Image.network(
                          'https://cms.istad.co${item?.picture?.data?.attributes?.url}',
                          width: 100,
                          height: 100,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${item?.name}"),
                          Text("${item?.category}"),
                          Text("${item?.createdAt}"),
                        ],
                      ),
                      Expanded(
                        child: IconButton(
                            onPressed:() {Navigator.push(context,
                                MaterialPageRoute(builder: (context) => RestaurantForm()));},
                            icon: const Icon(Icons.add)),
                      ),
                      Expanded(
                        child: IconButton(
                            onPressed:() async {
                              if (await confirm(context)) {
                                return deleteRestaurant(idpass!);
                              }
                            },
                            icon: const Icon(Icons.close)),
                      ),
                      Expanded(
                        child: IconButton(
                            onPressed:() {Navigator.push(context,
                                MaterialPageRoute(builder: (context) => UpdateRestaurantForm(idpass!)));},
                            icon: const Icon(Icons.edit)),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
        return const Center(
          child: Text('No data available.'),
        );
      },
    );
    // return SizedBox(
    //   width: MediaQuery.of(context).size.width*.7,
    //   child: Padding(
    //     padding: const EdgeInsets.all(10.0),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         SizedBox(
    //             child: Stack(
    //               children: [
    //                 SizedBox(
    //                   height: 200,
    //                   child: ClipRRect(
    //                     borderRadius: BorderRadius.circular(20),
    //                     child: Image.network('https://images.deliveryhero.io/image/fd-kh/LH/t2um-hero.jpg'),
    //                   ),
    //                 ),
    //                 Positioned(
    //                   top: 10,
    //                   child: Container(
    //                     decoration: const BoxDecoration(
    //                       borderRadius: BorderRadius.only(
    //                           topRight:Radius.circular(50),
    //                           bottomRight: Radius.circular(50)),
    //                       color: Colors.black87,
    //                     ),
    //                     child: const Padding(
    //                         padding: EdgeInsets.all(5),
    //                         child: Text("Top restaurant",
    //                           style: TextStyle(
    //                               fontWeight: FontWeight.bold,
    //                               color: Colors.white
    //                           ),)),
    //                   ),
    //                 ),
    //                 Positioned(
    //                   bottom: 10,
    //                   left: 10,
    //                   child: Container(
    //                     decoration: BoxDecoration(
    //                       borderRadius: BorderRadius.circular(50),
    //                       color: Colors.white,
    //                     ),
    //                     child: const Padding(
    //                         padding: EdgeInsets.all(5),
    //                         child: Text("15 min",
    //                           style: TextStyle(
    //                               fontWeight: FontWeight.bold,
    //                               color: Colors.black87
    //                           ),)),
    //                   ),
    //                 ),
    //               ],
    //             )
    //         ),
    //         const Text("Staburks Fun Mall TK",
    //           style: TextStyle(
    //             fontWeight: FontWeight.bold,
    //           ),),
    //         const Text("\$\$\$ Tea & Coffee, American, Bervera,",
    //           maxLines: 1,),
    //         const Text("\$ 0.27 delivery fee",
    //           style: TextStyle(
    //             fontWeight: FontWeight.bold,
    //           ),),
    //       ],
    //     ),
    //   ),
    // );
  }
}