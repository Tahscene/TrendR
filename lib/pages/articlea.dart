import 'package:flutter/material.dart';
import 'package:newsapp/pages/admin_home.dart';
import 'package:newsapp/pages/home.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleViewa extends StatefulWidget {
  String blogUrl;
  ArticleViewa({required this.blogUrl});

  @override
  State<ArticleViewa> createState() => _ArticleViewaState();
}

class _ArticleViewaState extends State<ArticleViewa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AdminHome()));
            },
            icon: Icon(Icons.arrow_back_ios, size: 20),
          ),
          title: Row(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text("Trend"),
              //Text(
              //"R",
              // style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),
              // )
            ],
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Container(
          child: WebView(
            initialUrl:widget.blogUrl ,
            javascriptMode: JavascriptMode.unrestricted,
          ),
        ));
  }
}