import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/misc/strings.dart';
import 'package:portfolio/misc/test_style.dart';
import 'package:portfolio/widgets/bubble_widget.dart';
import 'package:portfolio/page/aboutMe/widgets/employment_history_widget.dart';
import 'package:portfolio/widgets/circle_bar_widget.dart';
import 'package:portfolio/widgets/image_indicator_widget.dart';
import 'package:portfolio/widgets/stepper_widget.dart';

import '../home_page.dart';
import 'widgets/edu_and_cert_widget.dart';
import 'widgets/header_widget.dart';

class AboutMePage extends StatefulWidget {
  @override
  _AboutMePageState createState() => _AboutMePageState();

  AboutMePage() {
    print("HECKKK");
  }
}

class _AboutMePageState extends State<AboutMePage> {
  final subTileSize = 50;
  final bannerHeight = 500.0;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print("IS REBUILTTTT");
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: RepaintBoundary(
          key: printKey,
          child: Column(
            children: [
              HeaderWidget(
                  bannerHeight: bannerHeight, subTileSize: subTileSize),
              Container(
                width: double.infinity,
                height: 1,
                color: Colors.black,
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: Column(
                      children: [
                        Text(
                          about_me_title,
                          style: primaryTextStyle.copyWith(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          about_me_description,
                          textAlign: TextAlign.center,
                          style: primaryTextStyle.copyWith(fontSize: 20),
                        )
                      ],
                    )),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                            child: Column(
                          children: [
                            Text(
                              about_me_employment_title,
                              style: primaryTextStyle.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.underline),
                            ),
                            SizedBox(height: 30),
                            EmploymentHistoryWidget(),
                            SizedBox(height: 60),
                            Text(
                              about_me_edu_and_certs,
                              style: primaryTextStyle.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.underline),
                            ),
                            SizedBox(height: 30),
                            EduAndCertWidget()
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                        )),
                        SizedBox(width: 20),
                        Flexible(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              about_me_tech_and_program_lang_title,
                              style: primaryTextStyle.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.underline),
                            ),
                            SizedBox(height: 5),
                            RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: '• Languages: ',
                                      style: primaryTextStyle.copyWith(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                    text: about_me_program_lang,
                                    style:
                                        primaryTextStyle.copyWith(fontSize: 17),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 5),
                            RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: '• Technologies: \n',
                                      style: primaryTextStyle.copyWith(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                    text: about_me_technology,
                                    style:
                                        primaryTextStyle.copyWith(fontSize: 17),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 5),
                            RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: '• Other: ',
                                      style: primaryTextStyle.copyWith(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                    text: about_me_other_skill,
                                    style:
                                        primaryTextStyle.copyWith(fontSize: 17),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Text(
                              about_me_foreign_languages,
                              style: primaryTextStyle.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.underline),
                            ),
                            Text('  • English\n  • Japanese',
                                style: primaryTextStyle.copyWith(
                                    fontSize: 17, fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 50,
                            ),
                            Text(
                              about_me_personal_skills,
                              style: primaryTextStyle.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.underline),
                            ),
                            Text(
                                '  • Great communicator\n'
                                '  • Responsible\n'
                                '  • Creative\n'
                                '  • Team Player\n',
                                style: primaryTextStyle.copyWith(
                                    fontSize: 17, fontWeight: FontWeight.bold)),
                          ],
                        ))
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Text(
                "~Built with Flutter~",
                style: primaryTextStyle.copyWith(fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
