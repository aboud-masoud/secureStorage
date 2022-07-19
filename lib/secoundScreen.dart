import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:securestorage_example/firstScreen.dart';
import 'package:securestorage_example/sss.dart';

class SecoundScreen extends StatelessWidget {
  const SecoundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Column(
          children: [
            const Text("Secound"),
            ElevatedButton(
                onPressed: () async {
                  // await saveInSecureStorage();

                  Navigator.of(context).pop();
                },
                child: Text("Back"))
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
