import 'package:flutter/material.dart';
import 'package:nft_market/bloc/repository_bloc/repository_bloc.dart';
import 'package:nft_market/bloc/repository_bloc/repository_bloc_events/repository_bloc_event_load.dart';
import 'package:nft_market/bloc/repository_bloc/repository_bloc_states/repository_bloc_state_error.dart';
import 'package:nft_market/bloc/repository_bloc/repository_bloc_states/repository_bloc_state_interface.dart';
import 'package:nft_market/bloc/repository_bloc/repository_bloc_states/repository_bloc_state_loaded.dart';
import 'package:nft_market/bloc/repository_bloc/repository_bloc_states/repository_bloc_state_loading.dart';
import 'package:provider/provider.dart';
import 'top_nfts_item.dart';

class TopNfts extends StatefulWidget {
  const TopNfts({Key? key}) : super(key: key);

  @override
  State<TopNfts> createState() => _TopNftsState();
}

class _TopNftsState extends State<TopNfts> {
  final double? titleText = 25;
  final double? secondaryText = 12;


  @override
  void initState() {
    context.read<RepositoryBloc>().inputRepository.add(RepositoryBlocEventLoad());
    super.initState();
  }

  @override
  void dispose() {
    context.read<RepositoryBloc>().inputRepository.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<RepositoryBlocStateInterface>(
        stream: context.watch<RepositoryBloc>().outputRepository,
        builder: (context, snapshot) {
          var state = snapshot.data;
          if (state is RepositoryBlocStateLoading) {
            return Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          if (state is RepositoryBlocStateError){
            return Column(children: [Text(state.message)],);
          }
          if (state is RepositoryBlocStateLoaded) {
            return
              Flexible(
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: ListView.builder(
                    addAutomaticKeepAlives: true,
                    itemCount: snapshot.data!.apiInitialObject.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return MultiProvider(
                        providers: [
                          Provider(
                              create: (_) => (){}),
                        ],
                        child: TopNftsItem(
                          nftModel:
                          snapshot.data!.apiInitialObject[index],
                        ),
                      );
                    },
                  ),
                ),
              );
          }
          return const SizedBox();
        }
    );
  }
}