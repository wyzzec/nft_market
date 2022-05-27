import 'package:flutter/material.dart';
import 'package:nft_market/bloc/repository_bloc/repository_bloc.dart';
import 'package:nft_market/repository/interface_top_nfts_info_repository.dart';
import 'package:nft_market/widgets/top_nfts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  final TextEditingController searchController = TextEditingController();
  final double? titleText = 25;
  final double? secondaryText = 12;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
            MultiProvider(providers: [
              Provider(create: (_) => RepositoryBloc(
                  interfaceTopNftsInfoRepository: context.read<InterfaceTopNftsInfoRepository>())
                ,),
            ], child: const TopNfts()),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

