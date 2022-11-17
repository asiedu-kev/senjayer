import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:senjayer/data/models/event.dart';

class EventList {
  final String listTitle;
  final List<Event> events;
  EventList({
    required this.listTitle,
    required this.events,
  });

  EventList copyWith({
    String? listTitle,
    List<Event>? events,
  }) {
    return EventList(
      listTitle: listTitle ?? this.listTitle,
      events: events ?? this.events,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'listTitle': listTitle,
      'events': events.map((x) => x.toMap()).toList(),
    };
  }

  factory EventList.fromMap(Map<String, dynamic> map) {
    return EventList(
      listTitle: map['listTitle'] ?? '',
      events: List<Event>.from(map['events']?.map((x) => Event.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory EventList.fromJson(String source) =>
      EventList.fromMap(json.decode(source));

  @override
  String toString() => 'EventList(listTitle: $listTitle, events: $events)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EventList &&
        other.listTitle == listTitle &&
        listEquals(other.events, events);
  }

  @override
  int get hashCode => listTitle.hashCode ^ events.hashCode;
}

List<EventList> demoLists = [
  EventList(
    listTitle: "Tendance",
    events: demoEvents,
  ),
  EventList(
    listTitle: "Aujourd'hui",
    events: demoEvents,
  ),
  EventList(
    listTitle: "Recommandation",
    events: demoEvents,
  ),
];