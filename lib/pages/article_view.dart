import 'package:flutter/material.dart';
import 'package:newsapp/pages/home.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
String blogUrl;
ArticleView({required this.blogUrl});

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         leading: IconButton(
           onPressed: () {
             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
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