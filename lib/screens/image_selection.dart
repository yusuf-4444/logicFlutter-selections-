import 'package:flutter/material.dart';

class ImageSelection extends StatefulWidget {
  const ImageSelection({super.key});

  @override
  State<ImageSelection> createState() => _ImageSelectionState();
}

class _ImageSelectionState extends State<ImageSelection> {
  int selectedIndex = 0;
  List<String> images = [
    "assets/laptop/labtop1.png",
    "assets/laptop/labtop4.png",
    "assets/laptop/labtop2.png",
    "assets/laptop/labtop3.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffdee00),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  height: 300,
                  child: Center(child: Image.asset(images[selectedIndex])),
                ),
              ),
              Center(
                child: Row(
                  children: List.generate(images.length, (index) {
                    return Center(
                      child: GestureDetector(
                        onTap: () {
                          selectedIndex = index;
                          setState(() {});
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 6),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: selectedIndex == index
                                  ? Colors.blue
                                  : Colors.white,
                            ),
                          ),
                          child: Image.asset(images[index], height: 120),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
