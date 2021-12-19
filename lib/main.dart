import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var name = ['김영숙', '홍길동', '피자집'];
  var like = [0, 0, 0];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("금호동 3가"),
          actions: [Icon(Icons.search), Icon(Icons.dehaze), Icon(Icons.notifications_none),],
        ),
        body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index){
            return ListTile(
              leading: Text(like[index].toString()),
              title: Text(name[index]),
              trailing: TextButton(
                child: Text("좋아요"),
                onPressed: (){
                  setState(() {
                    like[index]++;
                  });
                },
              )
            );
          },
        ),
      ),
    );
  }
}

// 커스텀 위젯
class ShopItem extends StatelessWidget {
  const ShopItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index){
        return ListTile(
          leading: Icon(Icons.account_circle),
          title: Text(index.toString()),
        );
      },
    );
  }
}
