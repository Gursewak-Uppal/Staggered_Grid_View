import 'package:flutter/material.dart';
import 'package:staggered_grid_view/full_screen_image_view.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new MyHomePage(title: 'Flutter Demo Staggered Grid'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> imagesList = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imagesList.add(
        'https://upload.wikimedia.org/wikipedia/commons/b/b8/Pisgah_Home_Historic_District%2C_Highland_Park.JPG');
    imagesList.add(
        'https://cdn.pixabay.com/photo/2013/07/12/15/55/cricket-150561_960_720.png');
    imagesList.add(
        'https://cdn.pixabay.com/photo/2017/06/16/15/58/luxury-home-2409518_960_720.jpg');
    imagesList.add(
        'https://cdn12.picryl.com/photo/2016/12/31/classic-car-muscle-car-old-car-transportation-traffic-8d1a76-1024.jpg');
    imagesList.add(
        'https://media-cdn.tripadvisor.com/media/photo-s/0a/12/dc/49/neta-ji-birthplace.jpg');
    imagesList
        .add('https://c1.staticflickr.com/8/7137/6918018132_5e183ee330_b.jpg');
    imagesList
        .add('https://c1.staticflickr.com/1/576/23241134729_95298eee3f_b.jpg');
    imagesList.add(
        'https://cdn.pixabay.com/photo/2017/12/31/09/21/furniture-3051845_960_720.jpg');
    imagesList.add(
        'https://upload.wikimedia.org/wikipedia/commons/4/4f/Wiffle_bat_and_ball.jpg');
    imagesList.add(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-z8tFEhmsDpQtKAlk-uoV8ouoEY4Ll_pMZH-FDVspgY0VofY9ow');
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: imagesList != null
          ? new StaggeredGridView.countBuilder(
              padding: const EdgeInsets.all(8.0),
              crossAxisCount: 4,
              itemCount: imagesList.length,
              itemBuilder: (context, j) {
                String imgPath = imagesList[j];
                return new Material(
                  elevation: 8.0,
                  borderRadius: new BorderRadius.all(new Radius.circular(8.0)),
                  child: new InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) =>
                                  new FullScreenImageVew(imgPath)));
                     // print('item clicked at position $j');
                    },
                    child: new FadeInImage(
                      placeholder: new AssetImage("images/loading.gif"),
                      image: new NetworkImage(imgPath),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
              staggeredTileBuilder: (j) =>
                  new StaggeredTile.count(2, j.isEven ? 2 : 3),
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
            )
          : new Center(
              child: new CircularProgressIndicator(),
            ),
    );
  }
}
