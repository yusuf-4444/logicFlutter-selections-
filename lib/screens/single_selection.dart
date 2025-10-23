import 'package:flutter/material.dart';

class SingleSelection extends StatefulWidget {
  const SingleSelection({super.key});

  @override
  State<SingleSelection> createState() => _SingleSelectionState();
}

class _SingleSelectionState extends State<SingleSelection> {
  List<Map> items = [
    {"title": "cow", "image": "assets/animals/cow.png"},
    {"title": "deer", "image": "assets/animals/deer.png"},
    {"title": "giraffe", "image": "assets/animals/giraffe.png"},
    {"title": "lion", "image": "assets/animals/lion.png"},
    {"title": "pingeon", "image": "assets/animals/pingeon.png"},
    {"title": "rat", "image": "assets/animals/rat.png"},
    {"title": "tiger", "image": "assets/animals/tiger.png"},
    {"title": "white tiger", "image": "assets/animals/white-tiger.png"},
  ];
  int? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: GridView.builder(
        itemCount: items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 25,
          childAspectRatio: 0.85,
          crossAxisSpacing: 5,
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                selectedItem = index;
                setState(() {});
              },
              child: Stack(
                children: [
                  selectedItem == index
                      ? Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.black12,
                                Colors.black38,
                                Colors.black12,
                              ],
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                  Column(
                    children: [
                      Image.asset(
                        items[index]["image"],
                        width: 200,
                        height: selectedItem == index ? 103 : 100,
                      ),
                      selectedItem == index
                          ? Text(
                              items[index]["title"],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            )
                          : SizedBox.shrink(),
                    ],
                  ),
                  selectedItem == index
                      ? Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(color: Colors.pinkAccent),
                            child: Center(child: Text("Send")),
                          ),
                        )
                      : SizedBox.shrink(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
