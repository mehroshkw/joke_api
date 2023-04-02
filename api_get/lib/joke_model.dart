import 'dart:convert';

Jokemodel jokemodelFromJson(String str) => Jokemodel.fromJson(json.decode(str));

String jokemodelToJson(Jokemodel data) => json.encode(data.toJson());

class Jokemodel {
    Jokemodel({
        this.error,
        this.category,
        this.type,
        this.setup,
        this.delivery,
        this.flags,
        this.id,
        this.safe,
        this.lang,
    });

    bool? error;
    String? category;
    String? type;
    String? setup;
    String? delivery;
    Flags? flags;
    int? id;
    bool? safe;
    String? lang;

    factory Jokemodel.fromJson(Map<String, dynamic> json) => Jokemodel(
        error: json["error"],
        category: json["category"],
        type: json["type"],
        setup: json["setup"],
        delivery: json["delivery"],
        flags: Flags.fromJson(json["flags"]),
        id: json["id"],
        safe: json["safe"],
        lang: json["lang"],
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "category": category,
        "type": type,
        "setup": setup,
        "delivery": delivery,
        "flags": flags!.toJson(),
        "id": id,
        "safe": safe,
        "lang": lang,
    };
}

class Flags {
    Flags({
        this.nsfw,
        this.religious,
        this.political,
        this.racist,
        this.sexist,
        this.explicit,
    });

    bool? nsfw;
    bool? religious;
    bool? political;
    bool? racist;
    bool? sexist;
    bool? explicit;

    factory Flags.fromJson(Map<String, dynamic> json) => Flags(
        nsfw: json["nsfw"],
        religious: json["religious"],
        political: json["political"],
        racist: json["racist"],
        sexist: json["sexist"],
        explicit: json["explicit"],
    );

    Map<String, dynamic> toJson() => {
        "nsfw": nsfw,
        "religious": religious,
        "political": political,
        "racist": racist,
        "sexist": sexist,
        "explicit": explicit,
    };
}
