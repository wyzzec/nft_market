import 'dart:async';
import 'package:nft_market/bloc/pallete_generator_bloc/palette_generator_bloc_events/palette_generator_bloc_event_interface.dart';
import 'package:nft_market/bloc/pallete_generator_bloc/palette_generator_bloc_events/palette_generator_bloc_event_load_palette.dart';
import 'package:nft_market/bloc/pallete_generator_bloc/palette_generator_bloc_states/palette_generator_bloc_state_error.dart';
import 'package:nft_market/bloc/pallete_generator_bloc/palette_generator_bloc_states/palette_generator_bloc_state_initial.dart';
import 'package:nft_market/bloc/pallete_generator_bloc/palette_generator_bloc_states/palette_generator_bloc_state_interface.dart';
import 'package:nft_market/bloc/pallete_generator_bloc/palette_generator_bloc_states/palette_generator_bloc_state_loaded.dart';
import 'package:nft_market/controllers/palette_generator_controller.dart';
import 'package:palette_generator/palette_generator.dart';

class PaletteGeneratorBloc {
   PaletteGeneratorBloc(){
      _inputPaletteController.stream.listen(_mapEventToState);
   }

   PaletteGeneratorController paletteGeneratorController = PaletteGeneratorController();

   final StreamController<PaletteGeneratorBlocEventInterface> _inputPaletteController = StreamController<PaletteGeneratorBlocEventInterface>();
   final StreamController<PaletteGeneratorBlocStateInterface> _outputPaletteController = StreamController<PaletteGeneratorBlocStateInterface>();

   Sink<PaletteGeneratorBlocEventInterface> get inputPalette => _inputPaletteController.sink;
   Stream<PaletteGeneratorBlocStateInterface> get outputPalette => _outputPaletteController.stream;

   _mapEventToState (PaletteGeneratorBlocEventInterface event)async{
      _outputPaletteController.add(PaletteGeneratorBlocStateInitial());
      PaletteGenerator? paletteGenerator;
      if (event is PaletteGeneratorBlocEventLoadPalette) {
         try {
            await paletteGeneratorController.generatePalette(event.imageUrl).then((value) => paletteGenerator = value);
                _outputPaletteController.add(PaletteGeneratorBlocStateLoaded(palette: paletteGenerator));

         }catch(message){
            _outputPaletteController.add(PaletteGeneratorBlocStateError(message.toString()));
         }

      }
   }
}
