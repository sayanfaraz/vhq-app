import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  // const HomePage({super.key, required this.title});

  const HomePage({super.key});
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  // final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;


  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text("Practice Sessions",
            style:
                TextStyle(color: Theme.of(context).colorScheme.primary)),
      ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                // height: 400,
                child: CardDisplay()
              ),
            ],
          ),
        )
    );
  }
}

class CardDisplay extends StatelessWidget {
  static const cards = [
    "2023-10-28",
    "2023-10-27",
    "2023-10-26",
    "2023-10-25",
    "2023-10-24",
    "2023-10-23",
    "2023-10-22",
    "2023-10-22",
    "2023-10-20",
    "2023-10-19"
  ];

  const CardDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        scrollDirection: Axis.vertical,
        children: cards.map((cardText) => Card(
          child: SizedBox(
            width: 300,
            height: 100,
            child: Center(child: Text(cardText))
          )
        )).toList()
      )
    );
  }
}