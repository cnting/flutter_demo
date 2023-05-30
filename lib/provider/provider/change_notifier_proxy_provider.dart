import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookModel {
  static var _books = [
    Book(1, "111111"),
    Book(2, "2222222"),
    Book(3, "33333"),
    Book(4, "44444"),
    Book(5, "555555"),
    Book(6, "666666"),
  ];

  int get length => _books.length;

  Book getById(int id) => _books[id - 1];

  Book getByPosition(int position) => _books[position];
}

class Book {
  final int bookId;
  final String bookName;

  Book(this.bookId, this.bookName);
}

class BookManagerModel with ChangeNotifier {
  final BookModel _bookModel;

  List<int>? _bookIds;

  BookManagerModel(this._bookModel, {BookManagerModel? bookManagerModel})
      : _bookIds = bookManagerModel?._bookIds ?? [];

  List<Book> get books =>
      _bookIds!.map((id) => _bookModel.getById(id)).toList();

  Book getByPosition(int position) => books[position];

  int get length => _bookIds?.length ?? 0;

  void addFaves(Book book) {
    _bookIds!.add(book.bookId);
    notifyListeners();
  }

  // 删除书籍
  void removeFaves(Book book) {
    _bookIds!.remove(book.bookId);
    notifyListeners();
  }
}

class ChangeNotifierProxyProviderExample extends StatefulWidget {
  @override
  _ChangeNotifierProxyProviderExampleState createState() =>
      _ChangeNotifierProxyProviderExampleState();
}

class _ChangeNotifierProxyProviderExampleState
    extends State<ChangeNotifierProxyProviderExample> {
  var _selectIndex = 0;
  var _pages = [PageA(), PageB()];

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => BookModel()),
        ChangeNotifierProxyProvider<BookModel, BookManagerModel>(
            create: (_) => BookManagerModel(BookModel()),
            update: (_, bookModel, bookManagerModel) =>
                bookManagerModel ?? BookManagerModel(bookModel)),
      ],
      child: Scaffold(
        body: _pages[_selectIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectIndex,
          onTap: (index) {
            setState(() {
              _selectIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.book), label: "书籍列表"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "收藏"),
          ],
        ),
      ),
    );
  }
}

class PageA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bookModel = Provider.of<BookModel>(context);
    return Scaffold(
      appBar: AppBar(title: Text("书籍列表")),
      body: ListView.builder(
          itemCount: bookModel.length,
          itemBuilder: (_, index) {
            return BookItem(id: index + 1);
          }),
    );
  }
}

class PageB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bookManagerModel = Provider.of<BookManagerModel>(context);
    var bookCount = bookManagerModel.length;

    return Scaffold(
      appBar: AppBar(title: Text("收藏列表")),
      body: ListView.builder(
          itemCount: bookCount,
          itemBuilder: (_, index) {
            return BookItem(id: bookManagerModel.getByPosition(index).bookId);
          }),
    );
  }
}

class BookButton extends StatelessWidget {
  final Book book;

  const BookButton({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    var bookManagerModel = Provider.of<BookManagerModel>(context);
    return GestureDetector(
      onTap: bookManagerModel.books.contains(this.book)
          ? () => bookManagerModel.removeFaves(this.book)
          : () => bookManagerModel.addFaves(this.book),
      child: SizedBox(
        width: 100,
        height: 60,
        child: bookManagerModel.books.contains(this.book)
            ? Icon(
                Icons.star,
                color: Colors.red,
              )
            : Icon(Icons.star_border),
      ),
    );
  }
}

class BookItem extends StatelessWidget {
  final int id;

  const BookItem({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    var bookMode = Provider.of<BookModel>(context);
    var book = bookMode.getById(id);
    return ListTile(
      leading: CircleAvatar(
        child: Text("${book.bookId}"),
      ),
      title: Text("${book.bookName}"),
      trailing: BookButton(
        book: book,
      ),
    );
  }
}
