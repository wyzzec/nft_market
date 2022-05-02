import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:nft_market/api_model/owned_nfts_model.dart';
import 'package:palette_generator/palette_generator.dart';

class NftDescriptionPage extends StatefulWidget {
  const NftDescriptionPage(
      {Key? key,
      required OwnedNftsModel ownedNftsModel,
      required PaletteGenerator paletteGenerator})
      : _ownedNftsModel = ownedNftsModel,
        _paletteGenerator = paletteGenerator,
        super(key: key);
  final OwnedNftsModel _ownedNftsModel;
  final PaletteGenerator _paletteGenerator;

  @override
  State<NftDescriptionPage> createState() => _NftDescriptionPageState();
}

class _NftDescriptionPageState extends State<NftDescriptionPage> {
  bool loadingImage = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: widget._paletteGenerator.mutedColor!.color,
            leading: Center(
              child: BackButton(
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            title: Text('NFT: '+ widget._ownedNftsModel.title,
            style: TextStyle(
              color: widget._paletteGenerator.darkMutedColor!.color,
            ),),
          ),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                  widget._paletteGenerator.darkMutedColor!.color,
                  widget._paletteGenerator.lightMutedColor!.color,
                ])),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 350,
                  height: 350,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black87.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        )
                      ],
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: NetworkImage(
                          widget._ownedNftsModel.metadata.image,
                        ),
                        fit: BoxFit.cover,
                      ),
                      color: Colors.black),
                ),
                SizedBox(
                  height: 20,
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              widget._ownedNftsModel.description,
                              textStyle: const TextStyle(
                                fontSize: 32.0,
                                fontWeight: FontWeight.bold,
                              ),
                              speed: const Duration(milliseconds: 30),
                            ),
                          ],
                          totalRepeatCount: 1,
                          pause: const Duration(milliseconds: 30),
                          displayFullTextOnTap: true,
                          stopPauseOnTap: true,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
