import 'package:flutter/material.dart';
import 'package:spotify_ui/data/data.dart';

class PlayListHeader extends StatelessWidget {
  final Playlist playlist;
  const PlayListHeader({Key? key, required this.playlist}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              playlist.imageURL,
              height: 200.0,
              width: 200.0,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Playlyst",
                    style: Theme.of(context)
                        .textTheme
                        .overline!
                        .copyWith(fontSize: 12.0),
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    playlist.name,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    playlist.description,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    "Created By ${playlist.creator} - ${playlist.songs.length}, ${playlist.duration} ",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 16.0),
        _PlaylistButtons(follower: playlist.followers),
      ],
    );
  }
}

class _PlaylistButtons extends StatelessWidget {
  final String follower;

  const _PlaylistButtons({Key? key, required this.follower}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: () {},
          child: const Text("PLAY"),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 48.0,
              vertical: 24.0,
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            backgroundColor: Theme.of(context).accentColor,
            primary: Theme.of(context).iconTheme.color,
            textStyle: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(fontSize: 12.0, letterSpacing: 2.0),
          ),
        ),
        const SizedBox(height: 16.0),
        IconButton(
          icon: Icon(Icons.favorite_border),
          iconSize: 33.0,
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.more_horiz),
          iconSize: 30.0,
          onPressed: () {},
        ),
        const Spacer(),
        Text(
          "FOLLOWERS\n$follower",
          textAlign: TextAlign.right,
          style: Theme.of(context).textTheme.overline!.copyWith(
                fontSize: 12.0,
              ),
        )
      ],
    );
  }
}
