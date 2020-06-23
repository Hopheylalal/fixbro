import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class Work extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Color(0xFF000000),
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Как мы работаем',
                style: TextStyle(
                  fontFamily: 'Ruso',
                  fontSize: 30,
                  color: Color(0xFFFFFFFF),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 300,
                      height: 130,
                      decoration: BoxDecoration(
                        border:
                            Border.all(width: 3.0, color: Color(0xFFFFFFFF)),
                        borderRadius: BorderRadius.all(Radius.circular(
                                20.0) //         <--- border radius here
                            ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'СООБЩАЕТЕ О ПРОБЛЕМЕ',
                                  style: TextStyle(
                                    fontFamily: 'RobotoB',
                                    fontSize: 16,
                                    color: Color(0xFFFFFFFF),
                                  ),
                                ),
                              ),
                              Text(
                                'Звоните в наш центр, описываете вашу проблему, мы называем приблизительную цену ремонта и даем информацию по наличию запчастей.',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 14,
                                  height: 1.2,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),

              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 300,
                      height: 120,
                      decoration: BoxDecoration(
                        border:
                            Border.all(width: 3.0, color: Color(0xFFFFFFFF)),
                        borderRadius: BorderRadius.all(Radius.circular(
                                20.0) //         <--- border radius here
                            ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'ДИАГНОСТИКА',
                                  style: TextStyle(
                                    fontFamily: 'RobotoB',
                                    fontSize: 16,
                                    color: Color(0xFFFFFFFF),
                                  ),
                                ),
                              ),
                              Text(
                                'Наш мастер произведет диагностику, сообщит о проблеме и озвучит точную стоимость и сроки ремонта',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 14,
                                  height: 1.2,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),

              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 300,
                      height: 120,
                      decoration: BoxDecoration(
                        border:
                            Border.all(width: 3.0, color: Color(0xFFFFFFFF)),
                        borderRadius: BorderRadius.all(Radius.circular(
                                20.0) //         <--- border radius here
                            ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'РЕМОНТ',
                                  style: TextStyle(
                                    fontFamily: 'RobotoB',
                                    fontSize: 16,
                                    color: Color(0xFFFFFFFF),
                                  ),
                                ),
                              ),
                              Text(
                                'Мы договорились о цене и сроках, мастер начнет работу',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 14,
                                  height: 1.2,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 300,
                        height: 120,
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 3.0, color: Color(0xFFFFFFFF)),
                          borderRadius: BorderRadius.all(Radius.circular(
                                  20.0) //         <--- border radius here
                              ),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'ГОТОВО',
                                    style: TextStyle(
                                      fontFamily: 'RobotoB',
                                      fontSize: 16,
                                      color: Color(0xFFFFFFFF),
                                    ),
                                  ),
                                ),
                                Text(
                                  'С вами связывается менеджер по готовности устройства и уточняет нужна ли доставка',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 14,
                                    height: 1.2,
                                    color: Color(0xFFFFFFFF),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ),
              SizedBox(height: 10,),

            ],
          ),
        ),
      ),
    );
  }
}
