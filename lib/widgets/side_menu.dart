import 'package:flutter/material.dart';
import 'package:spotify_ui/data/data.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.0,
      color: Theme.of(context).primaryColor,
      height: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  'assets/spotify_logo.png',
                  height: 55.0,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ],
          ),
          _SideMenuIcon(
            iconData: Icons.home,
            title: "Home",
            onTap: () => {},
          ),
          _SideMenuIcon(
            iconData: Icons.search,
            title: "Search",
            onTap: () => {},
          ),
          _SideMenuIcon(
            iconData: Icons.audiotrack,
            title: "Radio",
            onTap: () => {},
          ),
          const SizedBox(
            height: 12.0,
          ),
          _LibraryPlayList(),
        ],
      ),
    );
  }
}

class _SideMenuIcon extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onTap;
  const _SideMenuIcon(
      {Key? key,
      required this.iconData,
      required this.title,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyText1,
        overflow: TextOverflow.ellipsis,
      ),
      leading: Icon(
        iconData,
        color: Theme.of(context).iconTheme.color,
        size: 28.0,
      ),
      onTap: onTap,
    );
  }
}

class _LibraryPlayList extends StatefulWidget {
  @override
  __LibraryPlayListState createState() => __LibraryPlayListState();
}

class __LibraryPlayListState extends State<_LibraryPlayList> {
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scrollbar(
        isAlwaysShown: true,
        controller: _scrollController,
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          physics: const ClampingScrollPhysics(),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Text(
                    "Your Library",
                    style: Theme.of(context).textTheme.headline4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                ...yourLibrary
                    .map((e) => ListTile(
                          dense: true,
                          title: Text(
                            e,
                            style: Theme.of(context).textTheme.bodyText2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          onTap: () => {},
                        ))
                    .toList()
              ],
            ),
            const SizedBox(height: 12.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Text(
                    "Playlist",
                    style: Theme.of(context).textTheme.headline4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                ...playlists
                    .map((e) => ListTile(
                          dense: true,
                          title: Text(
                            e,
                            style: Theme.of(context).textTheme.bodyText2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          onTap: () => {},
                        ))
                    .toList()
              ],
            )
          ],
        ),
      ),
    );
  }
}
