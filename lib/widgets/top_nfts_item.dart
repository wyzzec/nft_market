import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nft_market/bloc/pallete_generator_bloc/palette_generator_bloc.dart';
import 'package:nft_market/bloc/pallete_generator_bloc/palette_generator_bloc_events/palette_generator_bloc_event_load_palette.dart';
import 'package:nft_market/bloc/pallete_generator_bloc/palette_generator_bloc_states/palette_generator_bloc_state_error.dart';
import 'package:nft_market/bloc/pallete_generator_bloc/palette_generator_bloc_states/palette_generator_bloc_state_initial.dart';
import 'package:nft_market/bloc/pallete_generator_bloc/palette_generator_bloc_states/palette_generator_bloc_state_interface.dart';
import 'package:nft_market/bloc/pallete_generator_bloc/palette_generator_bloc_states/palette_generator_bloc_state_loaded.dart';
import 'package:nft_market/widgets/stroked_text_widget.dart';
import 'package:nft_market/widgets/top_nft_item_loading.dart';
import 'package:palette_generator/palette_generator.dart';

import '../api_model/owned_nfts_model.dart';
import '../pages/nft_description_page.dart';

class TopNftsItem extends StatefulWidget {
  const TopNftsItem({
    Key? key,
    required OwnedNftsModel nftModel,
  })  : _nftModel = nftModel,
        super(key: key);

  final OwnedNftsModel _nftModel;

  @override
  State<TopNftsItem> createState() => _TopNftsItemState();
}

class _TopNftsItemState extends State<TopNftsItem>
    with AutomaticKeepAliveClientMixin {
  late final PaletteGeneratorBloc paletteGeneratorBloc;

  @override
  void initState() {
    paletteGeneratorBloc = PaletteGeneratorBloc();
    paletteGeneratorBloc.inputPalette.add(PaletteGeneratorBlocEventLoadPalette(
        imageUrl: widget._nftModel.metadata.imageUrlFormatted!));
    super.initState();
  }

  @override
  void dispose() {
    paletteGeneratorBloc.inputPalette.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PaletteGeneratorBlocStateInterface>(
        stream: paletteGeneratorBloc.outputPalette,
        builder: (context, snapshot) {
          var state = snapshot.data;
          if (state is PaletteGeneratorBlocStateInitial) {
            return TopNftItemLoading();
          }
          if (state is PaletteGeneratorBlocStateError) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(state.message),
                )
              ],
            );
          }
          if (state is PaletteGeneratorBlocStateLoaded) {
            final PaletteGenerator? paletteGenerator = snapshot.data!.palette;
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 4, left: 8),
                  child: SizedBox(
                    width: 210,
                    height: 280,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 210,
                              height: 210,
                              decoration: BoxDecoration(
                                color: paletteGenerator!.darkMutedColor!.color,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black87.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 3,
                                    offset: const Offset(0, 3),
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                                bottom: 10,
                                child: Row(
                                  children: [
                                    StrokedTextWidget(
                                        text: widget._nftModel.title,
                                        fontSize: 20,
                                        internColor: paletteGenerator
                                            .lightMutedColor!.color,
                                        strokeColor: Colors.black),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    FaIcon(
                                      FontAwesomeIcons.ethereum,
                                      color: Colors.blueAccent,
                                      size: 18,
                                    ),
                                  ],
                                ))
                          ],
                        ),
                        Positioned(
                            top: 0,
                            child: Container(
                              width: 190,
                              height: 190,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black87.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 3,
                                    offset: const Offset(0, 1),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image: CachedNetworkImageProvider(widget
                                      ._nftModel.metadata.imageUrlFormatted!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 75,
                  right: 10,
                  child: Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.indigo),
                        onPressed: () {},
                        child: const StrokedTextWidget(
                            text: 'BUY NOW',
                            fontSize: 16,
                            internColor: Colors.white70,
                            strokeColor: Colors.black),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.indigo),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NftDescriptionPage(
                                ownedNftsModel: widget._nftModel,
                                paletteGenerator: paletteGenerator,
                              ),
                            ),
                          );
                        },
                        child: const StrokedTextWidget(
                            text: 'More details',
                            fontSize: 12,
                            internColor: Colors.white70,
                            strokeColor: Colors.black),
                      ),
                    ],
                  ),
                )
              ],
            );
          }
          return SizedBox();
        });
  }

  @override
  bool get wantKeepAlive => true;
}
