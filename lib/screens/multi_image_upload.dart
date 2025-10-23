import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MultiImageUpload extends StatefulWidget {
  const MultiImageUpload({super.key});

  @override
  State<MultiImageUpload> createState() => _MultiImageUploadState();
}

class _MultiImageUploadState extends State<MultiImageUpload> {
  List<XFile> selectedImage = [];

  Future<void> _uploadImages() async {
    final List<XFile> pickedImages = await ImagePicker().pickMultiImage(
      limit: 3,
    );

    selectedImage = pickedImages;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(selectedImage.length, (index) {
                  return Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.file(File(selectedImage[index].path)),
                  );
                }),
              ),
            ),

            SizedBox(height: 50),
            GestureDetector(
              onTap: () {
                _uploadImages();
              },
              child: Container(
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Upload Images",
                    style: TextStyle(color: Colors.white),
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
