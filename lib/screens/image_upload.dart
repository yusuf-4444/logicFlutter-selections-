import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageUpload extends StatefulWidget {
  const ImageUpload({super.key});

  @override
  State<ImageUpload> createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  XFile? selectedImage;
  Future<void> _uploadImage() async {
    final imagePicker = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    selectedImage = imagePicker;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 43, 104, 45),

      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.7),
                borderRadius: BorderRadius.circular(10),
              ),
              child: selectedImage != null
                  ? Image.file(File(selectedImage!.path))
                  : SizedBox.shrink(),
            ),

            SizedBox(height: 50),

            Container(
              width: 150,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      _uploadImage();
                    },
                    child: Text(
                      selectedImage == null ? "Upload Image" : "Change Image",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),
            selectedImage == null
                ? SizedBox.shrink()
                : Container(
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            selectedImage = null;
                            setState(() {});
                          },
                          child: Text(
                            "Remove Image",
                            style: TextStyle(color: Colors.red),
                          ),
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
