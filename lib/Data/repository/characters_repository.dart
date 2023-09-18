// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:breaking/Data/models/characters.dart';
import 'package:breaking/Data/web_services/characters_web_services.dart';

class CharactersRepository {
  CharactersWebServices? charactersWebServices;

  CharactersRepository(CharactersWebServices charactersWebServices);
  Future<List<Character>> getAllCharacters() async {
    final characters = await charactersWebServices!.getAllCharacters();
    print(characters.toString());
    return characters
        .map((character) => Character.fromJason(character))
        .toList();
  }
}
