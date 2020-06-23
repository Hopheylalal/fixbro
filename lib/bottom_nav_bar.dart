import 'package:fixbro/screens/about_us.dart';
import 'package:fixbro/screens/accessories.dart';
import 'package:fixbro/screens/connect.dart';
import 'package:fixbro/screens/home.dart';
import 'package:fixbro/screens/work.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class BottomNavigatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          backgroundColor: Colors.black,
          activeColor: Colors.white,
          inactiveColor: Colors.grey,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.tools,size: 25,),
              title: Text('Ремонт'),
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.box,size: 25,),
              title: Text('Аксессуары'),
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.phone,size: 25,),
              title: Text('Связь'),
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.infoCircle,size: 25,),
              title: Text('О нас'),
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return Home();
              break;
            case 1:
              return Access();
              break;
            case 2:
              return Connect();
              break;
            case 3:
              return AboutUs();
              break;
            default:
              return Home();
              break;
          }
        });
  }
}
