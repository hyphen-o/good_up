import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';


class AlarmScreen extends StatefulWidget {
  @override
  _AlarmState createState() => _AlarmState();
}

class _AlarmState extends State<AlarmScreen> {
  bool _timeSet = false;
  TimeOfDay _time = TimeOfDay.now();
  var _day = DateTime
      .now()
      .day;
  var _month = DateTime
      .now()
      .month;
  var _year = DateTime
      .now()
      .year;
  int _hour = 0;
  int _minute = 0;
  var timeInMillies;


  void startAlarmService(BuildContext context) async {
    var methodChannel = MethodChannel("cheeseball.demo_alarm_manager");
    String data =
    await methodChannel.invokeMethod(
        "startAlarm", [timeInMillies, _hour, _minute]);
    debugPrint(data);
    showToast(context, data);
  }

  void deleteAlarm(BuildContext context) async {
    var methodChannel = MethodChannel("cheeseball.demo_alarm_manager");
    String data = await methodChannel.invokeMethod("deleteAlarm");
    debugPrint(data);
    showToast(context, data);
  }

  void showToast(BuildContext context, String data) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(data),));
  }

  void _selectTime(BuildContext context) async {
    TimeOfDay? picked =
    await showTimePicker(context: context, initialTime: _time);

    if (picked != null && picked != _time) {
      print("Time Current: ${_time.toString().substring(10, 15)}");
      setState(() {
        _time = picked;
        _timeSet = true;
        _hour = int.parse(_time.toString().substring(10, 12));
        _minute = int.parse(_time.toString().substring(13, 15));
        timeInMillies = DateTime(_year, _month, _day, _hour, _minute)
            .millisecondsSinceEpoch;
        print(timeInMillies);
        startAlarmService(context);
      });
    }
    if (_time == TimeOfDay.now()){
      FlutterRingtonePlayer.playAlarm(
        looping: true, // Androidのみ。ストップするまで繰り返す
        asAlarm: true, // Androidのみ。サイレントモードでも音を鳴らす
        volume: 0.5, // Androidのみ。0.0〜1.0
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.access_alarm),
        title: Text("アラーム"),
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
      ),
      body: Builder(
        builder: (context) =>
            Container(
              child: Center(
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _timeSet
                        ? Text(_time.toString().substring(10, 15))
                        : Container(),
                    ButtonTheme(
                      minWidth: 300.0,
                      height: 200.0,
                    child: ElevatedButton.icon(
                        icon: const Icon(
                          Icons.alarm_add,
                          color: Colors.white,
                        ),
                        label: const Text('アラームを設定する'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.lightGreen,
                          onPrimary: Colors.white,
                        ),
                        onPressed: () {
                          _selectTime(context);
                        }),
                    ),
                    _timeSet
                        ? ElevatedButton(
                      child: Text(
                          "Delete Alarm for ${_time.toString().substring(
                              10, 15)}"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.redAccent,
                        onPrimary: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          _timeSet = false;
                        });
                        deleteAlarm(context);
                      },
                    )
                        : Container()
                  ],
                ),
              ),
            ),
      ),
    );
  }
}