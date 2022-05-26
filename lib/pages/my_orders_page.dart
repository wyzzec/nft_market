import 'package:flutter/material.dart';
class MyOrdersPage extends StatefulWidget {
  const MyOrdersPage({Key? key}) : super(key: key);

  @override
  State<MyOrdersPage> createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: Center(child: Text('testing route navigation',
          style: TextStyle(fontSize: 32),
          )),),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
