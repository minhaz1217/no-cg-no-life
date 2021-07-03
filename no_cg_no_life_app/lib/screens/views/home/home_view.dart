import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Container(
          child: Text("Hello World")
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var _url = "https://flutter.dev";
          await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
        },
      ),
    );
  }
}
