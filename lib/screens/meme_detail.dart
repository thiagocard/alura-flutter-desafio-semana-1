import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/text_with_stroke.dart';

import '../models/meme.dart';

class MemeDetailScreenArgs {
  final Meme meme;

  MemeDetailScreenArgs(this.meme);
}

class MemeDetailScreen extends StatelessWidget {
  final Meme _meme;

  MemeDetailScreen(this._meme);

  static const routeName = '/meme-detail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_meme.name), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MemeDetail(_meme),
            TryAgain()
          ],
        ),
      ),
    );
  }
}

class TryAgain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Container(
            width: double.infinity,
            child: Text(
              'Tentar de novo'.toUpperCase(),
              textAlign: TextAlign.center,
            )),
      ),
    );
  }
}

class MemeDetail extends StatelessWidget {

  final Meme _meme;

  MemeDetail(this._meme);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Image.network(
            _meme.image,
            height: 500,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Positioned.fill(
            bottom: 20.0,
            child: Align(
                alignment: Alignment.bottomCenter,
                child: TextWithStroke(_meme.text)),
          ),
        ],
      ),
    );
  }
}
