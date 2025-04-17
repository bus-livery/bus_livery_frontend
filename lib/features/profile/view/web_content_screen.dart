import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

enum WebContentType { privacyPolicy, termsAndConditions }

@RoutePage()
class WebContentScreen extends StatefulWidget {
  final WebContentType contentType;

  const WebContentScreen({super.key, required this.contentType});

  @override
  State<WebContentScreen> createState() => _WebContentScreenState();
}

class _WebContentScreenState extends State<WebContentScreen> {
  late WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    // Get the appropriate URL based on the content type
    final String url =
        widget.contentType == WebContentType.privacyPolicy
            ? 'https://docs.google.com/document/d/11L3qItY4r6aMmqpkahUWiTOPKgCR8CBIj1upBXkCbrg/edit?usp=sharing'
            : 'https://docs.google.com/document/d/12tx8BxqTv1-_FasaK4pbifae9kZIBxTbWqtYluQWkhY/edit?usp=sharing';

    // Initialize the WebViewController
    _controller =
        WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setNavigationDelegate(
            NavigationDelegate(
              onPageStarted: (String url) {
                setState(() {
                  _isLoading = true;
                });
              },
              onPageFinished: (String url) {
                setState(() {
                  _isLoading = false;
                });
              },
              onWebResourceError: (WebResourceError error) {
                debugPrint('WebView error: ${error.description}');
              },
            ),
          )
          ..loadRequest(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.contentType == WebContentType.privacyPolicy
              ? 'Privacy Policy'
              : 'Terms & Conditions',
        ),
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (_isLoading) const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
