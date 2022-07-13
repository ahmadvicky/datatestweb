import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:testwebweb/home/child/itemChild.dart';
import 'package:testwebweb/home/model/dataModel.dart';


class HomeScreen extends StatefulWidget {

  @override
  homeScreen createState() => homeScreen();

}

class homeScreen extends State<HomeScreen> {

  TextEditingController textEditingController = TextEditingController();

  List<DataModel> data = [];
  List<DataModel> dataFilter = [];
  bool isSearch = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    callApi();
  }

  callApi() async {
    final http.Response response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.body != "") {
      if (response.statusCode == 200) {
        List item = jsonDecode(response.body);
        item.forEach((element) {
          data.add(DataModel.fromJson(element));
        });
        setState(() {

        });
      }
    }
  }

  filterAction(){
    isSearch = true;

    dataFilter.clear();

    List<DataModel> databaru = data.where((element) => element.title!.toString().contains(textEditingController.text)).toList();
    dataFilter = databaru;

    setState(() {
      if (textEditingController.text.isEmpty){
        isSearch = false;
        setState(() {

        });
      }

    });

    // List databaru2 = databaru.where((element) => element.body!.toString().contains(textEditingController.text)).toList();

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            controller: textEditingController,
            onChanged: (s){
              filterAction();
            },
          ),
          isSearch ? dataFilter.isEmpty ? const Expanded(
            child:  Center(
              child: Text(
                "Filter tidak ada"
              ),
            ),
          ) : Expanded(child: ListView.builder(itemCount: dataFilter.length,
            itemBuilder: (context,item){
              return ItemChild(
                data: dataFilter[item],
              );
            },
          )) :
          Expanded(
            child: ListView.builder(itemCount: data.length,
            itemBuilder: (context,item){
              return ItemChild(
                data: data[item],
              );
            },
            ),
          )
        ],
      ),
    );
  }

}