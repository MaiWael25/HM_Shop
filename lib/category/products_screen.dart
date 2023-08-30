import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key, required this.categoryId, required this.categoryName}) : super(key: key);
  final String categoryId;
  final String categoryName;
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(widget.categoryName),
        backgroundColor: Colors.orange,

      ),
      body: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
    future: FirebaseFirestore.instance
        .collection("product")
        .where('category_id', isEqualTo: widget.categoryId)
        .get(),
    builder: (context, snapShot) {
      print(snapShot.data?.docs.length);
      switch (snapShot.connectionState) {
        case ConnectionState.none:
          return Text("none");
        case ConnectionState.waiting:
          return Center(child: CircularProgressIndicator());
        case ConnectionState.active:
          return Center(child: CircularProgressIndicator());
        case ConnectionState.done:
          return Padding(
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
                itemCount: snapShot.data?.docs.length ?? 0,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8)),
                      child: Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 5),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  bottomLeft: Radius.circular(8))),
                          height: 100,
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Container(
                                    child: Image.network(
                                      snapShot.data?.docs[index]['images'],
                                      width: 200,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(8)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Text(
                                  snapShot.data?.docs[index]['name'],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          );
      }
    }),
    );
  }
}