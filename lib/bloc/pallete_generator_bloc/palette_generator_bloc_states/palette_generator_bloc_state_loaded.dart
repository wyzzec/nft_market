
import 'package:nft_market/bloc/pallete_generator_bloc/palette_generator_bloc_states/palette_generator_bloc_state_interface.dart';
import 'package:palette_generator/palette_generator.dart';

class PaletteGeneratorBlocStateLoaded extends PaletteGeneratorBlocStateInterface{
  PaletteGeneratorBlocStateLoaded({required PaletteGenerator? palette}) : super(palette: palette);

}