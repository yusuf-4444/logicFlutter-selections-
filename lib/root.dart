import 'package:flutter/material.dart';
import 'package:logic_flutter_selections/screens/file_upload.dart';
import 'package:logic_flutter_selections/screens/form_validation.dart';
import 'package:logic_flutter_selections/screens/image_selection.dart';
import 'package:logic_flutter_selections/screens/image_upload.dart';
import 'package:logic_flutter_selections/screens/multi_image_upload.dart';
import 'package:logic_flutter_selections/screens/multi_selection.dart';
import 'package:logic_flutter_selections/screens/pagination.dart';
import 'package:logic_flutter_selections/screens/search_filter.dart';
import 'package:logic_flutter_selections/screens/single_selection.dart';
import 'package:logic_flutter_selections/screens/toggle_selection.dart';
import 'package:logic_flutter_selections/screens/video_upload.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int selectedPage = 0;
  PageController controller = PageController();
  List<Widget> screens = [
    SingleSelection(),
    ImageSelection(),
    ToggleSelection(),
    MultiSelection(),
    ImageUpload(),
    MultiImageUpload(),
    VideoUpload(),
    FileUpload(),
    SearchFilter(),
    FormValidation(),
    Pagination(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: screens,
        onPageChanged: (v) {
          selectedPage = v;
          setState(() {});
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.jumpToPage(selectedPage - 1);
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(color: Colors.black),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Next Page", style: TextStyle(color: Colors.white)),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      controller.jumpToPage(selectedPage + 1);
                    },
                    child: Icon(Icons.arrow_forward, color: Colors.white),
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
