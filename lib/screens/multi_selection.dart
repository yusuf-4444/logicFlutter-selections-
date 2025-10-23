import 'package:flutter/material.dart';

class MultiSelection extends StatefulWidget {
  const MultiSelection({super.key});

  @override
  State<MultiSelection> createState() => _MultiSelectionState();
}

class _MultiSelectionState extends State<MultiSelection> {
  List<String> types = [
    "News",
    "Health",
    "Cooking",
    "Entertainment",
    "Sports",
    "Tech",
    "Flutter",
    "Ai",
    "Fashion & Styling",
    "Dressing",
    "Trending",
  ];
  Set<String> emptyList = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 50),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
              child: Text(
                "What do you want to see on X ? ",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Wrap(
            children: List.generate(types.length, (index) {
              final type = types[index];
              final selectedType = emptyList.contains(type);
              return GestureDetector(
                onTap: () {
                  if (selectedType) {
                    emptyList.remove(type);
                  } else {
                    emptyList.add(type);
                  }
                  setState(() {});
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: selectedType ? Colors.blue : Colors.grey.shade900,
                    ),
                    child: Text(
                      types[index],
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              );
            }),
          ),
          SizedBox(height: 20),

          Center(
            child: Column(
              children: emptyList.map((v) {
                return Text(v, style: TextStyle(color: Colors.white));
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
