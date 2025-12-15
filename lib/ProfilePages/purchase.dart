import 'package:flutter/material.dart';
import 'package:harmanapp/AppBar/AppBar.dart';

class Purchasepage extends StatefulWidget {
  const Purchasepage({super.key});

  @override
  State<Purchasepage> createState() => _PurchasepageState();
}

class _PurchasepageState extends State<Purchasepage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: InstagramTopBar(),
        body: Column(
          children: [
            SizedBox(height: 20),
            Text(
              "Purchase Tiers",
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Color(0xFFFFD700), width: 2),
                color: Colors.black,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 70,
                    width: 70,
                    child: Image.asset(
                      "assets/screenshots/gold.png",
                      fit: BoxFit.contain,
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5),
                    height: 20,
                    width: 1.5,
                    color: Colors.white30,
                  ),
                  Text(
                    "\$ 49.99",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5),
                    height: 20,
                    width: 1.5,
                    color: Colors.white30,
                  ),

                  ElevatedButton(
                    onPressed: () {
                      // add purchase logic here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Buy Now",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Color(0xFFFFD700), width: 2),
                color: Colors.black,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 70,
                    width: 70,
                    child: Image.asset(
                      "assets/screenshots/silver.png",
                      fit: BoxFit.contain,
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5),
                    height: 20,
                    width: 1.5,
                    color: Colors.white30,
                  ),
                  Text(
                    "\$ 39.99",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5),
                    height: 20,
                    width: 1.5,
                    color: Colors.white30,
                  ),

                  ElevatedButton(
                    onPressed: () {
                      // add purchase logic here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Buy Now",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Color(0xFFFFD700), width: 2),
                color: Colors.black,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 70,
                    width: 70,
                    child: Image.asset(
                      "assets/screenshots/bronze.png",
                      fit: BoxFit.contain,
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5),
                    height: 20,
                    width: 1.5,
                    color: Colors.white30,
                  ),
                  Text(
                    "\$ 29.99",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5),
                    height: 20,
                    width: 1.5,
                    color: Colors.white30,
                  ),

                  ElevatedButton(
                    onPressed: () {
                      // add purchase logic here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Buy Now",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}
