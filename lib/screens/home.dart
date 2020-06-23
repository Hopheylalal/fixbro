import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fixbro/screens/fix_page.dart';
import 'package:fixbro/screens/set_choice_screen.dart';
import 'package:fixbro/services/firestore.dart';
import 'package:fixbro/widgets/grid_tile_widget.dart';
import 'package:fixbro/widgets/header_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Color(0xFF000000),
      child: SafeArea(
        child: GestureDetector(
          onTap: (){
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Center(
            child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    primary: true,
                    backgroundColor: Color(0xff000000),
                    expandedHeight: 270,
                    floating: true,
                    pinned: false,
                    flexibleSpace: FlexibleSpaceBar(
                        background: SafeArea(
                      child: HeaderWidget(),
                    )),
                  )
                ];
              },
              body: Center(
                child: Column(
                  children: <Widget>[
                    StreamBuilder(
                      stream: DataBase()
                          .fireStore.collection('fixitemcollection')
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
                                      getServices: (){
                                        if(doc.data['set'] == false){
                                          Navigator.push(
                                            context,
                                            CupertinoPageRoute(builder: (context) => FixPage(dataServices: doc)),
                                          );
                                        }else{
                                          Navigator.push(
                                            context,
                                            CupertinoPageRoute(builder: (context) => SetChoice(dataServices: doc,)),
                                          );
                                        }

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
            ),
          ),
        ),
      ),
    );
  }
}
