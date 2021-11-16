// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:siraba_chariaw/PanneauContent/DetailsPanneau.dart';

import 'package:http/http.dart' as http;

class CardView extends StatefulWidget {
  const CardView({Key? key}) : super(key: key);

  @override
  _CardViewState createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  List allCategories = [];

  var urlCategoryAPi = Uri.parse(
      'http://groupe-flutter.herokuapp.com/api/category/getAllCategory');

  Future getAllCategory() async {
    final response = await http.get(urlCategoryAPi);

    if (response.statusCode == 200) {
      var list = jsonDecode(response.body);
      setState(() {
        allCategories = list;
      });
    }

    return allCategories;
  }

  @override
  void initState() {
    super.initState();
    getAllCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: Container(
          margin: const EdgeInsets.only(top: 100),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 1.0, mainAxisSpacing: 2),
            itemCount: allCategories.length,
            itemBuilder: (context, index) {
              return makeCard(
                  allCategories[index]["imageCategory"],
                  allCategories[index]["nomCategory"],
                  allCategories[index]["id"]);
            },
          ),
        ));
  }

  Widget makeCard(String imagePath, String nomPanneau, int categoryId) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 5, left: 20, right: 5),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      DetailsPanneau(categoryId: categoryId)));
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 5)
              ],
              color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(imagePath, height: 120, width: 120),
              Text(
                nomPanneau,
                style: const TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
