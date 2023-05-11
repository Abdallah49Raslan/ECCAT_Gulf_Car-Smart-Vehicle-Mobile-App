import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DriversPage extends StatefulWidget {
  @override
  _DriversPageState createState() => _DriversPageState();
}

class _DriversPageState extends State<DriversPage> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;
  final picker = ImagePicker();

  File? _image;
  String? _uploadedImageUrl;

  Future<void> _selectAndUploadImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });

      final Reference storageRef =
          storage.ref().child('driver_images').child(DateTime.now().toString());

      final UploadTask uploadTask = storageRef.putFile(_image!);

      final TaskSnapshot storageSnapshot = await uploadTask.whenComplete(() {});

      final String downloadUrl = await storageSnapshot.ref.getDownloadURL();

      setState(() {
        _uploadedImageUrl = downloadUrl;
      });
    }
  }

  Future<void> _addDriver() async {
    if (_uploadedImageUrl != null) {
      CollectionReference driversCollection = firestore.collection('drivers');
      if ((await driversCollection.get()).docs.isEmpty) {
        // Create the "drivers" collection if it doesn't exist
        await driversCollection.doc();
      }

      await driversCollection.add({
        'driverName': 'Eslam',
        'age': 20,
        'profilePicture': _uploadedImageUrl,
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drivers'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: _selectAndUploadImage,
            child: Text('Select Image'),
          ),
          if (_image != null) Image.file(_image!),
          ElevatedButton(
            onPressed: _addDriver,
            child: Text('Add Driver'),
          ),
        ],
      ),
    );
  }
}
