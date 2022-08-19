import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticlePage extends StatefulWidget {
  final String? urlToPage;
  const ArticlePage({Key? key, required this.urlToPage}) : super(key: key);

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  late WebViewController _webViewController;
  bool isLoading = true;
  final _key = UniqueKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
      ),
      body: Stack(
        children: [
          WebView(
            key: _key,
            initialUrl: widget.urlToPage,
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (finish) {
              setState(() {
                isLoading = false;
              });
              _webViewController.runJavascript(
                  "document.getElementsByTagName('header')[0].style.display='none'");
              _webViewController.runJavascript(
                  "document.getElementsByTagName('footer')[0].style.display='none'");
            },
            gestureNavigationEnabled: true,
          ),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(),
        ],
      ),
    );
  }
}
