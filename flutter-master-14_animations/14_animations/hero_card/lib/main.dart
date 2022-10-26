import 'package:flutter/material.dart';
import 'package:hero_card/space.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeView(title: 'Animations'),
    );
  }
}

class HomeView extends StatefulWidget {
  HomeView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text(widget.title),
      ),
      body: GridView.count(
          crossAxisCount: 1,
          children: spaces
              .map((space) => GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailView(data: space),
                      ));
                    },
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Hero(
                                tag: space.id,
                                child: Card(
                                  child: Container(
                                    height: 220,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(space.image))),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5.0, right: 5.0, top: 100.0),
                                    ),
                                  ),
                                  margin: EdgeInsets.only(
                                      left: 5.0, right: 5.0, top: 5.0),
                                )),
                            Positioned(
                              bottom: 80,
                              right: 10,
                              child: Hero(
                                tag: '${space.id}--button',
                                child: Container(
                                    padding: EdgeInsets.all(10),
                                    color: Colors.yellow,
                                    child: Icon(Icons.add)),
                              ),
                            ),
                          ],
                        ),
                        Hero(
                          tag: '${space.id}--title',
                          child: Material(child: Text(space.description)),
                        ),
                      ],
                    ),
                  ))
              .toList()),
    );
  }
}

class DetailView extends StatelessWidget {
  const DetailView({Key key, this.data}) : super(key: key);
  final Space data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(
            children: [
              Hero(tag: data.id, child: Image.asset(data.image)),
              Positioned(
                bottom: 0,
                right: 0,
                child: Hero(
                  tag: '${data.id}--button',
                  child: Container(
                      padding: EdgeInsets.all(10),
                      color: Colors.yellow,
                      child: Icon(Icons.add)),
                ),
              ),
            ],
          ),
          Hero(
            tag: '${data.id}--title',
            child: Material(child: Text(data.description)),
          ),
        ]),
      ),
    );
  }
}
