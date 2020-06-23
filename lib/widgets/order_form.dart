import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class OrderForm extends StatefulWidget {
  final List data;

  const OrderForm({this.data});

  @override
  _OrderFormState createState() => _OrderFormState();
}

class _OrderFormState extends State<OrderForm> {
  bool switchState = false;

  bool progressBar = false;

  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerPhone = TextEditingController();

  String delivery(switchState) {
    if (switchState == false) {
      return 'НЕТ';
    } else {
      return 'ДА';
    }
  }

  void displayDialog(context, String text, Function navigator) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) => new CupertinoAlertDialog(
//        title: new Text("Успешно"),
        content: new Text("$text"),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: new Text("Ok"),
            onPressed: () {
              navigator();
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String username = 'fixbrofirebase@gmail.com';
    String password = '1011678asd';

    int orderNumber = Random().nextInt(10000);

    final smtpServer = gmail(username, password);
    final message = Message()
      ..from = Address(username, 'FixBro App')
      ..recipients.add('fixbro@bk.ru')
      ..subject = 'Новая заявка #$orderNumber'
//      ..text = 'This is the plain text.\nThis is line 2 of the text part.'
      ..html =
          "<h1>${widget.data[2]}</h1>\n<p>${widget.data[0]}</p>\n<p>${widget.data[1]}</p>\n<p>Вызов курьера: ${delivery(switchState)}</p>\n<p>Имя: ${_controllerName.text} </p>\n<p>Телефон: ${_controllerPhone.text} </p>";

    return Scaffold(
      backgroundColor: Color(0xFF000000),
      resizeToAvoidBottomPadding: true,
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Container(
            color: Color(0xFF000000),
            height: 500,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Center(
                    child: Text(
                      'Заявка на ремонт',
                      style: GoogleFonts.russoOne(
                        textStyle:
                            TextStyle(color: Color(0xFFFFFFFF), fontSize: 27),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, bottom: 5),
                  child: Text(
                    'Ваше имя',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: CupertinoTextField(
                    controller: _controllerName,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, bottom: 5, top: 20),
                  child: Text(
                    'Номер телефона',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: CupertinoTextField(
                    controller: _controllerPhone,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 40, bottom: 5),
                      child: Text(
                        'Вызов курьера(Бесплатно)',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 33),
                      child: CupertinoSwitch(
                          activeColor: Color(0xFF80997A),
                          trackColor: Color(0xFF3C3C3C),
                          value: switchState,
                          onChanged: (bool value) {
                            setState(() {
                              switchState = value;
                            });
                            print(value);
                          }),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 40, bottom: 5, top: 20),
                      child: Text(
                        '${widget.data[0]}',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30, bottom: 5, top: 20, right: 30),
                      child: Text(
                        '${widget.data[1]}',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
//                    Padding(
//                      padding: const EdgeInsets.only(
//                          left: 40, bottom: 5, top: 20, right: 40),
//                      child: Text(
//                        '${widget.data[2]}',
//                        textAlign: TextAlign.start,
//                        style: GoogleFonts.roboto(
//                          textStyle: TextStyle(
//                            color: Color(0xFFFFFFFF),
//                            fontSize: 16,
//                          ),
//                        ),
//                      ),
//                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: CupertinoButton(
                    child: progressBar
                        ? SizedBox(
                            height: 10,
                            width: 10,
                            child: CircularProgressIndicator(
                              valueColor: new AlwaysStoppedAnimation<Color>(
                                  Colors.black),
                            ),
                          )
                        : Text(
                            'Отправить',
                            style: TextStyle(
                              color: Color(0xFF000000),
                            ),
                          ),
                    onPressed: () async {
                      if (_controllerPhone.text.isNotEmpty &&
                          _controllerName.text.isNotEmpty) {
                        try {
                          setState(() {
                            progressBar = true;
                          });
                          final sendReport = await send(message, smtpServer);
                          print(
                            'Message sent: ' + sendReport.toString(),
                          );
                          displayDialog(context,
                              'Ваш заявка принята. В ближайшее время с вами свяжется наш оператор',
                              () {
                            Navigator.popUntil(
                              context,
                              ModalRoute.withName('/'),
                            );
                          });
                        } catch (e) {
                          setState(() {
                            progressBar = false;
                          });
                          print(e.toString());
                        }
                      } else {
                        displayDialog(context, 'Заполните пожалуйста форму.',
                            () {
                          Navigator.of(context).pop();
                        });
                      }
                    },
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
