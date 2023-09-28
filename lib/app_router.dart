// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:breaking/Data/models/characters.dart';
import 'package:breaking/Data/repository/characters_repository.dart';
import 'package:breaking/Data/web_services/characters_web_services.dart';
import 'package:flutter/material.dart';
import 'package:breaking/business_logic/cubit/characters_cubit.dart';
import 'package:breaking/constants/strings.dart';
import 'package:breaking/presentation/screens/character_details.dart';
import 'package:breaking/presentation/screens/characters_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;
  AppRouter() {
    charactersRepository = CharactersRepository(CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => charactersCubit,
            child: CharactersScreen(),
          ),
        );
      case characterDetailsScreen:
        final character = settings.arguments as Character;
        return MaterialPageRoute(
            builder: (_) => CharacterDetailsScreen(character: character));
    }
  }
}
