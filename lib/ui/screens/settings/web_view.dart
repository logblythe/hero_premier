import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebviewPage extends StatefulWidget {
  final List<String> args;


  WebviewPage(this.args);

  @override
  _WebviewPageState createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75.0,
        title: Text(
          widget.args[1],
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        child: WebviewScaffold(
          url: widget.args[0],
          withLocalStorage: true,
          withJavascript: true,
        ),
      ),
    );
  }
}
