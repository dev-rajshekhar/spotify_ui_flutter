import 'package:flutter/material.dart';
import 'package:spotify_ui/data/data.dart';

class CurrentTrack extends ChangeNotifier {
  Song? selected;

  void selectTrack(Song song) {
    selected = song;
    notifyListeners();
  }
}
