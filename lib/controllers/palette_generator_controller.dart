import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:palette_generator/palette_generator.dart';

enum PaletteState { loading, loaded, error }

class PaletteGeneratorController extends ChangeNotifier {
  PaletteState state = PaletteState.loading;
  PaletteGenerator? palette;
  Future<void> generatePalette(String imageUrl) async {
    try {
      palette = await PaletteGenerator.fromImageProvider(
          CachedNetworkImageProvider(imageUrl),
          maximumColorCount: 20);
      state = PaletteState.loaded;
      Future.delayed(const Duration(seconds: 5),(){});
      notifyListeners();
    } on Exception catch (e) {
      state = PaletteState.error;
      notifyListeners();
    }
  }
}
