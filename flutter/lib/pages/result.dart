import 'package:flutter/material.dart';

class MealResult {
  String? name;
  String? text;
  double? price;
  String? imageFileName;

  MealResult({this.name, this.text, this.price, this.imageFileName});
}

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String title = "Init Title";
  String text = "Init Text";
  String imageFileName = "Init File";
  double price = 12.34;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: const ResultTopBar(),
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: ResultTitle(
                  title: title,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: ResultImage(
                  fileName: imageFileName,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: ResultDescription(
                  price: price,
                  text: text,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: Center(
                  child: ElevatedButton(
                    child: const Text("Change"),
                    onPressed: () {
                      changeImage();
                      changeTitle();
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void changeTitle() {
    setState(() {
      title = "Changed Title";
    });
  }

  void changeImage() {
    setState(() {
      imageFileName = "Changed Image";
    });
  }

  void changeDescription() {
    setState(() {
      imageFileName = "Changed Image";
    });
  }
}

class ResultTopBar extends StatelessWidget {
  const ResultTopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const <Widget>[
          Icon(
            Icons.favorite,
          ),
          Icon(
            Icons.alarm,
          ),
        ],
      ),
    );
  }
}

class ResultTitle extends StatelessWidget {
  final String title;

  const ResultTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Center(
        child: Text(title),
      ),
    );
  }
}

class ResultImage extends StatelessWidget {
  final String fileName;

  const ResultImage({
    Key? key,
    required this.fileName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Center(
        child: Text(fileName),
      ),
    );
  }
}

class ResultDescription extends StatefulWidget {
  final String text;
  final double price;

  const ResultDescription({
    Key? key,
    required this.text,
    required this.price,
  }) : super(key: key);

  @override
  _ResultDescriptionState createState() => _ResultDescriptionState();
}

class _ResultDescriptionState extends State<ResultDescription> {
  String priceString = "";

  @override
  void initState() {
    priceString = "€" + widget.price.toString();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Column(
        children: [
          Center(
            child: Text(widget.text),
          ),
          Center(
            child: Text(priceString),
          ),
        ],
      ),
    );
  }
}
