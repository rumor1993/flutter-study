import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

var a = 1;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Text(a.toString()),
          onPressed: (){
            a++;
            print(a);
          },
        ),
        appBar: AppBar(
          title: Text("금호동 3가"),
          actions: [Icon(Icons.search), Icon(Icons.dehaze), Icon(Icons.notifications_none),],
        ),
        body: ShopItem(),
        bottomNavigationBar: CustomBottomBar(),
      ),
    );
  }
}

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.call),
            Icon(Icons.message),
            Icon(Icons.contacts),
          ],
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
