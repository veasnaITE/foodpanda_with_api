import 'dart:io';
import 'package:flutter/material.dart';
import 'package:foodpanda_clone/data/response/status.dart';
import 'package:foodpanda_clone/viewmodels/image_viewmodel.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class RestaurantForm extends StatefulWidget {
  RestaurantForm({super.key});
  @override
  _RestaurantFormState createState() => _RestaurantFormState();
}

class _RestaurantFormState extends State<RestaurantForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController discountController = TextEditingController();
  TextEditingController deliveryFeeController = TextEditingController();
  TextEditingController deliveryTimeController = TextEditingController();
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

  Future<void> inSertData(jsonData) async {
    var headers = {'Content-Type': 'application/json'};
    var requests = http.Request(
        'POST', Uri.parse('https://cms.istad.co/api/food-panda-restaurants'));
    requests.body = jsonData;
    requests.headers.addAll(headers);
    http.StreamedResponse responses = await requests.send();
    if (responses.statusCode == 200) {
      print(await responses.stream.bytesToString());
    } else {
      print(responses.reasonPhrase);
    }
  }

  void submitForm() async {
    if (_formKey.currentState!.validate()) {
      // Retrieve the form field values from the controllers
      String name = nameController.text;
      String category = categoryController.text;
      int discount = int.parse(discountController.text);
      double deliveryFee = double.parse(deliveryFeeController.text);
      int deliveryTime = int.parse(deliveryTimeController.text);

      // You can perform further actions with the form data and the selected image here

      //positing restaurant
      // RestaurantInsertModel restaurantData = RestaurantInsertModel(
      //   data: Data(
      //     name: name,
      //     category: category,
      //     discount: discount,
      //     deliveryFee: deliveryFee,
      //     deliveryTime: deliveryTime,
      //     picture: "$imageId",
      //   ),
      // );
      // String jsonData = restaurantInsertModelToJson(restaurantData);
      //  print(jsonData);
      //  //call insertData
      //  inSertData(jsonData);
      // Reset the form
      _formKey.currentState!.reset();
      // Clear the text field controllers
      nameController.clear();
      categoryController.clear();
      discountController.clear();
      deliveryFeeController.clear();
      deliveryTimeController.clear();
      // Clear the image selection
    }
    Navigator.popUntil(context, ModalRoute.withName('/'));
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
        child: Form(
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

                    switch(viewModel.response.status){
                      case Status.LOADING:
                        return Center( child: CircularProgressIndicator(),);
                      case Status.COMPlETED:
                        print("image id ${viewModel.response.data}");
                        return Container(
                          width: 250,
                          height: 250,
                          color: Colors.blue,
                          child: images == null
                              ? Image.asset('assets/images/cofee1.webp')
                              : Image.file(images!),
                        );
                      default:return Text("error");
                    }

                  },
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: submitForm,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
