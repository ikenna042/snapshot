import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _screenShotController = ScreenshotController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Screenshot(
                controller: _screenShotController,
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Image.asset('images/carino.jpeg'),
                        Text(
                          'Mi Cariño',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              TextButton(
                  onPressed: _takeScreenshot,
                  child: Text('Take Screenshot and Share'))
            ],
          ),
        ),
      ),
    );
  }

  void _takeScreenshot() async {
    final imageFile = await _screenShotController.capture();
    Share.shareFiles([imageFile.path]);
  }
}
