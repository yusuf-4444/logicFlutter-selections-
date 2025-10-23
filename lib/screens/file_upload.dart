import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class FileUpload extends StatefulWidget {
  const FileUpload({super.key});

  @override
  State<FileUpload> createState() => _FileUploadState();
}

class _FileUploadState extends State<FileUpload> {
  String? fileName;
  String? filePath;
  Future<void> _uploadFile() async {
    final file = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ["pdf", "docx", "doc", "jpg"],
    );

    if (file != null && file.files.single.name.isNotEmpty) {
      fileName = file.files.first.name;
      filePath = file.files.first.path;

      setState(() {});
    }
  }

  void _openFile(String? path) {
    OpenFile.open(path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100),
            Center(
              child: Container(
                width: 350,
                height: 70,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black38),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/svgs/doc.svg", width: 50),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          fileName != null ? "$fileName" : "Upload File",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text("pdf, docx, doc, jpg"),
                      ],
                    ),
                    Spacer(),

                    PopupMenuButton(
                      color: Colors.white,
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem(
                            onTap: _uploadFile,
                            child: Row(
                              children: [
                                Icon(Icons.upload),
                                SizedBox(width: 5),
                                Text("Upload"),
                              ],
                            ),
                          ),

                          PopupMenuItem(
                            onTap: () {
                              _openFile(filePath);
                            },
                            child: Row(
                              children: [
                                Icon(CupertinoIcons.eye),
                                SizedBox(width: 5),
                                Text("View"),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            onTap: _uploadFile,
                            child: Row(
                              children: [
                                Icon(Icons.refresh),
                                SizedBox(width: 5),
                                Text("Change"),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            onTap: () {
                              fileName = null;
                              filePath = null;

                              setState(() {});
                            },
                            child: Row(
                              children: [
                                Icon(Icons.delete, color: Colors.red),
                                SizedBox(width: 5),
                                Text(
                                  "Delete",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                        ];
                      },
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 50),

            if (filePath != null)
              SizedBox(
                width: 230,
                height: 400,
                child: SfPdfViewer.file(File(filePath!)),
              ),
          ],
        ),
      ),
    );
  }
}
