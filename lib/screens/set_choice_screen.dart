import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fixbro/services/firestore.dart';
import 'package:fixbro/widgets/grid_tile_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'fix_page.dart';

class SetChoice extends StatelessWidget {
  final dataServices;

  SetChoice({@required this.dataServices});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Color(0xFF000000),
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Color(0xFF000000),
        leading: CupertinoNavigationBarBackButton(color: Colors.white,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            StreamBuilder(
              stream: DataBase()
                  .fireStore
                  .collection(
                      'fixitemcollection/${dataServices.documentID}/models')
                  .orderBy("order", descending: false)
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
                                    builder: (context) =>
                                        FixPage(dataServices: doc),
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
