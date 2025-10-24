import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchFilter extends StatefulWidget {
  const SearchFilter({super.key});

  @override
  State<SearchFilter> createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter> {
  final TextEditingController _controller = TextEditingController();

  List<Map> productItems = [
    {
      "image":
          "https://plus.unsplash.com/premium_photo-1664392147011-2a720f214e01?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZHVjdHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&q=60&w=500",
      "title": "Woman Brown HandBag",
      "price": 70,
    },

    {
      "image":
          "https://images.unsplash.com/photo-1523275335684-37898b6baf30?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=799",
      "title": "Android SmartWatch",
      "price": 50,
    },

    {
      "image":
          "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=870",
      "title": "Black EarPhones",
      "price": 100,
    },

    {
      "image":
          "https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=870",
      "title": "Nike Shoes",
      "price": 200,
    },

    {
      "image":
          "https://images.unsplash.com/photo-1572635196237-14b3f281503f?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=580",
      "title": "Sun Glasses",
      "price": 20,
    },
  ];
  List<Map> filterList = [];

  void _searchFunction(String keyWord) {
    setState(() {
      filterList = productItems.where((product) {
        final title = product["title"].toString().toLowerCase();
        final input = keyWord.toLowerCase();

        return title.contains(input);
      }).toList();
    });
  }

  void _highestToLowest() {
    setState(() {
      filterList = List<Map>.from(productItems);
      filterList.sort((a, b) => b["price"].compareTo(a["price"]));
    });
  }

  void _aToZ() {
    setState(() {
      filterList = List<Map>.from(productItems);
      filterList.sort((a, b) => a["title"].compareTo(b["title"]));
    });
  }

  @override
  void initState() {
    filterList = productItems;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade900,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(height: 50),
              SizedBox(
                height: 35,
                child: TextField(
                  controller: _controller,
                  cursorHeight: 15,
                  onChanged: _searchFunction,
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        _controller.text = "";
                        _searchFunction("");
                      },
                      child: Icon(CupertinoIcons.clear, size: 20),
                    ),
                    prefixIcon: Icon(CupertinoIcons.search),
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: GestureDetector(
                      onTap: () {
                        _searchFunction("");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 5,
                          ),
                          child: Text("All"),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: GestureDetector(
                      onTap: () {
                        _searchFunction("men");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 5,
                          ),
                          child: Text("Men"),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: GestureDetector(
                      onTap: () {
                        _searchFunction("Woman");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 5,
                          ),
                          child: Text("Woman"),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: GestureDetector(
                      onTap: () {
                        _searchFunction("shoes");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 5,
                          ),
                          child: Text("Nike"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      _highestToLowest();
                      setState(() {});
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.filter_list_alt,
                          color: Colors.white,
                          size: 20,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Highest To Lowest",
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 25),
                  GestureDetector(
                    onTap: () {
                      _aToZ();
                    },
                    child: Row(
                      children: [
                        Icon(Icons.filter_list, color: Colors.white, size: 20),
                        SizedBox(width: 5),
                        Text(
                          "A-Z",
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextButton(
                      onPressed: () {
                        _searchFunction("");
                      },
                      child: Row(
                        children: [
                          Icon(Icons.clear, color: Colors.white, size: 20),
                          Text("Clear", style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              Column(
                children: List.generate(filterList.length, (index) {
                  final product = filterList[index];
                  return ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                    leading: ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(10),
                      child: Image.network(
                        product["image"],
                        width: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      product["title"],
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                    trailing: Text(
                      "${product["price"]}\$",
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
