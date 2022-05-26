import 'package:cached_network_image/cached_network_image.dart';

import 'package:palette_generator/palette_generator.dart';



class PaletteGeneratorController {
  PaletteGenerator? palette;

  Future<PaletteGenerator?> generatePalette(String imageUrl) async {

      palette = await PaletteGenerator.fromImageProvider(
          CachedNetworkImageProvider(imageUrl),
          maximumColorCount: 20);
      return palette;


  }
}
