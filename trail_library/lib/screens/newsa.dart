import 'package:flutter/material.dart';
import 'datamodel.dart';
import 'dart:convert';
import 'package:http/http.dart' show Client;

class NewsA extends StatefulWidget {
  const NewsA({super.key});

  @override
  State<NewsA> createState() => _NewsAState();
}

class _NewsAState extends State<NewsA> {
  final Uri _newsUrl = Uri.parse(
      "https://newsapi.org/v2/everything?q=tesla&from=2023-06-05&sortBy=publishedAt&apiKey=9df2c0636e734213b989ad88fb29c354");

  List<NewsData> galleryData = [];
  Client client = Client();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchDBData();
  }

  Future fetchDBData() async {
    try {
      final response = await client.get(_newsUrl);
      if (response.statusCode == 200) {
        print(response.statusCode);
        Iterable it = jsonDecode(response.body)["articles"];
        setState(() {
          galleryData = it.map((i) => NewsData.fromJson(i)).toList();
        });
      }
    } catch (_) {
      return await serverFailed;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('NewsA'),
        ),
        body: ListView.builder(
            itemCount: galleryData.length,
            itemBuilder: (context, index) =>
                _bulidListItem(context, galleryData[index])));
  }

  Widget _bulidListItem(context, NewsData data) {
    return Column(
      children: <Widget>[
        Text(data.title!),
        Text(data.description!),
        SizedBox(height: 2,)
        // Image.network(
        //   data.urlToImage!,
        //   width: 300,
        //   height: 200,
        // )
      ],
    );
  }
}



 