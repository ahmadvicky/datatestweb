import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testwebweb/home/model/dataModel.dart';

class ItemChild extends StatelessWidget {

  DataModel? data;

  ItemChild({Key? key,
   this.data,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          DefaultText(
            text: data!.title,
          ),
          DefaultText(
            text: data!.body,
          )
        ],
      ),
    );
  }

}

class DefaultText extends StatelessWidget{

  String? text;

  DefaultText({
    this.text
});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      alignment: Alignment.centerLeft,
      child: Text(
        text.toString(),
        style: const TextStyle(
          color: Colors.white
        ),
      ),
    );
  }

}