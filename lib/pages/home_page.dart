import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nft_market/controllers/http_owned_nft_controller.dart';
import 'package:nft_market/repository/top_nfts_info_http.dart';
import 'package:nft_market/widgets/stroked_text_widget.dart';
import 'package:nft_market/widgets/top_nfts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = TextEditingController();
  final double? titleText = 25;
  final double? secondaryText = 12;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfa0f227a).withOpacity(0.8),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            FaIcon(
              FontAwesomeIcons.store,
              color: Colors.grey,
            ),
            SizedBox(
              width: 3,
            ),
            StrokedTextWidget(
                text: 'NFT market',
                fontSize: 18,
                internColor: Colors.grey,
                strokeColor: Colors.white30),
          ],
        ),
        actions: [
          Center(
            widthFactor: 0.9,
            child: IconButton(
              onPressed: () {},
              icon: FaIcon(
                FontAwesomeIcons.magnifyingGlass,
                color: Colors.grey,
              ),
            ),
          ),
          Center(
            child: IconButton(
              icon: FaIcon(
                FontAwesomeIcons.circleUser,
                color: Colors.grey,
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                const Color(0xff08154f).withOpacity(0.8),
                const Color(0xfa0f227a).withOpacity(0.8),
                const Color(0xfa182d6f),
              ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 5,
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 8),
              //   child: TextField(
              //     controller: searchController,
              //     decoration: const InputDecoration(
              //
              //       hintText: 'Search...',
              //       hintStyle: TextStyle(
              //         color: Colors.grey
              //       ),
              //       prefixIcon: Align(
              //         widthFactor: 1,
              //         heightFactor: 1,
              //         child: FaIcon(FontAwesomeIcons.magnifyingGlass,
              //         color: Colors.grey,),
              //       ),
              //
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.all(Radius.circular(20)),
              //       ),
              //     ),
              //   ),
              // ),
              MultiProvider(providers: [
                ChangeNotifierProvider(create: (_) => HttpOwnedNftController(topNftsInfoHttp: TopNftsInfoHttp())),
              ], child: const TopNfts()),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xfa0f227a).withOpacity(0.8),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.house),
              label: 'Home',
              backgroundColor: Colors.grey

          ),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.shopify),
              label: 'My orders',
              backgroundColor: Colors.grey
          ),
        ],
      ),
    );
  }
}
