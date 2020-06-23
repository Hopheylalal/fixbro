import 'package:fixbro/screens/work.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';


class Connect extends StatefulWidget {
  @override
  _ConnectState createState() => _ConnectState();
}

class _ConnectState extends State<Connect> {
  TextEditingController _controller = TextEditingController();
  bool progressBar = false;

  void displayDialog(context, String text) {
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
              Navigator.popUntil(context, ModalRoute.withName('/'));
            },
          )
        ],
      ),
    );
  }

  final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'fixbro@bk.ru',
      queryParameters: {
        'subject': 'Вопрос по ремонту'
      }
  );



//  "+79347779998", "Привет FixBro"

  String phone = '+79347779998';
  String text = 'Привет FixBro';

  void launchWhatsApp(
      {@required String phone,
        @required String message,
      }) async {
    String url() {
      if (Platform.isIOS) {
        return "whatsapp://wa.me/$phone/?text=${Uri.parse(message)}";
      } else {
        return "whatsapp://send?   phone=$phone&text=${Uri.parse(message)}";
      }
    }

    if (await canLaunch(url())) {
      await launch(url());
    } else {
      throw 'Could not launch ${url()}';
    }
  }




  @override
  Widget build(BuildContext context) {


    print('CONNECT SCREEN');
    String username = 'fixbrofirebase@gmail.com';
    String password = '1011678asd';

    final smtpServer = gmail(username, password);
    final message = Message()
      ..from = Address(username, 'FixBro App')
      ..recipients.add('fixbro@bk.ru')
      ..subject = 'Перезвоните клиенту'
//      ..text = 'This is the plain text.\nThis is line 2 of the text part.'
      ..html =
          "<h1>${_controller.text}</h1>\n<p>Перезвоните по этому номеру.</p>";

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: CupertinoPageScaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFF000000),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                children: <Widget>[
                  Text(
                    'Свяжитесь с нами',
                    style: GoogleFonts.russoOne(
                      textStyle:
                          TextStyle(color: Color(0xFFFFFFFF), fontSize: 30),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 320,
                    height: 170,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Закажите обратный звонок',
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                color: Color(0xFFFFFFFF), fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 26),
                          child: CupertinoTextField(
                            controller: _controller,
                            placeholder: "Укажите ваш номер телефона",
                            keyboardType: TextInputType.numberWithOptions(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: CupertinoButton(
                            child: progressBar
                                ? SizedBox(
                                    height: 10,
                                    width: 10,
                                    child: CircularProgressIndicator(
                                      valueColor:
                                          new AlwaysStoppedAnimation<Color>(
                                              Colors.black),
                                    ))
                                : Text(
                                    'Перезвоните мне',
                                    style: TextStyle(color: Color(0xFF000000)),
                                  ),
                            onPressed: () async {
                              if (_controller.text.isNotEmpty) {
                                setState(
                                  () {
                                    progressBar = true;
                                  },
                                );
                                try {
                                  final sendReport =
                                      await send(message, smtpServer);
                                  print(
                                      'Message sent: ' + sendReport.toString());
                                  displayDialog(context,
                                      'Спасибо. В ближайшее время с вами свяжется наш оператор');
                                  setState(() {
                                    progressBar = false;
                                  });
                                  _controller.clear();
                                  FocusScope.of(context)
                                      .requestFocus(new FocusNode());
                                } catch (e) {
                                  setState(() {
                                    progressBar = false;

                                  });
                                  print(e.toString());
                                }
                              } else {
                                displayDialog(
                                    context, 'Введите ваш номер телефона');
                              }
                            },
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Или задайте вопрос сами',
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                color: Color(0xFFFFFFFF), fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Wrap(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  UrlLauncher.launch("tel://+79347779998");
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1.0, color: Color(0xFFFFFFFF)),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0) //
                                        ),
                                  ),
                                  width: 130,
                                  height: 130,
                                  child: Center(
                                    child: FaIcon(
                                      FontAwesomeIcons.phoneAlt,
                                      color: Color(0xFFFFFFFF),
                                      size: 40,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: ()async {
                                  print('gg');
                                  launchWhatsApp(phone: phone,message: text);

                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1.0, color: Color(0xFFFFFFFF)),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0) //
                                        ),
                                  ),
                                  width: 130,
                                  height: 130,
                                  child: Center(
                                    child: FaIcon(
                                      FontAwesomeIcons.whatsapp,
                                      color: Color(0xFFFFFFFF),
                                      size: 40,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  UrlLauncher.launch(
                                      'https://www.instagram.com/fixbro__net/',
                                      forceSafariVC: false);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1.0, color: Color(0xFFFFFFFF)),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0) //
                                        ),
                                  ),
                                  width: 130,
                                  height: 130,
                                  child: Center(
                                    child: FaIcon(
                                      FontAwesomeIcons.instagram,
                                      color: Color(0xFFFFFFFF),
                                      size: 40,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap:(){
                                  launch(_emailLaunchUri.toString());
                                } ,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1.0, color: Color(0xFFFFFFFF)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                  ),
                                  width: 130,
                                  height: 130,
                                  child: Center(
                                    child: FaIcon(
                                      FontAwesomeIcons.envelope,
                                      color: Color(0xFFFFFFFF),
                                      size: 40,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),

                  Work()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
