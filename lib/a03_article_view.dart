
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class A03_ArticleView extends StatefulWidget {

  final String? blogUrl;

  const A03_ArticleView({Key? key, this.blogUrl}) : super(key: key);

  @override
  State<A03_ArticleView> createState() => _A03_ArticleViewState();
}

class _A03_ArticleViewState extends State<A03_ArticleView> {

  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse(widget.blogUrl!),
      );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Current', style: TextStyle(color: Colors.black),),
            Text('News', style: TextStyle(color: Colors.blue),),
          ],
        ),
        actions: [
          Opacity(
            opacity: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Icon(Icons.save),
            ),
          )
        ],
      ),

      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebViewWidget(
          controller: controller,
        ),
      )
    );
  }
}
