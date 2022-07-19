import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:securestorage_example/secoundScreen.dart';
import 'package:securestorage_example/thierdScreen.dart';
// import 'package:securestorage_example/sss.dart';
// import 'package:securestorage_example/thierdScreen.dart';

class FirstScreen extends StatelessWidget {
  FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () async {
              final storage = FlutterSecureStorage();

              final value = await storage.read(key: "didYouGoToSecoundPageBefore");

              print(value);

              if (value == null || value == "secound") {
                await storage.write(key: "didYouGoToSecoundPageBefore", value: "thierd");
                Navigator.of(context).push(MaterialPageRoute(builder: ((context) => const SecoundScreen())));
              } else {
                await storage.write(key: "didYouGoToSecoundPageBefore", value: "secound");
                Navigator.of(context).push(MaterialPageRoute(builder: ((context) => const ThierdScreen())));
              }
            },
            child: const Text("Go the The Other Screen"),
          ),
        ),
      ),
    );
  }
}
