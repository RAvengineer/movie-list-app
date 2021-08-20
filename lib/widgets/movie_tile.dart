import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:movie_list/models/movie_model.dart';

class MovieTile extends StatelessWidget {
  const MovieTile(
      {Key? key,
      required this.movie,
      required this.onDeletePressed,
      required this.onEditPressed})
      : super(key: key);
  final Movie movie;
  final void Function() onDeletePressed, onEditPressed;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableStrechActionPane(),
      actions: [
        IconSlideAction(
          caption: 'Delete',
          icon: Icons.delete_outlined,
          color: Colors.redAccent,
          onTap: onDeletePressed,
        ),
      ],
      secondaryActions: [
        IconSlideAction(
          caption: 'Edit',
          icon: Icons.mode_edit_outline_outlined,
          color: Colors.purpleAccent,
          onTap: onEditPressed,
        ),
      ],
      child: ListTile(
        title: Text(movie.name),
        subtitle: Text(movie.directors.join(' | ')),
        leading: movie.posterBytes.isEmpty
            ? Image.asset('assets/images/poster-icon.png')
            : Image.memory(
                movie.posterBytes,
                fit: BoxFit.contain,
              ),
        trailing: Icon(
          movie.watched ? Icons.playlist_add_check : Icons.playlist_play,
          color: movie.watched ? Colors.greenAccent : Colors.amber[700],
          size: 32.0,
        ),
      ),
    );
  }
}
