import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pdf/pdf.dart';
import 'package:portfolio/misc/strings.dart';
import 'package:portfolio/misc/test_style.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:url_launcher/url_launcher.dart';

import '../../home_page.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key key,
    @required this.bannerHeight,
    @required this.subTileSize,
  }) : super(key: key);

  final double bannerHeight;
  final int subTileSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          // height: bannerHeight,
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lương Thế Vinh',
                        style: TextStyle(
                            fontFamily: 'Play',
                            fontWeight: FontWeight.w700,
                            fontSize: 50),
                      ),
                      Text(
                        'Mobile Developer',
                        style: TextStyle(
                            fontFamily: 'Play',
                            fontWeight: FontWeight.w400,
                            fontSize: 35),
                      ),
                      Text(
                        "Address: Van Quan, Ha Dong, Ha Noi, Vietnam",
                        style: primaryTextStyle,
                      ),
                      Row(
                        children: [
                          Text(
                            "Email: ",
                            style: primaryTextStyle,
                          ),
                          SelectableText(
                            my_email,
                            style: primaryTextStyle.copyWith(
                                fontStyle: FontStyle.italic,
                                decoration: TextDecoration.underline),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "LinkedIn: ",
                            style: primaryTextStyle,
                          ),
                          GestureDetector(
                            onTap: () {
                              launch("https://$my_linked_in");
                            },
                            child: Text(
                              my_linked_in,
                              style: primaryTextStyle.copyWith(
                                  fontStyle: FontStyle.italic,
                                  decoration: TextDecoration.underline),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                padding: EdgeInsets.only(left: 150, top: 50),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Row(
                          children: [
                            Text(
                              "GitHub: ",
                              style: primaryTextStyle,
                            ),
                            GestureDetector(
                              onTap: () {
                                launch("https://$my_git_hub");
                              },
                              child: Text(
                                my_git_hub,
                                style: primaryTextStyle.copyWith(
                                    fontStyle: FontStyle.italic,
                                    decoration: TextDecoration.underline),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Medium: ",
                              style: primaryTextStyle,
                            ),
                            GestureDetector(
                              onTap: () {
                                launch("https://$my_medium");
                              },
                              child: Text(
                                my_medium,
                                style: primaryTextStyle.copyWith(
                                    fontStyle: FontStyle.italic,
                                    decoration: TextDecoration.underline),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Viblo: ",
                              style: primaryTextStyle,
                            ),
                            GestureDetector(
                              onTap: () {
                                launch("https://$my_viblo");
                              },
                              child: Text(
                                my_viblo,
                                style: primaryTextStyle.copyWith(
                                    fontStyle: FontStyle.italic,
                                    decoration: TextDecoration.underline),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Intellij Plugin: ",
                              style: primaryTextStyle,
                            ),
                            GestureDetector(
                              onTap: () {
                                launch("https://$my_intellij_plugin");
                              },
                              child: Text(
                                "plugins.jetbrains.com",
                                style: primaryTextStyle.copyWith(
                                    fontStyle: FontStyle.italic,
                                    decoration: TextDecoration.underline),
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ))
            ],
          ),
        ),
        Positioned(
            left: (MediaQuery.of(context).size.width) / 2,
            top: 100,
            child: Container(
              width: 1,
              color: Colors.black,
              height: 250,
            )),
        Positioned(
            left: (MediaQuery.of(context).size.width - subTileSize) / 2,
            top: bannerHeight / 2 - subTileSize,
            child: Column(
              children: [
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 5)),
                    child: Image.asset(
                      "images/printing.png",
                    ),
                  ),
                  onTap: () {
                    _printScreen();
                  },
                ),
              ],
            ))
      ],
    );
  }

  void _printScreen() async {
    Printing.layoutPdf(onLayout: (PdfPageFormat format) async {
      final doc = pw.Document();

      final image = await WidgetWraper.fromKey(
        key: printKey,
        pixelRatio: 2.0,
      );

      doc.addPage(pw.Page(
          pageFormat: format,
          build: (pw.Context context) {
            return pw.Expanded(
              child: pw.Image(
                image,
              ),
            );
          }));
      showDialog(
          context: printKey.currentContext,
          barrierDismissible: false,
          builder: (_) {
            return AlertDialog(
              title: Text('Please wait, this may take a while...'),
            );
          });
      await Future.delayed(Duration(seconds: 1));
      var imageBytes = await doc.save();
      Navigator.of(printKey.currentContext).pop();
      return imageBytes;
    });
  }
}
