import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'topic_state.dart';

class TopicCubit extends Cubit<TopicState> {
  TopicCubit()
      : super(
          TopicState(
            currentIndex: 0,
            topics: ["Spectacle", "Exposition", "Musique", "Art", "Culture"],
          ),
        );

  void setTopicIndex(int index) => emit(
        TopicState(currentIndex: index, topics: state.topics),
      );
}
