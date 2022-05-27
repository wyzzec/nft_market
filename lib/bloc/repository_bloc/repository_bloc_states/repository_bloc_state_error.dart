
import 'package:nft_market/bloc/repository_bloc/repository_bloc_states/repository_bloc_state_interface.dart';

class RepositoryBlocStateError extends RepositoryBlocStateInterface{
  RepositoryBlocStateError({required this.message}) : super(apiInitialObject: []);
  String message;
}