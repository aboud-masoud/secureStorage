import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:securestorage_example/loginScreen.dart';
import 'package:securestorage_example/sss.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Column(
          children: [
            Expanded(child: Container()),
            const Text("Home"),
            ElevatedButton(
              onPressed: () async {
                Navigator.of(context).pop();
              },
              child: Text("Back"),
            ),
            ElevatedButton(
              onPressed: () async {
                final storage = FlutterSecureStorage();
                await storage.deleteAll();

                Navigator.of(context).pop();
              },
              child: Text("Logout"),
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }

  Future<void> saveInSecureStorage() async {
    final storage = FlutterSecureStorage();

    await storage.write(key: "didYouGoToSecoundPageBefore", value: "true");
  }
}
