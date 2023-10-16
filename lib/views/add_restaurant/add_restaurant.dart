import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodpanda_clone/data/response/status.dart';
import 'package:foodpanda_clone/viewmodels/image_viewmodel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddRestaurant extends StatefulWidget {
  const AddRestaurant({super.key});

  @override
  State<AddRestaurant> createState() => _AddRestaurantState();
}

class _AddRestaurantState extends State<AddRestaurant> {
  @override
  File? images;
  var imageViewModel = ImageViewModel();
  _getImageFromSource(type) async {
    var pickedFile = await ImagePicker().pickImage(
        source: type == 'camera' ? ImageSource.camera : ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        images = File(pickedFile.path);
      });
      imageViewModel.uploadImage(pickedFile.path);
    }

  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () => _getImageFromSource('gallery'),
                  child: const Text('Select Image'),
                ),
                ChangeNotifierProvider(
                  create: (context) => imageViewModel,
                  child: Consumer<ImageViewModel>(
                    builder: (context, viewModel, _) {
                      if (viewModel.response.status == Status.LOADING) {
                        return Center(child: CircularProgressIndicator());
                      } else if (viewModel.response.status ==  Status.COMPlETED) {
                        print("image id ${viewModel.response.data}");
                        return Container(
                          width: 250,
                          height: 250,
                          color: Colors.blue,
                          child: images == null
                              ? Image.asset('assets/images/cofee1.webp')
                              : Image.file(images!),
                        );
                      }else{
                        return Text("Success");
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Name",
                    label: Text('Name'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Category",
                    label: Text('Category'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Discount",
                    label: Text('Discount'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Delivery Time",
                    label: Text('Delivery Time'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Delivery Fee",
                    label: Text('Delivery Fee'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
