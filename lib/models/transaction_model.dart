class Transaction {
  final String bookID;
  final String userID;
  final DateTime dateBorrowed;
  DateTime? dateReturned;

  //Transaction Constructor ni siya
  Transaction({required this.bookID, 
  required this.userID, 
  required this.dateBorrowed,  
  this.dateReturned});
}