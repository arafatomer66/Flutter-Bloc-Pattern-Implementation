import 'package:flutter/material.dart';
import 'package:flutter_bloc_project/model/albums_list.dart';
import 'package:flutter_bloc_project/widgets/txt.dart';

class ListRow extends StatelessWidget {
  //
  final Album album;
  ListRow({required this.album});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Txt(text: album.title),
          const Divider(),
        ],
      ),
    );
  }
}
