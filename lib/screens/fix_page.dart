import 'package:cached_network_image/cached_network_image.dart';
import 'package:fixbro/widgets/fix_price_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FixPage extends StatefulWidget {
  final dataServices;

  FixPage({@required this.dataServices});

  @override
  _FixPageState createState() => _FixPageState();
}

class _FixPageState extends State<FixPage> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    Map servicesFromDataServices = widget.dataServices.data['services'];
    String category = widget.dataServices.documentID;

    return SafeArea(
      child: CupertinoPageScaffold(
        backgroundColor: Color(0xFF000000),
        navigationBar: CupertinoNavigationBar(
          backgroundColor: Color(0xFF000000),
          leading: CupertinoNavigationBarBackButton(color: Colors.white,
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        child: Center(
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  primary: true,
                  backgroundColor: Color(0xff000000),
                  expandedHeight: 200,
                  floating: true,
                  pinned: false,
                  flexibleSpace: FlexibleSpaceBar(
                      background: Column(
                    children: <Widget>[
                      Text(
                        '${widget.dataServices.documentID}',
                        style: GoogleFonts.russoOne(
                          textStyle:
                              TextStyle(color: Color(0xFFFFFFFF), fontSize: 30),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
//                          Image.network(
//                            '${widget.dataServices.data['image']}',
//                            height: 130,
//                          ),

                      CachedNetworkImage(
                        imageUrl: '${widget.dataServices.data['image']}',
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        height: 130,
                      ),
                    ],
                  )),
                )
              ];
            },
            body: ListView(
              children: servicesFromDataServices.entries.map((value) {
                return FixPrice(
                  header: value.key,
                  price: '${value.value} p',
                  category: category,
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
