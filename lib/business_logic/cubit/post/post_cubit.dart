import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senjayer/data/models/post.dart';
import 'package:senjayer/data/repositories/post_repository.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostIsFetching());

  void getPosts() async {
    final PostRepository postRepository = PostRepository();
    emit(PostIsFetching());
    final getPostsEither = await postRepository.getPosts();
    getPostsEither.fold(
      (_) => emit(PostFetchingFailed()),
      (posts) => posts.isEmpty
          ? emit(PostIsEmpty())
          : emit(
              PostFetched(posts: posts),
            ),
    );
  }
}
