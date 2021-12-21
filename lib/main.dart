import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:contacts_service/contacts_service.dart';

void main() {
  runApp(
      MaterialApp(
        home: MyApp()
      ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int total = 3;
  List<Contact> name = [];
  List<int> like = [0, 0, 0];

  getPermission() async {
    var status = await Permission.contacts.status;
    if (status.isGranted) {
      print('허락됨');
      var contacts = await ContactsService.getContacts();
      setState(() {
        name = contacts;
      });
    } else if (status.isDenied) {
      print('거절됨');
      Permission.contacts.request();
    }
  }

  addUser(data) {
    setState(() {
      var newPerson = Contact();
      newPerson.givenName = data;
      ContactsService.addContact(newPerson);
    });
  }

  addTotal() {
    setState(() {
      total++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            showDialog(context: context, builder: (context){
              return DialogUI(state: total, addTotal: addTotal, addUser: addUser,);
            });
          },
        ),
        appBar: AppBar(
          title: Text(total.toString()),
          actions: [IconButton(onPressed: getPermission, icon: Icon(Icons.contacts))],
        ),
        body: ShopItem(name: name,),
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

class DialogUI extends StatelessWidget {
  DialogUI({Key? key, this.state, this.addTotal, this.addUser}) : super(key: key);
  final state;
  final addTotal;
  final addUser;
  var inputData = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 300,
        height: 300,
        child: Column(
          children: [
            TextField(controller: inputData,),
            TextButton(onPressed: (){
              addUser(inputData.text);
            }, child: Text('완료')),
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text("취소")),
          ],
        ),
      )
    );
  }
}


// 커스텀 위젯
class ShopItem extends StatelessWidget {
  const ShopItem({Key? key, this.name}) : super(key: key);
  final name;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: name.length,
      itemBuilder: (context, index){
        return ListTile(
          leading: Icon(Icons.account_circle),
          title: Text(name[index].givenName ?? 'null처리'),
        );
      },
    );
  }
}
