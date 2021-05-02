import 'package:flutter/material.dart';
import 'package:spotify_ui/data/data.dart';
import 'package:spotify_ui/widgets/widgets.dart';

class PlaylistScreen extends StatefulWidget {
  final Playlist playlist;

  const PlaylistScreen({Key? key, required this.playlist}) : super(key: key);

  @override
  _PlaylistScreenState createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  ScrollController? _scrollContainer;

  @override
  void initState() {
    super.initState();
    _scrollContainer = ScrollController();
  }

  @override
  void dispose() {
    _scrollContainer?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          TextButton.icon(
            style: TextButton.styleFrom(
                primary: Theme.of(context).iconTheme.color),
            onPressed: () {},
            icon: Icon(
              Icons.account_circle_outlined,
              size: 30.0,
            ),
            label: const Text("Rajshekhar"),
          ),
          const SizedBox(width: 8.0),
          IconButton(
            icon: Icon(
              Icons.keyboard_arrow_down,
              size: 30.0,
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 20.0),
        ],
        leadingWidth: 140.0,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                customBorder: const CircleBorder(),
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(6.0),
                  decoration: const BoxDecoration(
                      color: Colors.black26, shape: BoxShape.circle),
                  child: const Icon(Icons.chevron_left, size: 20.0),
                ),
              ),
              const SizedBox(width: 16.0),
              InkWell(
                customBorder: const CircleBorder(),
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(6.0),
                  decoration: const BoxDecoration(
                      color: Colors.black26, shape: BoxShape.circle),
                  child: const Icon(Icons.chevron_right, size: 20.0),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            stops: const [0, 0.3],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFFAF1018),
              Theme.of(context).backgroundColor
            ],
          ),
        ),
        child: Scrollbar(
          controller: _scrollContainer,
          isAlwaysShown: true,
          child: ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 20.0,
            ),
            controller: _scrollContainer,
            children: [
              const SizedBox(height: 40.0),
              PlayListHeader(
                playlist: widget.playlist,
              ),
              TrackList(songs: widget.playlist.songs),
            ],
          ),
        ),
      ),
    );
  }
}
