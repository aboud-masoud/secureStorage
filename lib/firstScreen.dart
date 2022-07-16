import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:securestorage_example/secoundScreen.dart';
import 'package:securestorage_example/sss.dart';
import 'package:securestorage_example/thierdScreen.dart';

class FirstScreen extends StatelessWidget {
  FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              final storage = FlutterSecureStorage();
              final value = storage.read(key: "didYouGoToSecoundPageBefore");

              Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) => value == "true"
                      ? const ThierdScreen()
                      : const SecoundScreen())));
            },
            child: const Text("Go the The Other Screen"),
          ),
        ),
      ),
    );
  }
}
