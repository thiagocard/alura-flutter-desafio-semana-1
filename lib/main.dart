import 'package:flutter/material.dart';
import 'package:flutter_app/screens/meme_detail.dart';

import 'screens/meme_selection.dart';

void main() => runApp(MemeApp());

const _buttonDescription = 'Começar a usar';
const _appDescription = 'Saber como você está hoje é fundamental para organizar o trabalho com o time e garantir o aprendizado em equipe';
const _title = 'Descobrir como você está hoje nunca foi tão fácil!';

class MemeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        MemeSelectionScreen.routeName: (context) => MemeSelectionScreen(),
      },
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == MemeDetailScreen.routeName) {
          final args = settings.arguments as MemeDetailScreenArgs;
          return MaterialPageRoute(builder: (context) {
            return MemeDetailScreen(args.meme);
          });
        }
        return null;
      },
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TopImage(),
              Title(),
              Description(),
              StartUsingButton()
            ],
          ),
        ),
      ),
    );
  }
}

class StartUsingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              MemeSelectionScreen.routeName,
            );
          },
          child: Text(_buttonDescription.toUpperCase()),
        ),
      ),
    );
  }
}

class Description extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 32.0),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Text(_appDescription)),
    );
  }
}

class Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 64.0, horizontal: 16.0),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            _title,
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'GameOfThrones'),
          )),
    );
  }
}

class TopImage extends StatelessWidget {
  const TopImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) {
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.black, Colors.transparent],
        ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
      },
      blendMode: BlendMode.dstIn,
      child: Image.network(
        'https://www.themoviedb.org/t/p/w780/wXSnajAZ5ppTKa8Z5zzWGOK85YH.jpg',
        fit: BoxFit.contain,
      ),
    );
  }
}
