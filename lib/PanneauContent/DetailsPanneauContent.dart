// ignore_for_file: file_names

import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:siraba_chariaw/PanneauContent/PanneauCardView.dart';

class DetailsPanneauContent extends StatefulWidget {
  DetailsPanneauContent(
      {Key? key,
      required this.imgPath,
      required this.audio,
      required this.description,
      required this.categoryId})
      : super(key: key);

  final dynamic categoryId;
  final String imgPath;
  final String description;
  final String audio;

  @override
  _DetailsPanneauContentState createState() => _DetailsPanneauContentState();
}

class _DetailsPanneauContentState extends State<DetailsPanneauContent> {
  final AudioPlayer audioPlayer = AudioPlayer();
  AudioCache player = AudioCache();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(widget.imgPath, height: 100, width: 100),
        IconButton(
            onPressed: () {
              String url = "Danger.mp3";
              player.play(url);
            },
            icon: const Icon(Icons.volume_up, size: 30)),
        Text(
          widget.description,
          style: const TextStyle(
            fontSize: 17,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Expanded(child: PanneauCardView(categoryId: widget.categoryId))
      ],
    );
  }
}
