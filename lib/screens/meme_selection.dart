import 'package:flutter/material.dart';
import 'package:flutter_app/screens/meme_detail.dart';
import 'package:flutter_app/components/text_with_stroke.dart';

import '../data/meme_data.dart';
import '../models/meme.dart';

const _columns = 2;
const _columnInternalPadding = 8.0;
const _screenTitle = 'Meme Simulator';
const _screenSubtitle = 'De 1 até 9, como você se sente hoje?';

class MemeSelectionScreen extends StatelessWidget {
  static const routeName = '/meme-selection';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text(_screenTitle), centerTitle: true),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[Question(), ListOfMemes()],
        ),
      ),
    );
  }
}

class ListOfMemes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      mainAxisSpacing: _columnInternalPadding,
      crossAxisSpacing: _columnInternalPadding,
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      crossAxisCount: _columns,
      children: List.generate(9, (index) => renderMemeItem(context, index)),
    );
  }
}

class Question extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(child: Text(_screenSubtitle)),
    );
  }
}

renderMemeItem(BuildContext context, int index) {
  return MemeItem(index);
}

class MemeItem extends StatelessWidget {
  final int _index;

  MemeItem(this._index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigateToDetail(context, memeArray[_index]),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              memeArray[_index].image,
              fit: BoxFit.cover,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                    child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes
                            : null));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: TextWithStroke((_index + 1).toString()),
            ),
          )
        ],
      ),
    );
  }
}

navigateToDetail(BuildContext context, Meme meme) {
  Navigator.pushNamed(context, MemeDetailScreen.routeName,
      arguments: MemeDetailScreenArgs(meme));
}
