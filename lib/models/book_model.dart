class Books {
  final String id;
  final String title;
  final String author;
  bool isAvailable;

   //Constructor ni siya
  Books({required this.id, 
  required this.title, 
  required this.author,  
  this.isAvailable = true
  });
}