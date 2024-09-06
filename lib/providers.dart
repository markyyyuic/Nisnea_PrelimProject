import 'package:riverpod/riverpod.dart';
import 'services/book_services.dart';
import 'services/transaction_services.dart';
import 'services/user_services.dart';

final bookServiceProvider = Provider<BookService>((ref) => BookService());
final transactionServiceProvider = Provider<TransactionService>((ref) {
  final bookService = ref.watch(bookServiceProvider); // Get BookService instance
  return TransactionService(bookService); // Pass it to TransactionService
});
final userServiceProvider = Provider<UserService>((ref) => UserService());
