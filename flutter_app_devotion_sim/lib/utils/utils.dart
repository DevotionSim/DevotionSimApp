import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_app_devotion_sim/classes/stats.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

// Method to load .json locally
Future<String> getJson(String source) {
  return rootBundle.loadString(source);
}

// Method to transform .json in classes
Future<List<Stats>?> jsonStats(String source) async{
  final my_data = jsonDecode(await getJson(source)).cast<Map<String, dynamic>>();
  return my_data.map<Stats>((json) => Stats.fromJson(json)).toList();
}

// Method to GET .json from network (need to config access-control-allow-origin)
Future<Stats> fetchStats(http.Client client) async {
  final response = await client
      .get(Uri.parse('https://drive.google.com/file/d/1K_uMpXeOd1bkv-OWnNj22p-VzWkstApw/view'));
  // Use the compute function to run parseStats in a separate isolate.
  return Stats.fromJson(jsonDecode(response.body));
}

// A function that converts a response body into a List<Stats>.
List<Stats>? parseStats(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Stats>((json) => Stats.fromJson(json)).toList();
}

// Method to sleep
Future<void> wait(Duration d) => new Future.delayed(d);

// Method to work with JSON when is loaded from network
// https://flutter.dev/docs/cookbook/networking/fetch-data
Widget builder () {
  return FutureBuilder<Stats>(
      future: fetchStats(http.Client()),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data == null) {
            return Text('no data');
          } else {
            return Text('data present');
          }
        } else if (snapshot.connectionState == ConnectionState.none) {
          return Text('Error'); // error
        } else {
          return CircularProgressIndicator(); // loading
        }
      }
  );
}