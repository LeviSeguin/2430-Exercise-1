import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Levi's Nike Shop",
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
        ),
      ),
      home: ShoeList(),
    );
  }
}

class ShoeList extends StatefulWidget {
  const ShoeList({Key? key}) : super(key: key);

  @override
  State<ShoeList> createState() => _ShoeListState();
}

class _ShoeListState extends State<ShoeList> {

  List<String> items = [
    "Air Force 1",
    "Air Max 1",
    "Nike Cortez",
    "Air Jordan 3",
    "Nike Air Max 90",
    "Nike Air Mag",
    "Nike Blazer",
    "Nike Air Max 97",
    "Nike Flyknit Racer",
    "Nike Dunk SB",
    "Nike Zoom Spiridon",
    "Nike Air Stab",
    "Nike Kobe 4",
    "Nike Pegasus",
    "Nike Max",
    "Nike Fresh"
  ];

  List<int> prices = [
    100,
    200,
    140,
    60,
    220,
    400,
    100,
    120,
    60,
    50,
    250,
    130,
    140,
    300,
    120,
    350
  ];

  List<String> saved = [];
  int total = 0;

  void _pushCart() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Your Cart Total: $total'),
            ),
            body: ListView.builder(
                itemCount: saved.length * 2,
                itemBuilder: (context, i) {
                  int index = i ~/ 2;

                  if (i.isOdd) return const Divider();

                  return ListTile(
                    title: Text(saved[index]),
                  );
                }),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Levi's Nike Shop"),
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: _pushCart,
              tooltip: 'View Cart',
            ),
          ],
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(20.0),
          itemCount: items.length * 2,
          itemBuilder: (context, i) {
            int index = i ~/ 2;

            if (i.isOdd) return const Divider();

            final alreadySaved = saved.contains(items[index]);

            return ListTile(
                title: Text(items[index] + " - \$" + prices[index].toString()),
                trailing: Icon(
                  alreadySaved ? Icons.check : Icons.add_shopping_cart,
                  color: alreadySaved ? Colors.red : null,
                  semanticLabel: alreadySaved ? 'Remove from saved' : 'Save',
                ),
                onTap: () {
                  setState(() {
                    if (alreadySaved) {
                      saved.remove(items[index]);
                      total -= prices[index];
                    } else {
                      saved.add(items[index]);
                      total += prices[index];
                    }
                  });
                });
          },
        ));
  }
}



