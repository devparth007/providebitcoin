import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewExample extends StatefulWidget {
  const WebViewExample({Key? key}) : super(key: key);

  @override
  State<WebViewExample> createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  String exampleHtml = '''
  <!DOCTYPE HTML>
  <html lang ="en">
  <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
  </head>

  <body>
         <button style="margin-top:60px"  >Click me</button>
  </body>
  </html>       
   ''';

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: 'about:blank',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) async {
          final String contentBase64 =
              base64Encode(const Utf8Encoder().convert(exampleHtml));
          await webViewController
              .loadUrl('data:text/html;base64,$contentBase64');
          //       await rootBundle.loadString('assets/index.html');
          //   _webViewController?.loadUrl(Uri.dataFromString(fileContent,
          //           mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
          //       .toString());
        },
        // javascriptChannels: <JavascriptChannel>{
        //   JavascriptChannel(
        //     name: 'messageHandler',
        //     onMessageReceived: (JavascriptMessage message) {
        //       print("message from the web view=\"${message.message}\"");
        //     },
        //   ),
        // },
      ),
    );
  }
}
