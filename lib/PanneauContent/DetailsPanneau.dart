// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:siraba_chariaw/PanneauContent/DetailsPanneauContent.dart';
import 'package:http/http.dart' as http;

class DetailsPanneau extends StatefulWidget {
  const DetailsPanneau({Key? key, required this.categoryId}) : super(key: key);
  final int categoryId;

  @override
  _DetailsPanneauState createState() => _DetailsPanneauState();
}

class _DetailsPanneauState extends State<DetailsPanneau>
    with TickerProviderStateMixin {
  late TabController tabController;

  dynamic category;

  // ignore: prefer_typing_uninitialized_variables
  late var urlAPi;

  Future getCategoryById() async {
    final response = await http.get(urlAPi);

    if (response.statusCode == 200) {
      var oneCategory = jsonDecode(response.body);
      print(oneCategory);
      setState(() {
        category = oneCategory;
      });
    }

    return category;
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    urlAPi = Uri.parse(
        "http://groupe-flutter.herokuapp.com/api/category/getCategoryById/${widget.categoryId}");
    getCategoryById();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Panneaux"),
        centerTitle: true,
        backgroundColor: Colors.blue.shade900,
        toolbarHeight: 50,
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 20),
        children: [
          TabBar(
            controller: tabController,
            isScrollable: true,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            tabs: const [
              Tab(
                child: Text("Dangers",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              Tab(
                child: Text("Obligations",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              Tab(
                child: Text("Interdictions",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              Tab(
                child: Text("Signalisations",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              )
            ],
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: TabBarView(
                controller: tabController,
                children: [
                  DetailsPanneauContent(
                      audio: category["audioCategory"],
                      imgPath: category["imageCategory"],
                      description: category["descriptionCategory"],
                      categoryId: category["id"]),
                  const Center(
                    child: Text("Hello 3"),
                  ),
                  const Center(
                    child: Text("Hello 5"),
                  ),
                  const Center(
                    child: Text("Hello 5"),
                  )
                  // DetailsPanneauContent(imgPath: "assets/images/danger/1.png"),
                  // DetailsPanneauContent(imgPath: "assets/images/danger/2.png"),
                  // DetailsPanneauContent(imgPath: "assets/images/danger/3.png"),
                  // DetailsPanneauContent(imgPath: "assets/images/danger/4.png")
                ],
              ))
        ],
      ),
    );
  }
}
