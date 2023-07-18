import 'package:flutter/material.dart';
import 'datamodel.dart';
import 'dart:convert';
import 'package:http/http.dart' show Client;

class Gallery extends StatefulWidget {
  const Gallery({super.key});

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  final Uri _fbUrl = Uri.parse(
      "https://graph.facebook.com/v17.0/me?fields=id%2Cname%2Cposts%7Bmessage%2Cfull_picture%2Cdynamic_posts%7D&access_token=EABbWTiFo98kBAOKM0ZAoyRPswnegn7zjGvGQ2PzWuhcZCZB7cb5esIxLq0ABRJBUvZAIPYdUCtKMuisJ6Lcs09kyg5k5aF3KQvPZBKOg7W3q8lOQxnJfLPDqW8jItmiOcqbktYVzcJel2VV6mr3XPrZBVSt7owbZCFzPlbwGSi1bqZB06RZBWrAnlXdqaSxNjswyVNkvfB6sEYwZDZD");
  List<FBData> galleryData = [];
  Client client = Client();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchDBData();
  }

  Future fetchDBData() async {
    try {
      final response = await client.get(_fbUrl);
      if (response.statusCode == 200) {
        print(response.statusCode);
        Iterable it = jsonDecode(response.body)["posts"]["data"];
        setState(() {
          galleryData = it.map((i) => FBData.fromJson(i)).toList();
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
          title: Text('Gallery'),
        ),
        body: ListView.builder(
            itemCount: galleryData.length,
            itemBuilder: (context, index) =>
                _bulidListItem(context, galleryData[index])));
  }

  Widget _bulidListItem(context, FBData data) {
    var message = data.message == null ? "" : data.message;
    
    //String message = data.message == null ? " " : data.message;
    return Column(
      children: <Widget>[
        Text(message!),
        //Text(data.id!),
        SizedBox(
          height: 2,
        )
        // Image.network(
        //   data.full_picture!,
        //   width: 300,
        //   height: 200,
        // )
      ],
    );
  }
}
