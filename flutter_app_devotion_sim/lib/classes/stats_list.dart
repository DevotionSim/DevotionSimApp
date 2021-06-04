import 'package:flutter_app_devotion_sim/classes/stats.dart';

class StatsList {
  final String? codeId;
  final String? track;
  final String? lapTime;
  final List<Stats>? statsList;
  final String? date;

  StatsList({
      required this.codeId,
      required this.track,
      required this.lapTime,
      required this.statsList,
      required this.date});

  StatsList.empty(this.codeId, this.track, this.lapTime, this.statsList, this.date);

  factory StatsList.fromJson(dynamic json) {
    var list = json['statsList'] as List;
    List<Stats> statsList = list.map((e) => Stats.fromJson(e)).toList();
    return StatsList(
      codeId: json['codeId'],
      track: json['track'],
      lapTime: json['lapTime'],
      statsList: statsList,
      date: _setDate(json['codeId']),
    );
  }

  static String? _setDate(String bytes) {
    String dateBytes = bytes.substring(23);

    String day = int.parse(dateBytes.substring(0, 8), radix: 2).toString();

    if(day.length < 2) {
      day = '0' + day;
    }

    String month = int.parse(dateBytes.substring(9, 12), radix: 2).toString();

    if(month.length < 2) {
      month = '0' + month;
    }

    String year = int.parse(dateBytes.substring(13, 24), radix: 2).toString();

    String hour = int.parse(dateBytes.substring(25, 32), radix: 2).toString();

    if(hour.length < 2) {
      hour = '0' + hour;
    }

    String minute = int.parse(dateBytes.substring(33, 40), radix: 2).toString();

    if(minute.length < 2) {
      minute = '0' + minute;
    }

    String second = int.parse(dateBytes.substring(41), radix: 2).toString();

    if(second.length < 2) {
      second = '0' + second;
    }

    return "$day/$month/$year - $hour:$minute:$second";
  }
}
