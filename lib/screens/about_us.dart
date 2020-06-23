import 'dart:async';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fixbro/services/firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  WebViewController _webViewController;
  String filePath = 'assets/files/index.html';
  String filePath2 = 'assets/files/index2.html';
  String filePath3 = 'assets/files/index3.html';
  String filePath4 = 'assets/files/index4.html';

  double sizePhone2;

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  String src;

  Completer<GoogleMapController> _controllerMap = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  Set<Marker> _gryMarker(lat, lon) {
    return <Marker>[
      Marker(
        markerId: MarkerId('FixBro'),
        position: LatLng(lat, lon),
        icon: BitmapDescriptor.defaultMarker,
      ),
    ].toSet();
  }

  @override
  Widget build(BuildContext context) {
    final sizePhone = MediaQuery.of(context).size.height;
    sizePhone2 = sizePhone;

    return CupertinoPageScaffold(
      backgroundColor: Color(0xFF000000),
      child: SafeArea(
        child: Center(
          child: FutureBuilder(
            future:
                Firestore.instance.collection('map').document('address').get(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: <Widget>[
                    Text(
                      'Наш адрес',
                      style: GoogleFonts.russoOne(
                        textStyle:
                            TextStyle(color: Color(0xFFFFFFFF), fontSize: 30),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${snapshot.data['address']}',
                      style: GoogleFonts.russoOne(
                        textStyle:
                            TextStyle(color: Color(0xFFFFFFFF), fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${snapshot.data['phone']}',
                      style: GoogleFonts.roboto(
                        textStyle:
                            TextStyle(color: Color(0xFFFFFFFF), fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: GoogleMap(
                        markers: _gryMarker(snapshot.data['coord'].latitude,
                            snapshot.data['coord'].longitude),
                        mapType: MapType.normal,
                        initialCameraPosition: CameraPosition(
                            zoom: 16.4746,
                            target: LatLng(snapshot.data['coord'].latitude,
                                snapshot.data['coord'].longitude)),
                        onMapCreated: (GoogleMapController controller) {
                          _controllerMap.complete(controller);
                        },
                      ),
//                child: StreamBuilder(
//                    stream: mapAdress,
//                    builder: (context, snapshot) {
//                      if (snapshot.hasData) {
//                        return WebView(
//                          initialUrl: snapshot.data['map'],
//                          javascriptMode: JavascriptMode.unrestricted,
////                  onWebViewCreated: (WebViewController webViewController) {
////                    _webViewController = webViewController;
////                    _loadHtmlFromAssets();
////                  },
//                        );
//                      }
//                      return SizedBox(
//                          height: 30,
//                          width: 30,
//                          child: CircularProgressIndicator());
//                    }),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }

  _loadHtmlFromAssets() async {
    String filePathPhone;
    if (Device.screenHeight == 896) {
      filePathPhone = filePath;
    } else if (Device.screenHeight == 736.0) {
      filePathPhone = filePath3;
    } else if (Device.screenHeight == 667.0) {
      filePathPhone = filePath2;
    } else if (Device.screenHeight == 812.0) {
      filePathPhone = filePath4;
    } else {
      filePathPhone = filePath;
    }

    String fileHtmlContents = await rootBundle.loadString(filePathPhone);
    _webViewController.loadUrl(Uri.dataFromString(fileHtmlContents,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }
}
