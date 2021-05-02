import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_ui/models/current_track.dart';

class NowPlaying extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84.0,
      width: double.infinity,
      color: Colors.black87,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            _TrackInfo(),
            const Spacer(),
            _AudioControll(),
            const Spacer(),
            if (MediaQuery.of(context).size.width > 800) _MoreControll(),
          ],
        ),
      ),
    );
  }
}

class _TrackInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final selectedTrack = context.watch<CurrentTrack>().selected;
    if (selectedTrack == null) return SizedBox.shrink();
    return Row(
      children: [
        Image.asset(
          "assets/lofigirl.jpg",
          height: 60.0,
          width: 60.0,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 12.0),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              selectedTrack.title,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 4.0),
            Text(
              selectedTrack.artist,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontSize: 12.0, color: Colors.grey[300]),
            ),
          ],
        ),
        IconButton(
          icon: Icon(
            Icons.favorite_outline,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}

class _AudioControll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final selectedTrack = context.watch<CurrentTrack>().selected;

    return Column(
      children: [
        Row(children: [
          IconButton(
            padding: EdgeInsets.only(),
            icon: Icon(
              Icons.shuffle,
            ),
            iconSize: 24.0,
            onPressed: () {},
          ),
          IconButton(
            padding: EdgeInsets.only(),
            icon: Icon(
              Icons.skip_previous_outlined,
            ),
            iconSize: 24.0,
            onPressed: () {},
          ),
          IconButton(
            padding: EdgeInsets.only(),
            icon: Icon(
              Icons.play_circle_outline,
            ),
            iconSize: 34.0,
            onPressed: () {},
          ),
          IconButton(
            padding: EdgeInsets.only(),
            icon: Icon(
              Icons.skip_next_outlined,
            ),
            iconSize: 24.0,
            onPressed: () {},
          ),
          IconButton(
            padding: EdgeInsets.only(),
            icon: Icon(
              Icons.repeat,
            ),
            iconSize: 24.0,
            onPressed: () {},
          ),
        ]),
        const SizedBox(height: 4.0),
        Row(
          children: [
            Text("0.00", style: Theme.of(context).textTheme.caption),
            const SizedBox(width: 8.0),
            Container(
              height: 5.0,
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
            const SizedBox(width: 8.0),
            Text(selectedTrack?.duration ?? "0.00",
                style: Theme.of(context).textTheme.caption),
          ],
        ),
      ],
    );
  }
}

class _MoreControll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          padding: EdgeInsets.only(),
          icon: Icon(
            Icons.devices_outlined,
          ),
          iconSize: 20.0,
          onPressed: () {},
        ),
        Row(
          children: [
            IconButton(
              padding: EdgeInsets.only(),
              icon: Icon(
                Icons.volume_up_outlined,
              ),
              iconSize: 20.0,
              onPressed: () {},
            ),
            Container(
              width: 70.0,
              height: 5.0,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
          ],
        ),
        IconButton(
          padding: EdgeInsets.only(),
          icon: Icon(
            Icons.fullscreen_outlined,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
