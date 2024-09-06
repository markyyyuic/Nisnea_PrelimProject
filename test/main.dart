import 'dart:io';
import 'package:riverpod/riverpod.dart';
import 'package:prelim_project/models/transaction_model.dart';
import 'package:prelim_project/models/user_model.dart';
import 'package:prelim_project/providers.dart';

void main(){

  //create tag variable na container para satong provider
 final container = ProviderContainer();

 //then nag initialize tag variable para satong providers
 final bookServices = container.read(bookServiceProvider);
 final userServices = container.read(userServiceProvider);
 final transactionServices = container.read(transactionServiceProvider);


 while(true) {
  print('Library Management System');
  print('Please select an option');
  print('1. Add Book');
  print('2. Add User');
  print('3. Borrow Book');
  print('4. Return Book');
  print('5. View All Books');
  print('6. View All Users');
  print('7. View Transaction History');
  print('8. Exit');

  var options = stdin.readLineSync();


  switch (options) {
    //------------case 1 ------------ //
    case '1':
    //Diri add tag book logic
    print('Enter book Title: ');
    var title = stdin.readLineSync()!;
    print('Enter Book Author: ');
    var author = stdin.readLineSync()!;

    bookServices.addBook(title, author);
    print('Book Added Successfully');
    break;
 //------------case 2 ------------ //
    case '2':
    //atong user logic
    print('Enter User ID: ');
    var id = stdin.readLineSync()!;
    print('Enter Username: ');
    var name = stdin.readLineSync()!;

    userServices.addUser(User(id: id, name: name));
    print('User Successfully added!');

    break;

    //------------case 3 ------------ //
    case '3':
    //Transaction logic diri
    print('Enter Book ID: ');
    var bookID = stdin.readLineSync()!;

    var book = bookServices.getBooksById(bookID);
    if (book == null){
      print('Book Not Found');
    break;
    }
    print('Enter User ID:');
    var id = stdin.readLineSync()!;


    

    var transaction = Transaction(
      bookID: bookID,
      userID: id,
      dateBorrowed: DateTime.now(),
    );

    transactionServices.borrowBook(transaction);
    bookServices.setAvailability(bookID);
    print('Borrowed Successfully');

    break;

  case '4':
  // return logic 
  //------------case 4 ------------ //
  print('Enter Book ID: ');
  var bookID = stdin.readLineSync()!;

  transactionServices.bookReturned(bookID, DateTime.now());
  bookServices.setAvailability(bookID);
  print('Book return Successfully.');

  break;
  //------------case 5------------ //
  case '5':
  //view book list 
  var books = bookServices.getBooks();
  print('Book Lists: ');
  for (var books in books) {
    String availability = books.isAvailable ? 'Available' : 'Not Available';
    print('ID: ${books.id}, \nTitle: ${books.title},  \nAuthor: ${books.author},  \nAvailable: $availability');
    print(''); 
  }
  break;
  //------------case 6 ------------ //
  case '6':
  //user list
  var users = userServices.getUsers();
  print('List of Active Users:');
  for (var users in users) {
    print('UserID: ${users.id}, \nName: ${users.name}');
  }

  break;

  case '7':
  //------------case 7 ------------ //
  var transactions = transactionServices.getTransactionHistory();
  print('Transaction History:');
  for (var transaction in transactions) {
    print('Book Name: ${transaction['Book Name']}');
    print('User ID: ${transaction['User ID']}');
    print('Date Borrowed: ${transaction['Date Borrowed']}');
    print('Date Returned: ${transaction['Date Returned']}');
    print('');  
  }
  break;

  case '8':
  print('Thank you for using Library Management System!');
  exit(0);

  default:
  print('Invalid Option. Try again.');
 }

}
}