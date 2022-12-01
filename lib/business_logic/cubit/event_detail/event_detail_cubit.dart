import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:senjayer/data/models/actor.dart';
import 'package:senjayer/data/models/category.dart';
import 'package:senjayer/data/repositories/events_repository.dart';

part 'event_detail_state.dart';

class EventDetailCubit extends Cubit<EventDetailState> {
  EventDetailCubit() : super(EventDetailFetching());

  void getEventDetails({required int categoryId, required int userId}) async {
    Category? category;
    Actor? organizer;
    final EventsRepository eventsRepository = EventsRepository();
    emit(EventDetailFetching());
    final getCategoryDetailsEither =
        await eventsRepository.getCategoryDetails(categoryId);
    getCategoryDetailsEither.fold((_) {
      emit(EventDetailFetchingFailed());
    }, (fetchedCategory) {
      category = fetchedCategory;
    });
    final getOrganizerEither = await eventsRepository.getUserDetails(userId);
    getOrganizerEither.fold((_) {
      emit(EventDetailFetchingFailed());
    }, (actor) {
      organizer = actor;
    });
    if (category != null && organizer != null) {
      emit(EventDetailFetched(category: category!, actor: organizer!));
    }
  }
}
