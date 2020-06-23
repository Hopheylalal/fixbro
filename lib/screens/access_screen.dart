import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fixbro/services/firestore.dart';
import 'package:fixbro/widgets/access_item.dart';
import 'package:flutter/material.dart';

class AccessScreen extends StatelessWidget {
  final dataItem;

  const AccessScreen({this.dataItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('${dataItem.documentID}'),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: DataBase()
            .fireStore
            .collection('access/${dataItem.documentID}/access')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            return SizedBox(
              child: ListView(
                children: snapshot.data.documents.map((doc) {
                  return AccessItem(
                    imgUrl: doc.data['imgUrl'],
                    price: doc.data['price'],
                    name: doc.documentID,
                  );
                }).toList(),
              ),
            );
          }
          return Text('data');
        },
      ),
    );
  }
}
