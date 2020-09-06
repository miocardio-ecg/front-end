
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:miocardio_app/libraries/globals.dart' as globals;




class TabAnalisis extends StatefulWidget{
  @override
  _TabAnalisis createState() => _TabAnalisis();
}

class _TabAnalisis extends State<TabAnalisis>{

  Future<List<String>> downloadImage(String signalSelected) async {
    List<String> urls = new List();
    var ref = FirebaseStorage.instance.ref().child('images/'+signalSelected+'/signal_centrada.png');
    var url = await ref.getDownloadURL();
    urls.add(url);

    ref = FirebaseStorage.instance.ref().child('images/'+signalSelected+'/signal_linea_base.png');
    url = await ref.getDownloadURL();
    urls.add(url);

    ref = FirebaseStorage.instance.ref().child('images/'+signalSelected+'/signal_peaks.png');
    url = await ref.getDownloadURL();
    urls.add(url);

    ref = FirebaseStorage.instance.ref().child('images/'+signalSelected+'/signal_recortada.png');
    url = await ref.getDownloadURL();
    urls.add(url);

    ref = FirebaseStorage.instance.ref().child('images/'+signalSelected+'/signal_segmentos.png');
    url = await ref.getDownloadURL();
    urls.add(url);

    ref = FirebaseStorage.instance.ref().child('images/'+signalSelected+'/signal_sin_ruido.png');
    url = await ref.getDownloadURL();
    urls.add(url);

    ref = FirebaseStorage.instance.ref().child('images/'+signalSelected+'/signal_varios.png');
    url = await ref.getDownloadURL();
    urls.add(url);

    return urls;
  }
  Widget _body = Center(
    child: Container(
      height: 50,
      width: 50,
      margin: EdgeInsets.all(5),
      child: CircularProgressIndicator(
        strokeWidth: 2.0,
        valueColor : AlwaysStoppedAnimation(Colors.red),
      ),
    ),
  ); // Default Body

  @override
  void initState(){
    _gotoHomeScreen();
  }

  Widget _gotoHomeScreen() {
    downloadImage(globals.signalSelected).then((value) => {
      if(value==null) {setState(() => _body = Text("no hay la imagen"))}
      else {setState(() =>_body = getListImages(value))}
    });
  }

  @override
  Widget build(BuildContext context) {
    return _body;
  }

  Widget getListImages(List<String> urls){
    return SingleChildScrollView(
      child: Column(
      children: <Widget>[
        Image.network(urls[0]),
        Image.network(urls[1]),
        Image.network(urls[2]),
        Image.network(urls[3]),
        Image.network(urls[4]),
      ],
    ));
  }

}
