// ignore_for_file: file_names

import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PanneauCardView extends StatefulWidget {
  const PanneauCardView({Key? key, required this.categoryId}) : super(key: key);
  final int categoryId;

  @override
  _PanneauCardViewState createState() => _PanneauCardViewState();
}

class _PanneauCardViewState extends State<PanneauCardView> {
  dynamic typePanneauByCategory;

  // ignore: prefer_typing_uninitialized_variables
  late var urlAPi;

  Future getPanneauByCategory() async {
    final response = await http.get(urlAPi);

    if (response.statusCode == 200) {
      var listPanneaux = jsonDecode(response.body);
      print(listPanneaux);
      setState(() {
        typePanneauByCategory = listPanneaux;
      });
    }

    return typePanneauByCategory;
  }

  @override
  void initState() {
    super.initState();

    urlAPi = Uri.parse(
        "http://groupe-flutter.herokuapp.com/api/PanneauCategory/${widget.categoryId}");
    getPanneauByCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: ListView(
        children: [
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.only(right: 15),
            width: MediaQuery.of(context).size.width - 30,
            height: MediaQuery.of(context).size.height - 50,
            child: GridView.count(
              crossAxisCount: 2,
              primary: false,
              crossAxisSpacing: 10,
              mainAxisSpacing: 15,
              childAspectRatio: 1.0,
              children: [
                makeCardForSubPanneau("assets/images/danger/danger_enfant.png",
                    "Endroit fréquenté par les enfants"),
                makeCardForSubPanneau("assets/images/danger/danger_retre.png",
                    "Chaussée rétrécie"),
                makeCardForSubPanneau("assets/images/danger/danger_inconnu.png",
                    " Danger inconnu"),
                makeCardForSubPanneau("assets/images/danger/danger_pieton.png",
                    "Passage pour pieton"),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget makeCardForSubPanneau(String imagePath, String nomPanneau) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 5),
      child: InkWell(
        onTap: () {
          showDialogFunc(context, "Panneau",
              "assets/images/danger/danger_enfant.png", "", "dhhhhhhhhhhh");
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
            children: [
              Image.asset(imagePath, height: 100, width: 100),
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

  showDialogFunc(context, nom, photo, audio, description) {
    return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300],
              ),
              padding: EdgeInsets.all(15),
              height: 320,
              width: MediaQuery.of(context).size.width * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    nom,
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      photo,
                      width: 80,
                      height: 80,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.volume_up,
                      size: 40,
                    ),
                    onPressed: () {},
                  ),
                  Container(
                    // width: 200,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        description,
                        maxLines: 3,
                        style: TextStyle(fontSize: 15, color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
