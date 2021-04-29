import 'package:flutter/material.dart';

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
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: bannerHeight,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      child: Container(
                        color: Colors.greenAccent,
                      ),
                    ),
                    Flexible(child: Container(color: Colors.green))
                  ],
                ),
              ),
              Positioned(
                  left: (MediaQuery.of(context).size.width - subTileSize) / 2,
                  top: bannerHeight / 2 - subTileSize,
                  child: Column(
                    children: [
                      Container(color: Colors.teal, width: 50, height: 50),
                      Container(color: Colors.blue, width: 50, height: 50)
                    ],
                  ))
            ],
          ),
          SizedBox(height: 100),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(8.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      hintText: "0",
                    ),
                    validator: (value) {
                      return "asd";
                    },
                  ),
                  // TextFormField(),
                  // TextFormField(),
                  ElevatedButton(
                    child: Text('Press MEEEEE'),
                    onPressed: () {
                      if(_formKey.currentState.validate()) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text('Looks good to me')));
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text('Looks like shit to me')));
                      }

                    },
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
