import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  String data = 'secret data';
  String data2 = 'test2';
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      create: (context) => Data(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
            appBar: AppBar(title: MyText()),
            body: Level1(),
          ),
        ),
      ),
    );
  }
}

class MyText extends StatelessWidget {
  const MyText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      Provider.of<Data>(context, listen: false).data,
    );
  }
}

class Level1 extends StatelessWidget {
  const Level1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Level2();
  }
}

class Level2 extends StatelessWidget {
  const Level2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: (value) {
            Provider.of<Data>(context, listen: false).changeText(value);
          },
        ),
        Level3(),
      ],
    );
  }
}

class Level3 extends StatelessWidget {
  const Level3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      Provider.of<Data>(context).data,
      style: const TextStyle(fontSize: 20),
    );
  }
}

// ChangeNotifier from flutter
class Data extends ChangeNotifier {
  String data = 'my data';

  void changeText(String text) {
    data = text;
    notifyListeners();
  }
}
