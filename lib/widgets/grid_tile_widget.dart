import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

class GridTileWidget extends StatelessWidget {
  final String imageUrl;
  final String name;
  final Function getServices;

  const GridTileWidget(
      {@required this.imageUrl,
      @required this.name,
      @required this.getServices});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: getServices,
      child: Container(
        height: 170,
        width: 170,
        child: Column(
          children: <Widget>[
//            Image.network(imageUrl, height: 90,),

            CachedNetworkImage(
              imageUrl: imageUrl,
              placeholder: (context, url) => SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.black,
                  valueColor: new AlwaysStoppedAnimation<Color>(
                    Color(0XFF333333),
                  ),
                ),
              ),
              errorWidget: (context, url, error) => Icon(
                Icons.error,
                color: Colors.grey,
              ),
              height: 90,
            ),

            SizedBox(
              height: 10,
            ),
            Text(
              '$name',
              textAlign: TextAlign.start,
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
