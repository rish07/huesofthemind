import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final String apiUrl =
      "https://graph.instagram.com/me/media?fields=caption,permalink,media_url&access_token=${DotEnv().env['ACCESS_TOKEN']}";

  Future fetchPosts() async {
    print('working=============================');
    var result = await http.get(
      apiUrl,
    );

    print(json.decode(result.body)['data'][0]);
    return json.decode(result.body);
  }

  @override
  void initState() {
    //fetchPosts();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
