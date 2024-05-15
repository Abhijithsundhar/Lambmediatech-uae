import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/common.dart';
import '../../../core/palette.dart';
import '../../login/screens/guestlogin.dart';
import 'addproduct.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
        leading: Padding(
          padding: EdgeInsets.only(left: width * 0.04),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios_new),
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(left: width * 0.15),
          child: Text(
            'Dashboard',
            style: TextStyle(
              color: Colors.white,
              fontSize: width * 0.06,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: height,
                  width: width,
                  child: Padding(
                    padding: EdgeInsets.only(left: width * 0.03, right: width * 0.03),
                    child: ListView.builder(
                      itemCount: 50,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: height * 0.25,
                            width: width * 0.06,
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: Palette.gradient3,
                              ),
                            ),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    SizedBox(height: height * 0.015),
                                    Padding(
                                      padding: EdgeInsets.only(left: width * 0.03),
                                      child: Container(
                                        height: height * 0.2,
                                        width: width * 0.25,
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: width * 0.03, top: height * 0.02),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: height * 0.017),
                                      Container(
                                        width: width * 0.45,
                                        child: Text('Product name', style: TextStyle(color: Palette.gradient3), softWrap: true),
                                      ),
                                      SizedBox(height: height * 0.002),
                                      Container(
                                        width: width * 0.45,
                                        child: Text('Price', style: TextStyle(color: Palette.gradient3)),
                                      ),
                                      SizedBox(height: height * 0.002),
                                      Text('Qty', style: TextStyle(color: Palette.gradient3)),
                                      SizedBox(height: height * 0.002),
                                      Row(
                                        children: [
                                          Icon(Icons.star, color: Colors.yellow[700], size: 20),
                                          Icon(Icons.star, color: Colors.yellow[700], size: 20),
                                          Icon(Icons.star_border, color: Colors.grey, size: 20),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: height * 0.9),
              ],
            ),
          ),
          Positioned(
            bottom: 20, // Adjust bottom position as needed
            right: 20, // Adjust right position as needed
            child: GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct())),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey,
                child: Icon(Icons.add, size: width * 0.1, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
