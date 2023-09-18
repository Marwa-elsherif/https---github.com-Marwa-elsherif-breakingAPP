// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:breaking/Data/models/characters.dart';
import 'package:breaking/Data/repository/characters_repository.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  List<Character> characters = [];

  CharactersCubit(this.charactersRepository) : super(CharactersInitial());
  List<Character> getAllCharacters() {
    charactersRepository.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters: characters));
      print(characters);
    });
    return characters;
  }
}
