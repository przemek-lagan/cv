// import 'dart:async';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';

// class PDFApp extends StatefulWidget {
//   @override
//   _PDFAppState createState() => _PDFAppState();
// }

// class _PDFAppState extends State<PDFApp> {
//   String pathPDF = "";

//   @override
//   void initState() {
//     super.initState();
//     fromAsset('assets/demo-link.pdf', 'demo.pdf').then((f) {
//       setState(() {
//         print('setstate!');
//         pathPDF = f.path;
//       });
//     });
//   }

//   Future<File> fromAsset(String asset, String filename) async {
//     // To open from assets, you can copy them to the app storage folder, and the access them "locally"
//     Completer<File> completer = Completer();

//     // try {
//     var dir = await getApplicationDocumentsDirectory();
//     print(dir);
//     File file = File("${dir.path}/$filename");
//     var data = await rootBundle.load(asset);
//     var bytes = data.buffer.asUint8List();
//     await file.writeAsBytes(bytes, flush: true);
//     completer.complete(file);
//     // } catch (e) {
//     //   throw Exception('Error parsing asset file!');
//     // }

//     return completer.future;
//   }

//   @override
//   Widget build(BuildContext context) {
//     print(pathPDF);
//     return MaterialApp(
//       title: 'Flutter PDF View',
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(title: const Text('Plugin example app')),
//         body: Center(child: Builder(
//           builder: (BuildContext context) {
//             return Column(
//               children: <Widget>[
//                 TextButton(
//                   child: const Text("Open PDF"),
//                   onPressed: () {
//                     if (pathPDF.isNotEmpty) {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => PDFScreen(path: pathPDF),
//                         ),
//                       );
//                     }
//                   },
//                 ),
//               ],
//             );
//           },
//         )),
//       ),
//     );
//   }
// }

// class PDFScreen extends StatefulWidget {
//   final String? path;

//   const PDFScreen({Key? key, this.path}) : super(key: key);

//   @override
//   _PDFScreenState createState() => _PDFScreenState();
// }

// class _PDFScreenState extends State<PDFScreen> with WidgetsBindingObserver {
//   final Completer<PDFViewController> _controller =
//       Completer<PDFViewController>();
//   int? pages = 0;
//   int? currentPage = 0;
//   bool isReady = false;
//   String errorMessage = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Document"),
//         actions: <Widget>[
//           IconButton(
//             icon: const Icon(Icons.share),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: Stack(
//         children: <Widget>[
//           PDFView(
//             filePath: widget.path,
//             enableSwipe: true,
//             swipeHorizontal: true,
//             autoSpacing: false,
//             pageFling: true,
//             pageSnap: true,
//             defaultPage: currentPage!,
//             fitPolicy: FitPolicy.BOTH,
//             preventLinkNavigation:
//                 false, // if set to true the link is handled in flutter
//             onRender: (pages) {
//               setState(() {
//                 pages = pages;
//                 isReady = true;
//               });
//             },
//             onError: (error) {
//               setState(() {
//                 errorMessage = error.toString();
//               });
//               print(error.toString());
//             },
//             onPageError: (page, error) {
//               setState(() {
//                 errorMessage = '$page: ${error.toString()}';
//               });
//               print('$page: ${error.toString()}');
//             },
//             onViewCreated: (PDFViewController pdfViewController) {
//               _controller.complete(pdfViewController);
//             },
//             onLinkHandler: (String? uri) {
//               print('goto uri: $uri');
//             },
//             onPageChanged: (int? page, int? total) {
//               print('page change: $page/$total');
//               setState(() {
//                 currentPage = page;
//               });
//             },
//           ),
//           errorMessage.isEmpty
//               ? !isReady
//                   ? const Center(
//                       child: CircularProgressIndicator(),
//                     )
//                   : Container()
//               : Center(
//                   child: Text(errorMessage),
//                 )
//         ],
//       ),
//       floatingActionButton: FutureBuilder<PDFViewController>(
//         future: _controller.future,
//         builder: (context, AsyncSnapshot<PDFViewController> snapshot) {
//           if (snapshot.hasData) {
//             return FloatingActionButton.extended(
//               label: Text("Go to ${pages! ~/ 2}"),
//               onPressed: () async {
//                 await snapshot.data!.setPage(pages! ~/ 2);
//               },
//             );
//           }

//           return Container();
//         },
//       ),
//     );
//   }
// }
