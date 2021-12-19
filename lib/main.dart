import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("금호동 3가"),
          actions: [Icon(Icons.search), Icon(Icons.dehaze), Icon(Icons.notifications_none),],
        ),
        body: Container(
          height: 150,
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Image.asset('assets/3758687.jpg', width: 150,),
              Flexible(child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('카메라 팝니다.'),
                    Text('금호동 3가'),
                    Text('7000원'),
                    Row(

                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.favorite),
                        Text('4'),
                      ],
                    )
                  ],
                ),
              ), flex: 7,)
            ],
          ),
        ),
      ),
    );
  }
}
