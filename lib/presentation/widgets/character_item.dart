// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:breaking/constants/my_colors.dart';
import 'package:flutter/material.dart';

import 'package:breaking/Data/models/characters.dart';

class CharacterItem extends StatelessWidget {
  final Character character;
  const CharacterItem({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: MyColors.myWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: GridTile(
        footer: Container(
          width: double.infinity,
          // ignore: prefer_const_constructors
          padding: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          color: Colors.black,
          alignment: Alignment.bottomCenter,
          child: Text(
            "${character.charName}",
            // ignore: prefer_const_constructors
            style: TextStyle(
              height: 1.3,
              fontSize: 16,
              color: MyColors.myWhite,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
        child: Container(
          color: MyColors.myGray,
          child: character.charImg!.isNotEmpty
              ? FadeInImage.assetNetwork(
                  width: double.infinity,
                  height: double.infinity,
                  placeholder: "assets/images/loading.gif",
                  image: "${character.charImg}",
                  fit: BoxFit.cover,
                )
              : Image.asset("assets/images/placeholder.jpg"),
        ),
      ),
    );
  }
}
