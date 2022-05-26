import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nft_market/pages/home_page.dart';

import '../widgets/stroked_text_widget.dart';
import 'my_orders_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PageController? controller;
  int _index = 0;
  @override
  void initState() {
    controller = PageController();
    super.initState();
  }
  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xfa0f227a).withOpacity(0.8),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              FaIcon(
                FontAwesomeIcons.store,
                color: Colors.white60,
              ),
              SizedBox(
                width: 3,
              ),
              StrokedTextWidget(
                  text: 'NFT market',
                  fontSize: 18,
                  internColor: Colors.white60,
                  strokeColor: Colors.black),
            ],
          ),
          actions: [
            Center(
              widthFactor: 0.9,
              child: IconButton(
                onPressed: () {},
                icon: const FaIcon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: Colors.white60,
                ),
              ),
            ),
            Center(
              child: IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.circleUser,
                  color: Colors.white60,
                ),
                onPressed: () {},
              ),
            )
          ],
        ),
        body: PageView(
          controller: controller,
          onPageChanged: onPageChanged,
          children: const [
            HomePage(),
            MyOrdersPage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: onItemCLicked,
          selectedItemColor: Colors.grey,
          unselectedItemColor: Colors.grey.withOpacity(0.6),
          backgroundColor: const Color(0xfa0f227a).withOpacity(0.8),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.house),
              label: 'Home',
              backgroundColor: Colors.white60,
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.shopify),
              label: 'My orders',
              backgroundColor: Colors.white60,
            ),
          ],
        ),
      ),
    );
  }
  void onPageChanged(int index){
    setState(() {
      _index = index;
    });
  }
  void onItemCLicked(int index){
    setState(() {
      _index = index;
    });
    controller!.jumpToPage(index);
  }
}
