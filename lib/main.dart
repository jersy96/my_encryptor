import 'package:flutter/material.dart';
import 'encryption/CesarEncryptor.dart';

void main() {
  runApp(MyApp(
    appName: 'My encryptor',
  ));
}

class MyApp extends StatelessWidget {
  final String appName;

  MyApp({Key key, this.appName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: appName),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _encryptedText = '';
  String _alphabet = '\\ \'/,.-<>?"+*[]{}qwertyuiopasdfghjklñzxcvbnm';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _getTextToEncryptField(),
            _getEncryptedTextWidget()
          ],
        ),
      ),
    );
  }

  // Widgets
  Widget _getTextToEncryptField() {
    return SizedBox(
      width: 500.0,
      height: 100.0,
      child: TextField(
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.greenAccent, width: 2.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2.0),
            ),
            hintText: 'text to encrypt',
          ),
          onChanged: _onTextToEncryptChanged),
    );
  }

  Widget _getEncryptedTextWidget() {
    return SizedBox(width: 500.0, height: 100.0, child: Text(_encryptedText));
  }

  // Level 1
  void _onTextToEncryptChanged(text) {
    setState(() {
      _encryptedText = _encrypt(text);
    });
  }

  // Level 2
  String _encrypt(String text) {
    return _encryptWithCesar(_alphabet, text, 3);
  }

  // Level 3
  String _encryptWithCesar(String alphabet, String text, int increment) {
    CesarEncryptor encryptor = CesarEncryptor(alphabet, increment);
    return encryptor.encrypt(text);
  }
}
