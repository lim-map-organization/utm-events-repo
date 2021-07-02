import 'package:flutter/material.dart';
class Head extends StatelessWidget {
  Head({title,desc,image}) :
  _title = title,
  _desc = desc,
  _image = image;
  final String _title;
  final String _desc;
  final String _image;
  //const Head({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$_title",
                  style: TextStyle(fontFamily: 'Now', fontSize: 45.0),
                ),
                Text(
                  "$_desc",
                  style: TextStyle(fontFamily: 'Now', fontSize: 19.5),
                ),
              ],
            )),
        Flexible(flex: 2, child: Image.asset('asset/$_image')),
      ],
    );
  }
}