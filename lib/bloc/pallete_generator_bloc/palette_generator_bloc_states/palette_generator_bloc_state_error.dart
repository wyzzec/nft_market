import 'package:nft_market/bloc/pallete_generator_bloc/palette_generator_bloc_states/palette_generator_bloc_state_interface.dart';

class PaletteGeneratorBlocStateError extends PaletteGeneratorBlocStateInterface{
  PaletteGeneratorBlocStateError(this.message) : super(palette: null);
  String message;
}