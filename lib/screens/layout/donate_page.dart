import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DonatePage extends StatefulWidget {
  final String userToken;

  const DonatePage({Key? key, required this.userToken}) : super(key: key);

  @override
  _DonatePageState createState() => _DonatePageState();
}

class _DonatePageState extends State<DonatePage> {
  TextEditingController itemsNameController = TextEditingController();
  String selectedCharity = '';
  int selectedQuantity = 1;
  String selectedState = '';
  TextEditingController mobileController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  List<File?> images = [];
  List<String> availableCharities = [];

  Future<List<String>> fetchCharitiesFromApi() async {
    final apiUrl =
        'https://nervous-plum-walkingstick.cyclic.app/getorganizaion';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final List<String> charities = List<String>.from(
            jsonData['data'].map((charity) => charity['title'].toString()));

        return charities;
      } else {
        print('Failed to load data: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        images.add(File(pickedFile.path));
      });
    }

    fetchCharitiesFromApi().then((charities) {
      setState(() {
        availableCharities = charities;
      });
    });
  }

  Future<void> _submitForm() async {
    final userToken = widget.userToken;

    if (userToken.isNotEmpty) {
      final apiUrl = 'https://nervous-plum-walkingstick.cyclic.app/donateorder';

      final itemsName = itemsNameController.text;

      if (itemsName.isNotEmpty) {
        final requestBody = {
          'itemsName': itemsName,
          'charity': selectedCharity,
          'quantity': selectedQuantity,
          'phone': mobileController.text,
          'state': selectedState,
          'address': addressController.text,
          'city': cityController.text,
        };

        try {
          print('Request Body: $requestBody');
          final response = await http.post(
            Uri.parse(apiUrl),
            headers: {
              'Authorization': 'Bearer $userToken',
              'Content-Type': 'application/json',
            },
            body: json.encode(requestBody),
          );
          print('API Response: ${response.body}');
          if (response.statusCode == 200) {
            print('Donation successful');
          } else {
            print('Failed to submit donation: ${response.statusCode}');
          }
        } catch (e) {
          print('Error: $e');
        }
      } else {
        print('Items Name cannot be empty');
      }
    } else {
      print('User is not logged in');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchCharitiesFromApi().then((charities) {
      setState(() {
        availableCharities = charities;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Donate',
          style: TextStyle(
            color: Colors.deepPurple,
          ),
        ),
        backgroundColor: Color.fromARGB(0, 72, 2, 85),
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.deepPurple,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 60.0,
                width: 340.0,
                child: TextFormField(
                  controller:
                      itemsNameController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.deepPurple.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    labelText: 'Items Name',
                    labelStyle: TextStyle(color: Colors.deepPurple),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Container(
                height: 60.0,
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: DropdownButtonFormField<String>(
                  value: selectedCharity.isNotEmpty ? selectedCharity : null,
                  items: availableCharities.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.deepPurple.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    border: InputBorder.none,
                    labelText: 'Charity',
                    labelStyle: TextStyle(color: Colors.deepPurple),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      selectedCharity = value ?? '';
                    });
                  },
                  isExpanded: true,
                ),
              ),
              SizedBox(height: 16),
              Container(
                height: 60.0,
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: DropdownButtonFormField<int>(
                  value: selectedQuantity,
                  items:
                      List.generate(10, (index) => index + 1).map((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text(
                        '$value Piece${value > 1 ? 's' : ''}',
                        style: const TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.deepPurple.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    border: InputBorder.none,
                    labelText: 'Item Quantity',
                    labelStyle: TextStyle(color: Colors.deepPurple),
                  ),
                  onChanged: (int? value) {
                    setState(() {
                      selectedQuantity = value ?? 1;
                    });
                  },
                  isExpanded: true,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                height: 60.0,
                width: 340.0,
                child: TextFormField(
                  controller: mobileController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.deepPurple.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    labelText: 'Mobile',
                    labelStyle: TextStyle(color: Colors.deepPurple),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: DropdownButtonFormField<String>(
                  value: selectedState.isNotEmpty ? selectedState : null,
                  items: [
                    'Cairo',
                    'Giza',
                    'Alexandria',
                    'Luxor',
                    'ElMenoufia',
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.deepPurple.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    border: InputBorder.none,
                    labelText: 'State',
                    labelStyle: TextStyle(color: Colors.deepPurple),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      selectedState = value ?? '';
                    });
                  },
                  isExpanded: true,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                height: 60.0,
                width: 340.0,
                child: TextFormField(
                  controller: addressController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.deepPurple.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    labelText: 'Address (House No. Building, Street, Area)',
                    labelStyle: TextStyle(color: Colors.deepPurple),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                height: 60.0,
                width: 340.0,
                child: TextFormField(
                  controller: cityController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.deepPurple.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    labelText: 'City/District',
                    labelStyle: TextStyle(color: Colors.deepPurple),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Choose Photo Source'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  _getImage(ImageSource.camera);
                                },
                                child: Text('Camera'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  _getImage(ImageSource.gallery);
                                },
                                child: Text('Gallery'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurple,
                      padding: EdgeInsets.all(5),
                    ),
                    child: Text('Choose Photo'),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: images.map((image) {
                        return Stack(
                          children: [
                            if (image != null) ...[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12.0),
                                child: Image.file(
                                  image,
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      images.remove(image);
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red,
                                    ),
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ] else ...[
                              Container(
                                width: 80,
                                height: 80,
                                color: Colors.grey.withOpacity(0.3),
                              ),
                            ],
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 0, top: 100),
                child: ElevatedButton(
                  onPressed: () {
                    _submitForm();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple,
                    padding: EdgeInsets.all(5),
                  ),
                  child: Text('Donate Clothes'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
