import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class Book {
  final int id;
  final String name;
  //
  bool _isBorrowed;

  Book({required this.id, required this.name, bool isBorrowed = false})
    : _isBorrowed = isBorrowed;
//
  bool get isBorrowed => _isBorrowed;
// Đóng gói
  void toggleBorrowed(bool value) {
    _isBorrowed = value;
  }

  String get status => _isBorrowed ? "Đã mượn" : "Chưa mượn";
}

abstract class Person {
  final int id;
  String name;

  Person({required this.id, required this.name});

  String getRole(); // đa hình
}

// kế thừa
class Staff extends Person {
  Staff({required super.id, required super.name});

  @override
  String getRole() => "Nhân viên";
}

class User extends Person {
  User({required super.id, required super.name});

  @override
  String getRole() => "Người dùng";
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  Person staff = Staff(id: 1, name: "Nguyen Van A");

  List<Book> books = [
    Book(id: 1, name: "Sách 01"),
    Book(id: 2, name: "Sách 02"),
  ];

  final TextEditingController staffController = TextEditingController();
  final TextEditingController bookController = TextEditingController();
  @override
  void initState() {
    super.initState();
    staffController.text = staff.name;
  }
  // int _counter = 0;

  // void _incrementCounter() {
  // setState(() {
  // This call to setState tells the Flutter framework that something has
  // changed in this State, which causes it to rerun the build method below
  // so that the display can reflect the updated values. If we changed
  // _counter without calling setState(), then the build method would not be
  // called again, and so nothing would appear to happen.
  // _counter++;
  // });
  // }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hệ thống Quản lý Thư viện"),
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        // title: Text(widget.title),
      ),
      body: _buildBody(),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey, width: 1)),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Quản lý"),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: "DS Sách"),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Nhân viên",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return _manageScreen();
      case 1:
        return _bookScreen();
      case 2:
        return _staffScreen();
      default:
        return _manageScreen();
    }
  }

  Widget _manageScreen() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Nhân viên", style: TextStyle(fontSize: 20)),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: staffController,

                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(vertical: 8),
                  ),
                ),
              ),
              SizedBox(width: 8),
              SizedBox(
                height: 48,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      staff.name = staffController.text;
                    });
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),

                  child: Text("Đổi"),
                ),
              ),
            ],
          ),

          SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Danh sách sách", style: TextStyle(fontSize: 20)),
          ),
          SizedBox(height: 8),
          Expanded(
            child: ListView(
              children: books.map((book) {
                return Card(
                  child: CheckboxListTile(
                    title: Text(book.name),
                    value: book.isBorrowed,
                    onChanged: (value) {
                      setState(() {
                        book.toggleBorrowed(value!);
                      });
                    },
                  ),
                );
              }).toList(),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: _addBookDialog,
              child: const Text("Thêm"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bookScreen() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: books.map((book) {
        return ListTile(
          leading: const Icon(Icons.book),
          title: Text(book.name),
          trailing: Text(
            book.isBorrowed ? "Đã mượn" : "Chưa mượn",
            style: TextStyle(
              color: book.isBorrowed ? Colors.red : Colors.green,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _staffScreen() {
    return Center(
      child: Text(
        "${staff.getRole()} quản lý:\n${staff.name}",
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }

  void _addBookDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Thêm sách"),
        content: TextField(
          controller: bookController,
          decoration: const InputDecoration(hintText: "Tên sách"),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Hủy"),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                books.add(
                  Book(id: books.length + 1, name: bookController.text),
                );
                bookController.clear();
              });
              Navigator.pop(context);
            },
            child: const Text("Thêm"),
          ),
        ],
      ),
    );
  }
}
