part of 'post_cubit.dart';

@immutable
abstract class PostState {}

class PostIsFetching extends PostState {}

class PostFetched extends PostState {
  final List<Post> posts;
  PostFetched({
    required this.posts,
  });
}

class PostFetchingFailed extends PostState {}

class PostIsEmpty extends PostState {}
