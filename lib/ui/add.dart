import 'package:flutter/material.dart';
import 'package:database_scanner_app/widgets/appbar_widget.dart';
import 'package:database_scanner_app/widgets/bottomnavbar_widget.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Book> fetchAlbum(String isbn) async {
  final response = await http.get(
    Uri.parse('https://www.googleapis.com/books/v1/volumes?q=+isbn:$isbn'),
  );

  // www.goodreads.com/search?q=
  if (response.statusCode == 200) {
    return Book.fromJson(jsonDecode(response.body), isbn);
  }
  throw Exception('Failed to load album');
}

class Book {
  final String title;
  final bool status;
  final String isbn;
  final String author;

  const Book({
    this.title = "",
    this.isbn = "",
    this.author = "",
    this.status = true,
  });

  factory Book.fromJson(Map<String, dynamic> json, String isbn) {
    if (json['items'] == null || json['items'].length != 1) {
      return const Book(status: false);
    }
    Map<String, dynamic> book = json['items'][0];
    return Book(
        title: book['volumeInfo']['title'],
        isbn: isbn,
        author: book['volumeInfo']['authors'][0]);
  }
}

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  // late Future<Book> futureAlbum;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late Future<Book> book;
  String _scanBarcode = 'Unknown';

  @override
  void initState() {
    super.initState();
    book = fetchAlbum("0");
  }

  void submit() {
    _formKey.currentState?.save();
  }

  Future<void> scanBarcode() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', 'Cancel', true, ScanMode.BARCODE);

    setState(() {
      _scanBarcode = barcodeScanRes;
      book = fetchAlbum(barcodeScanRes);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Form(
            key: _formKey,
            child: Flexible(
              child: FutureBuilder<Book>(
                future: book,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // return ListView(
                    //   shrinkWrap: true,
                    //   children: <Widget>[
                    //     TextFormField(
                    //       initialValue: snapshot.data!.isbn,
                    //       decoration: const InputDecoration(
                    //         hintText: "ISBN",
                    //       ),
                    //     ),
                    //     TextFormField(
                    //       initialValue: snapshot.data!.title,
                    //       decoration: const InputDecoration(
                    //         hintText: "Title",
                    //       ),
                    //     ),
                    //     TextFormField(
                    //       initialValue: snapshot.data!.author,
                    //       decoration: const InputDecoration(
                    //         hintText: "Author",
                    //       ),
                    //     ),
                    //   ],
                    // );
                    return Column(
                      children: [
                        Text(snapshot.data!.isbn),
                        Text(snapshot.data!.title),
                        Text(snapshot.data!.author),
                      ],
                    );
                  }
                  return const Text("Nothing here.");
                },
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => scanBarcode(),
            child: const Text('Scan barcode'),
          ),
        ],
      ),
    );
  }
}




//           FutureBuilder<Book>(
//             future: futureAlbum,
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 if (snapshot.data!.status == false) {
//                   return const Text("Coulnd't find a good result");
//                 }
//                 return Text(snapshot.data!.title);
//               } else if (snapshot.hasError) {
//                 return Text('${snapshot.error}');
//               }
//               return const CircularProgressIndicator();
//             },
//           ),