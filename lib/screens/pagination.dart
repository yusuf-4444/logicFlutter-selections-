import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Pagination extends StatefulWidget {
  const Pagination({super.key});

  @override
  State<Pagination> createState() => _PaginationState();
}

class _PaginationState extends State<Pagination> {
  List<int> items = [];

  final ScrollController controller = ScrollController();
  int currentPage = 1;
  int sizePage = 20;
  int maxSize = 3;
  bool isLoading = false;

  Future<void> _fetchData(int page) async {
    isLoading = true;
    await Future.delayed(Duration(seconds: 2));

    final start = (page - 1) * sizePage;
    final newItems = List.generate((sizePage), (index) {
      return start + index;
    });
    items.addAll(newItems);
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    _fetchData(currentPage);
    controller.addListener(() {
      if (controller.position.pixels >=
              controller.position.maxScrollExtent - 100 &&
          !isLoading &&
          currentPage < maxSize) {
        _fetchData(currentPage++);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade900,

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: controller,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Product: $index",
                    style: TextStyle(color: Colors.white),
                  ),
                );
              },
            ),
          ),
          if (isLoading)
            Padding(
              padding: const EdgeInsets.all(20),
              child: CupertinoActivityIndicator(
                color: Colors.white,
                radius: 15,
              ),
            ),
        ],
      ),
    );
  }
}
