class Character {
  int? charId;
  String? charName;
  String? charImg;
  String? charGender;
  String? charStatus;
  String? charSpecies;
  String? charType;
  String? charUrl;
  String? charCreated;
  Origin? charOrigin;
  Origin? charLocation;

  Character.fromJason(Map<String, dynamic> json) {
    charId = json['id'];
    charName = json['name'];
    charImg = json['image'];
    charGender = json['gender'];
    charStatus = json['status'];
    charSpecies = json['species'];
    charUrl = json['url'];
    charCreated = json['created'];
    charOrigin =
        json['origin'] != null ? Origin.fromJson(json['origin']) : null;
    charLocation =
        json['location'] != null ? Origin.fromJson(json['location']) : null;
  }
}

class Origin {
  String? name;
  String? url;

  Origin({this.name, this.url});

  Origin.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }
}
