// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:breaking/constants/my_colors.dart';
import 'package:flutter/material.dart';

import 'package:breaking/Data/models/characters.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Character character;
  const CharacterDetailsScreen({
    Key? key,
    required this.character,
  }) : super(key: key);
  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myGray,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          character.charName.toString(),
          style: const TextStyle(color: MyColors.myYellow),
        ),
        background: Hero(
            tag: character.charId.toString(),
            child: Image.network(
              character.charImg.toString(),
              fit: BoxFit.cover,
            )),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(
              color: MyColors.myWhite,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              color: MyColors.myWhite,
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }

  Widget buildDevider(double endIndent) {
    return Divider(
      height: 35,
      endIndent: endIndent,
      color: MyColors.myYellow,
      thickness: 2,
    );
  }

  Widget animatedText() {
    return SizedBox(
      width: 250.0,
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
        ),
        child: AnimatedTextKit(
          animatedTexts: [
            FadeAnimatedText(character.charName.toString()),
            // FadeAnimatedText(character.charGender.toString()),
            // FadeAnimatedText('do it RIGHT NOW!!!'),
          ],
          onTap: () {
            print("Tap Event");
          },
        ),
      ),
    );
  }

  Widget fluckerText(value) {
    return SizedBox(
      width: 250.0,
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 35,
          color: Colors.white,
          shadows: [
            Shadow(
              blurRadius: 7.0,
              color: Colors.white,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: AnimatedTextKit(
          repeatForever: true,
          animatedTexts: [
            FlickerAnimatedText(value),
            // FlickerAnimatedText('Night Vibes On'),
            // FlickerAnimatedText("C'est La Vie !"),
          ],
          onTap: () {
            print("Tap Event");
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGray,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  characterInfo(
                      'Character Full Name  : ', character.charName.toString()),
                  buildDevider(200),
                  characterInfo(
                      'Character Created : ', character.charCreated.toString()),
                  buildDevider(220),
                  characterInfo(
                      'Character Gender : ', character.charGender.toString()),
                  buildDevider(220),
                  characterInfo('Character Location Name : ',
                      character.charLocation!.name.toString()),
                  buildDevider(150),
                  characterInfo('Character Location url : ',
                      character.charLocation!.url.toString()),
                  buildDevider(180),
                  characterInfo(
                      'Character Species : ', character.charSpecies.toString()),
                  buildDevider(220),
                  characterInfo(
                      'Character Status : ', character.charStatus.toString()),
                  buildDevider(220),
                  characterInfo('Character Origin Name : ',
                      character.charOrigin!.name.toString()),
                  buildDevider(180),
                  characterInfo('Character Origin url : ',
                      character.charOrigin!.url.toString()),
                  buildDevider(200),
                  const SizedBox(
                    height: 20,
                  ),
                  fluckerText(character.charName),
                  //animatedText(),
                ],
              ),
            ),
            const SizedBox(
              height: 500,
            ),
          ]))
        ],
      ),
    );
  }
}
