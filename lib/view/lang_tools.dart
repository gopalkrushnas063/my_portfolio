import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class LanguagesAndTools extends StatelessWidget {
  LanguagesAndTools({Key? key}) : super(key: key);

  final _controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          debugPrint("Loading: $progress%");
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse("https://techstackgitstats.netlify.app/"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: WebViewWidget(
            controller: _controller,
          ),
        ),
      ),
    );
  }
}