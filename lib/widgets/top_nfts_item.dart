import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../api_model/owned_nfts_model.dart';
import 'package:palette_generator/palette_generator.dart';
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
  late PaletteGenerator palette;
  bool loadingPaletteColor = true;
  bool httpUrlCheck = true;
  late Image image;
  bool loadingImage = true;

  @override
  void initState() {
    urlTranformer();
    initPaletteGenerator();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                          paletteGenerator: palette,
                        )));
          },
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                child: loadingPaletteColor
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Stack(
                        children: [
                          Container(
                            width: 190,
                            height: 170,
                            decoration: BoxDecoration(
                                color: loadingPaletteColor
                                    ? Colors.black
                                    : palette.darkMutedColor!.color
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
                                      // Text(
                                      //   '123'
                                      //           .toString() +
                                      //       ' likes',
                                      //   style: const TextStyle(
                                      //     fontSize: 11,
                                      //     color: Colors.white,
                                      //   ),
                                      // ),
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
                                            color: palette
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
                          image: NetworkImage(widget._nftModel.metadata.image),
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

  Future<void> _generatePalette(String imagePath) async {
    PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(NetworkImage(imagePath),
            maximumColorCount: 20);
    palette = paletteGenerator;
  }

  void urlTranformer() {
    if (widget._nftModel.metadata.image.contains('http')) {
      httpUrlCheck = true;
    } else {
      if (widget._nftModel.metadata.image.contains('ipfs')) {
        widget._nftModel.metadata.image = widget._nftModel.metadata.image
            .replaceRange(0, 7, 'https://ipfs.io/ipfs/');
        setState(() {
          httpUrlCheck = true;
        });
      } else {
        httpUrlCheck = false;
      }
    }
  }

  void initPaletteGenerator() async {
    await _generatePalette(widget._nftModel.metadata.image);
    setState(() {
      loadingPaletteColor = false;
    });
  }
}
