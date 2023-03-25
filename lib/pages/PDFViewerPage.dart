import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class PDFViewerPage extends StatefulWidget {
  final String url;
  final String header;
  final String password;

  const PDFViewerPage({
    key,
    required this.url,
    required this.header,
    required this.password
  }) : super(key: key);

  @override
  _PDFViewerPageState createState() => _PDFViewerPageState(password: password);
}

class _PDFViewerPageState extends State<PDFViewerPage> {
  final String password;
  _PDFViewerPageState({required this.password});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.header)
      ),
      body: PDF(password: password).fromUrl(
        Uri.decodeFull(widget.url),

        placeholder: (double progress) => Center(child: Text('$progress %')),
        errorWidget: (dynamic error) => Center(child: Text(error.toString())),
      ),    );
  }

}