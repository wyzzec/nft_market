import 'package:palette_generator/palette_generator.dart';

abstract class PaletteGeneratorBlocStateInterface{
  PaletteGenerator? palette;

  PaletteGeneratorBlocStateInterface({
    required this.palette,
  });
}