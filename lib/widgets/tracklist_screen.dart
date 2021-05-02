import 'package:flutter/material.dart';
import 'package:spotify_ui/data/data.dart';
import 'package:provider/provider.dart';
import 'package:spotify_ui/models/current_track.dart';

class TrackList extends StatelessWidget {
  final List<Song> songs;
  const TrackList({Key? key, required this.songs}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DataTable(
      showCheckboxColumn: false,
      headingTextStyle:
          Theme.of(context).textTheme.overline!.copyWith(fontSize: 12.0),
      dataRowHeight: 54.0,
      columns: const [
        DataColumn(label: Text("Title")),
        DataColumn(label: Text("Artist")),
        DataColumn(label: Text("Album")),
        DataColumn(label: Icon(Icons.access_time)),
      ],
      rows: songs.map((e) {
        final selected = context.watch<CurrentTrack>().selected?.id == e.id;
        final textStyle = selected
            ? TextStyle(color: Theme.of(context).accentColor)
            : TextStyle(color: Theme.of(context).iconTheme.color);
        return DataRow(
            cells: [
              DataCell(
                Text(e.title, style: textStyle),
              ),
              DataCell(
                Text(e.artist, style: textStyle),
              ),
              DataCell(
                Text(e.album, style: textStyle),
              ),
              DataCell(
                Text(e.duration, style: textStyle),
              ),
            ],
            selected: selected,
            onSelectChanged: (_) =>
                context.read<CurrentTrack>().selectTrack(e));
      }).toList(),
    );
  }
}
