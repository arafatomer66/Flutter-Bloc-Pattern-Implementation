import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_project/model/albums_list.dart';

abstract class AlbumsState extends Equatable {
  @override
  List<Object> get props => [];
}

class AlbumsInitState extends AlbumsState {}

class AlbumsLoading extends AlbumsState {}

class AlbumsLoaded extends AlbumsState {
  List<Album> albums = [];
  AlbumsLoaded({required this.albums});
}

class AlbumsListError extends AlbumsState {
  final error;
  AlbumsListError({this.error});
}
