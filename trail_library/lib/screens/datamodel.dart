class NewsData {
  final String? author;
  final String? title;
  final String? description;
  final String? urlToImage;

  const NewsData({this.author, this.title, this.description, this.urlToImage});

  factory NewsData.fromJson(Map<String, dynamic> json) {
    return NewsData(
        author: json['author'],
        title: json['title'],
        description: json['description'],
        urlToImage: json['urlToImage']);
  }
}

class Data {
  final String? image;
  final String? title;
  final String? text;

  const Data({this.image, this.title, this.text});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(image: json['image'], title: json['title'], text: json['text']);
  }
  Map<String, dynamic> toJson() =>
      {"image": image, "title": title, "text": text};
}

class FBData {
  final String? full_picture;
  final String? id;
  final String? message;

  const FBData({this.full_picture, this.id, this.message});

  factory FBData.fromJson(Map<String, dynamic> json) {
    return FBData(
        full_picture: json['full_picture'],
        message: json['message'],
        id: json['id']);
  }
}

List<Data> serverFailed = [Data(image: "", title: "", text: "")];
