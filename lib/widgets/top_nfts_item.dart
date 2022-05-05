import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nft_market/controllers/palette_generator_controller.dart';
import 'package:nft_market/controllers/url_transformer.dart';
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

class _TopNftsItemState extends State<TopNftsItem> {
  bool loadingPaletteColor = true;
  bool httpUrlCheck = true;
  bool loadingImage = true;
  UrlTransformer urlTransformer = UrlTransformer();

  @override
  void initState() {
    widget._nftModel.metadata.image =
        urlTransformer.urlTranformer(widget._nftModel.metadata.image);
    context
        .read<PaletteGeneratorController>()
        .generatePalette(widget._nftModel.metadata.image);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final paletteController = context.watch<PaletteGeneratorController>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 190,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NftDescriptionPage(
                  ownedNftsModel: widget._nftModel,
                  paletteGenerator: paletteController.palette,
                ),
              ),
            );
          },
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                child: paletteController.state == PaletteState.loading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Stack(
                        children: [
                          Container(
                            width: 190,
                            height: 170,
                            decoration: BoxDecoration(
                              color: paletteController
                                  .palette.darkMutedColor!.color
                                  .withOpacity(0.8),
                              borderRadius: BorderRadius.circular(20),
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
                            bottom: 2,
                            left: 10,
                            right: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 180,
                                  height: 20,
                                  child: Row(
                                    children: const [
                                      Text(
                                        'test',
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      FaIcon(
                                        FontAwesomeIcons.solidCircleCheck,
                                        color: Colors.indigo,
                                        size: 13,
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: SizedBox(
                                    width: 150,
                                    height: 20,
                                    child: Center(
                                      child: Text(
                                        widget._nftModel.title,
                                        style: TextStyle(
                                            color: paletteController.palette
                                                .lightVibrantColor!.color),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
              ),
              Positioned(
                left: 10,
                child: Stack(
                  children: [
                    Container(
                      width: 170,
                      height: 170,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black87.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          )
                        ],
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                              widget._nftModel.metadata.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 4,
                      bottom: 0,
                      child: TextButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.ethereum,
                              color: Colors.blue,
                              size: 12,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              widget._nftModel.id.tokenMetadata.tokenType,
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.blue),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            // Text('widget._nftModel.ownedNfts[0].id.tokenType'),
                          ],
                        ),
                        style: TextButton.styleFrom(
                          primary: Colors.black,
                          backgroundColor: Colors.black12.withOpacity(0.7),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
