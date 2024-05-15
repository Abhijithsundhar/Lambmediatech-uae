import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/common.dart';
import '../../../core/palette.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
        leading: Padding(
          padding: EdgeInsets.only(left: width * 0.04),
          child: GestureDetector(onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back_ios_new)),
        ),
        title: Padding(
          padding: EdgeInsets.only(left: width * 0.15),
          child: Text(
            'Cart',
            style: TextStyle(
                color: Colors.white,
                fontSize: width * 0.06,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height,
                width: width,
                child: Padding(
                  padding:  EdgeInsets.only(left: width*.03,right: width*.03),
                  child: ListView.builder(
                    itemCount: 50,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: height*.25,
                          width: width*.06,
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            // color: Colors.grey,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: Palette.gradient3, // Set border color to red
                            ),
                          ),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  SizedBox(height: height*.015,),
                                  Padding(
                                    padding:  EdgeInsets.only(left: width*.03),
                                    child: Container(
                                      height: height*.2,
                                      width: width*.25,
                                      decoration: BoxDecoration(color:Colors.grey,borderRadius: BorderRadius.circular(10)),
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding:  EdgeInsets.only(left: width*.03,top: height*.02),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: height*.017,),
                                    Container(width: width*.45,
                                        child: Text('Product name',style: TextStyle(color:Palette.gradient3),softWrap: true)),
                                    SizedBox(height: height*.002,),

                                    Container(width: width*.45,
                                        child: Text('Price',style: TextStyle(color:Palette.gradient3),)),
                                    SizedBox(height: height*.002,),
                                    Text('Qty',style: TextStyle(color:Palette.gradient3),),
                                    SizedBox(height: height*.002,),
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
                              // Column(
                              //   children: [
                              //     SizedBox(height: height*.020,),
                              //     Text('₹${150}'),
                              //     SizedBox(height: height*.13,),
                              //     GestureDetector(
                              //         onTap:  () => Navigator.push(context, MaterialPageRoute(builder: (context) => SingleChat(),)),
                              //         child : Icon(Icons.chat)),
                              //
                              //   ],
                              // )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
