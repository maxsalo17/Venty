abstract class DescriptionBase {
  String text;
  DescriptionBase({this.text});
  Map<String, dynamic> toMap() {
    return {"type": "base", "text": text};
  }

  DescriptionBase.fromMap(Map<String, dynamic> map) {
    this.text = map['text'];
  }

  @override
  String toString() {
    // TODO: implement toString
    return "Response";
  }
}

class TextDescription extends DescriptionBase {
  String text;

  TextDescription({this.text}) : super();
  @override
  Map<String, dynamic> toMap() {
    return {
      "type": "text",
      "text": this.text,
    };
  }

  TextDescription.fromMap(Map<String, dynamic> map) {
    this.text = map['text'];
  }

  @override
  String toString() {
    return "Text Response $text";
  }
}

class TextTitledDescription extends DescriptionBase {
  String text;
  String title;
  TextTitledDescription({this.text, this.title}) : super();
  @override
  Map<String, dynamic> toMap() {
    return {
      "type": "texttitled",
      "title": this.title,
      "text": this.text,
    };
  }

  TextTitledDescription.fromMap(Map<String, dynamic> map) {
    this.text = map['text'];
    this.title = map['title'];
  }

  @override
  String toString() {
    return "Text Titled Response $text $title";
  }
}

class TextEnumTitledDescription extends DescriptionBase {
  List<String> texts;
  String title;
  TextEnumTitledDescription({this.texts, this.title}) : super();
  @override
  Map<String, dynamic> toMap() {
    return {
      "type": "textenumtitled",
      "title": this.title,
      "texts": [...this.texts],
    };
  }

  TextEnumTitledDescription.fromMap(Map<String, dynamic> map) {
    this.texts = map['texts'];
    this.title = map['title'];
  }

  @override
  String toString() {
    return "Text Enum Titled Response";
  }
}

class YoutubeDescription extends DescriptionBase {
  String youtubeLink;
  YoutubeDescription({this.youtubeLink}) : super();
  @override
  Map<String, dynamic> toMap() {
    return {
      "type": "youtube",
      "link": this.youtubeLink,
    };
  }

  YoutubeDescription.fromMap(Map<String, dynamic> map) {
    this.youtubeLink = map['link'];
  }

  @override
  String toString() {
    return "Youtube Response";
  }
}
