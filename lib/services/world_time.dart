import 'dart:convert';
//import 'dart:html';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class WorldTime{
  late String location; //location name for the ui
  String time="";  //the time in that location
  String flag;      //url to an asset flag icon
  String url;    //location url for api endpoint
  late bool isDaytime;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async{
    try{
      Response response1= await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data=jsonDecode(response1.body);
      // print(data);
      // print(data['title']);

      //get properties from data
      String datetime=data['datetime'];
      // String offset1=data['utc_offset'].substring(1,3);
      // String offset2 = data['utc_offset'].substring(4,6);
      // print(datetime);
      // print(offset);

      //create a datetime object
      DateTime now = DateTime.parse(datetime.substring(0,26));
      //now=now.add(Duration(hours: int.parse(offset1),minutes:int.parse(offset2)));
     // print(now);

      //set the time property
      isDaytime = now.hour>6 && now.hour<20 ? true:false;
      time=DateFormat.jm().format(now);

    }

    catch(e){
      print('caught error:$e');
      time='could not get the data';
    }



  }



}

