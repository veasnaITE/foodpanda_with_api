import 'dart:io';
import 'package:flutter/material.dart';
import 'package:foodpanda_clone/data/response/status.dart';
import 'package:foodpanda_clone/models/resquest/restaurant_request.dart';
import 'package:foodpanda_clone/viewmodels/image_viewmodel.dart';
import 'package:foodpanda_clone/viewmodels/restaurant_viewmodel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class RestaurantUpdateForm extends StatefulWidget {
  final data;
  RestaurantUpdateForm({required this.data,super.key});
  @override
  _RestaurantUpdateFormState createState() => _RestaurantUpdateFormState();
}

class _RestaurantUpdateFormState extends State<RestaurantUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var categoryController = TextEditingController();
  var discountController = TextEditingController();
  var deliveryFeeController = TextEditingController();
  var deliveryTimeController = TextEditingController();
  File? images;
  var imageViewModel = ImageViewModel();
  var restaurantViewModel = RestaurantViewModel();
  var imageId;
  @override
  void initState() {
    super.initState();
     nameController.text = widget.data.attributes.name;
     categoryController.text =  widget.data.attributes.category;
     discountController.text = widget.data.attributes.discount.toString();
     deliveryFeeController.text =widget.data.attributes.deliveryFee.toString();
     deliveryTimeController.text = widget.data.attributes.deliveryTime.toString();
    imageId=widget.data.attributes.picture.data.id;
  }

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

  void submitForm() async {
    if (_formKey.currentState!.validate()) {
      var requestBody = Data(
          name: nameController.text,
          category: categoryController.text,
          discount: int.parse(discountController.text),
          deliveryFee: double.parse(deliveryFeeController.text),
          deliveryTime: int.parse(deliveryTimeController.text),
          picture: imageId.toString()
      );
      restaurantViewModel.putRestaurant(requestBody, widget.data.id);
      _formKey.currentState!.reset();
      // Clear the text field controllers
      nameController.clear();
      categoryController.clear();
      discountController.clear();
      deliveryFeeController.clear();
      deliveryTimeController.clear();
      // Clear the image selection
    }
  }
  @override
  void dispose() {
    // Dispose the text field controllers when the widget is disposed
    nameController.dispose();
    categoryController.dispose();
    discountController.dispose();
    deliveryFeeController.dispose();
    deliveryTimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant Form'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Name',
                    ),
                    controller: nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a name';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Category',
                    ),
                    controller: categoryController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a category';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Discount',
                    ),
                    controller: discountController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a discount';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Delivery Fee',
                    ),
                    controller: deliveryFeeController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a delivery fee';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Delivery Time',
                    ),
                    controller: deliveryTimeController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a delivery time';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () => _getImageFromSource('gallery'),
                    child: const Text('Select Image'),
                  ),
                  ChangeNotifierProvider(
                    create: (context)=>imageViewModel,
                    child: Consumer<ImageViewModel>(
                      builder: (context,viewModel,_){
                        switch(viewModel.image.status){
                          case Status.LOADING:
                            return Center( child: CircularProgressIndicator(),);
                          case Status.COMPlETED:
                           // print("image id ${viewModel.image.data.id}");
                            imageId=viewModel.image.data.id;
                            return Container(
                              width: 250,
                              height: 250,
                              child: images == null
                                  ? Image.asset('assets/images/cofee1.webp')
                                  : Image.network('https://cms.istad.co${widget.data.attributes.picture.data.attributes.url}'
                              ),
                            );
                          default:return Container();
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: submitForm,
                    child:  ChangeNotifierProvider(
                      create: (context)=>restaurantViewModel,
                      child: Consumer<RestaurantViewModel>
                        (builder: (context,viewModel,_){
                        if(viewModel.response.status == Status.COMPlETED){
                          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content:Text("Operation Success"))
                            );
                          });
                        }
                        return Text('Submit');
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
