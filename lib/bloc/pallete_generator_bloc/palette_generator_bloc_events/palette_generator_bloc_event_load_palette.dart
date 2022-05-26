import 'package:nft_market/bloc/pallete_generator_bloc/palette_generator_bloc_events/palette_generator_bloc_event_interface.dart';

class PaletteGeneratorBlocEventLoadPalette extends PaletteGeneratorBlocEventInterface{
  PaletteGeneratorBlocEventLoadPalette({required String imageUrl}) : super(imageUrl: imageUrl);

}