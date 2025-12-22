class Book {
  final int id;
  final String name;
  bool isBorrowed;

  Book({required this.id, required this.name, this.isBorrowed = false});
}
