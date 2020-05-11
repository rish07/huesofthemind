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
      "https://instagram9.p.rapidapi.com/api/instagram?kullaniciadi=huesofthemind&lang=en";

  Future fetchPosts() async {
    print('working=============================');
    var result = await http.get(
      apiUrl,
      headers: {
        'x-rapidapi-host': DotEnv().env['API_HOST'],
        'x-rapidapi-key': DotEnv().env['API_KEY'],
      },
    );

    print(json.decode(result.body)['posts'][0]);
    return json.decode(result.body);
  }

  @override
  void initState() {
    fetchPosts();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
