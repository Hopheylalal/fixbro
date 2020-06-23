import 'package:fixbro/widgets/order_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FixPrice extends StatefulWidget {
  final String header;
  final String price;
  final String category;

  const FixPrice({@required this.header, @required this.price, @required this.category});

  @override
  _FixPriceState createState() => _FixPriceState();
}

class _FixPriceState extends State<FixPrice> {
  bool isExpanded = false;

  void _showModalSheet(context) {
    List data = [widget.header, widget.price, widget.category];

    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Container(
          child: OrderForm(data: data,),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 5,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Container(
              color: Color(0xFF161616),
              width: 300,
              height: 60,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '${widget.header}', 
                      textAlign: TextAlign.start,
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 16,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                      child: !isExpanded
                          ? Icon(
                              Icons.arrow_drop_down,
                              size: 30,
                              color: Color(0xFFFFFFFF),
                            )
                          : Icon(
                              Icons.arrow_drop_up,
                              size: 30,
                              color: Color(0xFFFFFFFF),
                            ),
                    )
                  ],
                ),
              ),
            ),
          ),
//          if (isExpanded)
            AnimatedContainer(
              duration: Duration(milliseconds: 100),
              color: Color(0xFF222222),
              height: isExpanded ? 90 : 0,
              width: 300,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      height: 35,
                      width: 110,
                      color: Color(0XFF333333),
                      child: Center(
                        child: Text(
                          '${widget.price}',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _showModalSheet(context);
                      },
                      child:
                      isExpanded ?
                      Icon(
                        CupertinoIcons.add_circled,
                        color: Color(0xFFFFFFFF),
                        size: 30,
                      ) : Container(),
                    )
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}
