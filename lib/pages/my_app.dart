import 'package:flutter/material.dart';
import 'package:nft_market/controllers/palette_generator_controller.dart';
import 'package:nft_market/pages/home_page.dart';
import 'package:provider/provider.dart';

import 'nft_description_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
      },
    );
  }
}
