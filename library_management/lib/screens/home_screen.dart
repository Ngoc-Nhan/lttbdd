import 'package:flutter/material.dart';
import '../models/book.dart';
import '../models/staff.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  Staff staff = Staff(id: 1, name: "Nguyen Van A");

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hệ thống Quản lý Thư viện"),
        backgroundColor: Colors.blue,
      ),
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Quản lý"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "DS Sách"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Nhân viên"),
        ],
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

  // ================= QUẢN LÝ =================
  Widget _manageScreen() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Nhân viên", style: TextStyle(fontSize: 18)),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: staffController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    staff.name = staffController.text;
                  });
                },
                child: const Text("Đổi"),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text("Danh sách sách", style: TextStyle(fontSize: 18)),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              children: books.map((book) {
                return Card(
                  child: CheckboxListTile(
                    title: Text(book.name),
                    value: book.isBorrowed,
                    onChanged: (value) {
                      setState(() {
                        book.isBorrowed = value!;
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

  // ================= DANH SÁCH SÁCH =================
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

  // ================= NHÂN VIÊN =================
  Widget _staffScreen() {
    return Center(
      child: Text(
        "Nhân viên quản lý:\n${staff.name}",
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }

  // ================= ADD BOOK =================
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
