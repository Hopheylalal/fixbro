import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(width: 60, height: 60, child: Image.asset('assets/img/logo.jpg')),
        Text('Сервисный центр',
            style: TextStyle(
              fontFamily: 'Ruso',
              fontSize: 30,
              color: Color(0xFFFFFFFF),
            )),
        Text(
          'FixBro',
          style: TextStyle(
            fontFamily: 'Ruso',
            fontSize: 45,
            color: Color(0xFFFFFFFF),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 55, top: 20, right: 20, bottom: 20),
          child: Text(
            'Мы не зарабатываем на запчастях! \nМы зарабатываем на качественном ремонте.',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 16,
              color: Color(0xFFFFFFFF),
            ),
          ),
        ),
      ],
    );
  }
}
