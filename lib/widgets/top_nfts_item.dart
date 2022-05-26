import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nft_market/controllers/palette_generator_controller.dart';
import 'package:nft_market/widgets/stroked_text_widget.dart';
import 'package:provider/provider.dart';

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
  bool loadingPaletteColor = true;
  bool httpUrlCheck = true;
  bool loadingImage = true;

  @override
  void initState() {
    context
        .read<PaletteGeneratorController>()
        .generatePalette(widget._nftModel.metadata.imageUrlFormatted!);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final paletteController = context.watch<PaletteGeneratorController>();
    return paletteController.state == PaletteState.loading
        ? Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.grey,
                ),
              ),
            ],
          )
        : Stack(
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
                              color: paletteController
                                  .palette!.darkMutedColor!.color,
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
                                      internColor: paletteController
                                          .palette!.lightMutedColor!.color,
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
                              paletteGenerator: paletteController.palette!,
                            ),
                          ),
                        );
                      },
                      child: const StrokedTextWidget(
                          text: 'More details',
                          fontSize: 12,
                          internColor: Colors.white60,
                          strokeColor: Colors.black),
                    ),
                  ],
                ),
              )
            ],
          );
  }

  @override
  bool get wantKeepAlive => true;
}
