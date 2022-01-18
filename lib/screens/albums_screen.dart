import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_project/bloc/albums/bloc.dart';
import 'package:flutter_bloc_project/bloc/albums/events.dart';
import 'package:flutter_bloc_project/bloc/albums/states.dart';
import 'package:flutter_bloc_project/bloc/theme/theme_bloc.dart';
import 'package:flutter_bloc_project/bloc/theme/theme_events.dart';
import 'package:flutter_bloc_project/model/albums_list.dart';
import 'package:flutter_bloc_project/settings/app_themes.dart';
import 'package:flutter_bloc_project/widgets/error.dart';
import 'package:flutter_bloc_project/widgets/list_row.dart';
import 'package:flutter_bloc_project/widgets/loading.dart';
import 'package:flutter_bloc_project/widgets/txt.dart';

class AlbumsScreen extends StatefulWidget {
  @override
  _AlbumsScreenState createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends State<AlbumsScreen> {
  //

  @override
  void initState() {
    super.initState();
    // _loadTheme();
    _loadAlbums();
  }

  // _loadTheme() async {
  //   context.bloc<ThemeBloc>().add(ThemeEvent(appTheme: Preferences.getTheme()));
  // }

  _loadAlbums() async {
    BlocProvider.of<AlbumsBloc>(context).add(AlbumEvents.fetchAlbums);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: Txt(text: 'Albums'),
      ),
      body: Container(
        child: _body(),
      ),
    );
  }

  _body() {
    return Column(
      children: [
        BlocBuilder<AlbumsBloc, AlbumsState>(
            builder: (BuildContext context, AlbumsState state) {
          if (state is AlbumsListError) {
            final error = state.error;
            String message = '${error.message}\nTap to Retry.';
            return ErrorTxt(
              message: message,
              onTap: _loadAlbums,
            );
          }
          if (state is AlbumsLoaded) {
            List<Album> albums = state.albums;
            return _list(albums);
          }
          return Loading();
        }),
      ],
    );
  }

  Widget _list(List<Album> albums) {
    return Expanded(
      child: ListView.builder(
        itemCount: albums.length,
        itemBuilder: (_, index) {
          Album album = albums[index];
          return ListRow(album: album);
        },
      ),
    );
  }
}
