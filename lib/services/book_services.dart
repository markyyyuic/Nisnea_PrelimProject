import 'package:prelim_project/models/book_model.dart';
import 'package:collection/collection.dart';


class BookService {
  final List<Books> _books = [];
  int _bookID = 1;
  
  //method to get all the list of books
  List<Books> getBooks() => _books;

//method for adding a book
  void addBook (String title, String author) {
    final book = Books (id: (_bookID++).toString(),
    title: title,author: author,);
  _books.add(book);
  }

  Books? getBooksById(String id){
    return _books.firstWhereOrNull((book) => book.id == id);
  }

  void setAvailability(String id){
    final book = getBooksById(id);
    if (book != null ){
      book.isAvailable = !book.isAvailable;
    }
  }
}