import 'package:prelim_project/models/transaction_model.dart';
import 'package:prelim_project/services/book_services.dart';


class TransactionService {

  final List<Transaction> _transaction = [];
  final BookService  _bookService;

  TransactionService(this._bookService);
  
//method for getting the list of transaction
List<Transaction> getTransaction() => _transaction;
 

//method of borrowing books
void borrowBook(Transaction transaction) {
  _transaction.add(transaction);
}

//return method transaction
void bookReturned(String bookID, DateTime returnDate) {
  final transaction = _transaction.firstWhere((trans) => trans.bookID == bookID && trans.dateReturned == null,
   orElse: () => throw 'Transaction does not exist');
  transaction.dateReturned = returnDate;
}

List<Map<String, String>> getTransactionHistory() {
    return _transaction.map((transaction) {
      final book = _bookService.getBooksById(transaction.bookID);
      return {
        'Book Name': book?.title ?? 'Not found',
        'User ID': transaction.userID,
        'Date Borrowed': transaction.dateBorrowed.toString(),
        'Date Returned': transaction.dateReturned?.toString() ?? 'Not Returned Yet',
      };
    }).toList();
  }

}