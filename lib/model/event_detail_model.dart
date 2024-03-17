// To parse this JSON data, do
//
//     final eventDetailModel = eventDetailModelFromJson(jsonString);

import 'dart:convert';

EventDetailModel eventDetailModelFromJson(String str) =>
    EventDetailModel.fromJson(json.decode(str));

String eventDetailModelToJson(EventDetailModel data) =>
    json.encode(data.toJson());

class EventDetailModel {
  final String? id;
  final String? title;
  final dynamic subtitle;
  final String? description;
  final DateTime? eventDatetime;
  final String? location;

  EventDetailModel({
    this.id,
    this.title,
    this.subtitle,
    this.description,
    this.eventDatetime,
    this.location,
  });

  factory EventDetailModel.fromJson(Map<String, dynamic> json) =>
      EventDetailModel(
        id: json["id"],
        title: json["title"],
        subtitle: json["subtitle"],
        description: json["description"],
        eventDatetime: json["event_datetime"] == null
            ? null
            : DateTime.parse(json["event_datetime"]),
        location: json["location"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "subtitle": subtitle,
        "description": description,
        "event_datetime": eventDatetime?.toIso8601String(),
        "location": location,
      };
}
