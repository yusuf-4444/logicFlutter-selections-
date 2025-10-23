import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToggleSelection extends StatefulWidget {
  const ToggleSelection({super.key});

  @override
  State<ToggleSelection> createState() => _ToggleSelectionState();
}

class _ToggleSelectionState extends State<ToggleSelection> {
  bool isFollow = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: 10),
                CircleAvatar(
                  radius: 140,
                  backgroundImage: AssetImage("assets/sonic.png"),
                ),
              ],
            ),
            Positioned(
              bottom: 220,
              left: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  isFollow = !isFollow;
                  setState(() {});
                },
                child: CircleAvatar(
                  backgroundColor: Colors.pink,
                  child: Icon(
                    isFollow ? CupertinoIcons.check_mark : CupertinoIcons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            Positioned(
              bottom: 100,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        isFollow = !isFollow;
                        setState(() {});
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            isFollow
                                ? CupertinoIcons.check_mark
                                : CupertinoIcons.add,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Rich sonic",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
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
