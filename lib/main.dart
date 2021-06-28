import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Image Filter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<List<double>> filters = [
    CUSTOM_MATRIX,
    SEPIA_MATRIX,
    GREYSCALE_MATRIX,
    VINTAGE_MATRIX,
    SWEET_MATRIX
  ];

  @override
  Widget build(BuildContext context) {
    final Image img = Image.asset('assets/img/example.jpg');
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Image Filter'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '元画像',
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: img,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'フィルター適用',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Expanded(
              flex: 3,
              child: PageView.builder(
                  itemCount: filters.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: ColorFiltered(
                        colorFilter: ColorFilter.matrix(filters[index]),
                        child: img,
                      ),
                    );
                  }),
            ),
            Expanded(
              flex: 1,
              child: SafeArea(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: filters.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: ColorFiltered(
                          colorFilter: ColorFilter.matrix(filters[index]),
                          child: img,
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}

final CUSTOM_MATRIX = [
  1.0,
  0.0,
  0.0,
  0.0,
  0.0,
  0.0,
  1.0,
  0.0,
  0.0,
  0.0,
  0.0,
  0.0,
  1.0,
  0.0,
  0.0,
  0.0,
  0.0,
  0.0,
  1.0,
  0.0,
];

const SEPIA_MATRIX = [
  0.39,
  0.769,
  0.189,
  0.0,
  0.0,
  0.349,
  0.686,
  0.168,
  0.0,
  0.0,
  0.272,
  0.534,
  0.131,
  0.0,
  0.0,
  0.0,
  0.0,
  0.0,
  1.0,
  0.0
];

const GREYSCALE_MATRIX = [
  0.2126,
  0.7152,
  0.0722,
  0.0,
  0.0,
  0.2126,
  0.7152,
  0.0722,
  0.0,
  0.0,
  0.2126,
  0.7152,
  0.0722,
  0.0,
  0.0,
  0.0,
  0.0,
  0.0,
  1.0,
  0.0
];

const VINTAGE_MATRIX = [
  0.9,
  0.5,
  0.1,
  0.0,
  0.0,
  0.3,
  0.8,
  0.1,
  0.0,
  0.0,
  0.2,
  0.3,
  0.5,
  0.0,
  0.0,
  0.0,
  0.0,
  0.0,
  1.0,
  0.0
];

const SWEET_MATRIX = [
  1.0,
  0.0,
  0.2,
  0.0,
  0.0,
  0.0,
  1.0,
  0.0,
  0.0,
  0.0,
  0.0,
  0.0,
  1.0,
  0.0,
  0.0,
  0.0,
  0.0,
  0.0,
  1.0,
  0.0
];
