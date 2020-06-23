import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fixbro/screens/set_choice_screen.dart';
import 'package:fixbro/services/firestore.dart';
import 'package:fixbro/widgets/grid_tile_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'access_screen.dart';
import 'fix_page.dart';

class Access extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Выберите вашу модель телефона'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20,),
            StreamBuilder(
              stream: DataBase()
                  .fireStore
                  .collection('access')
//                  .orderBy("order", descending: false)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  return Expanded(
                    child: ListView(children: <Widget>[
                      GridView.count(
                        padding: EdgeInsets.all(10),
                        physics: BouncingScrollPhysics(),
                        crossAxisSpacing: 10.0,
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        shrinkWrap: true,
                        children: snapshot.data.documents.map((doc) {
                          return GridTile(
                            child: GridTileWidget(
                              imageUrl: doc.data['image'],
                              name: doc.documentID,
                              getServices: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => AccessScreen(
                                      dataItem: doc,
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        }).toList(),
                      ),
                    ]),
                  );
                }
                return Text('data');
              },
            ),
          ],
        ),
      ),
    );
  }
}
