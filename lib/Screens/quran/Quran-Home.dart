import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran/Model/Ahya.dart';
import 'package:quran/Model/QuranModel.dart';
import 'package:quran/server/quranApi.dart';

class QHome extends StatefulWidget {
  @override
  _QHomeState createState() => _QHomeState();
}

class _QHomeState extends State<QHome> {
  @override
  Widget build(BuildContext context) {
    QuranServer quranServer = QuranServer();
    return Scaffold(appBar: AppBar(title: Text("ٌران كريم"),
    ), body: Container(
      child: FutureBuilder(future: quranServer.QuranData(),
          builder: (context, snapshot) {
            List<Surah> surah = snapshot.data;
            if (snapshot.hasData) {
              return Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width
                , height: MediaQuery
                  .of(context)
                  .size
                  .height,
                child: PageView.builder(
                  itemCount: 603, itemBuilder: (context, index) {
                    int i;
                    int b;
                  for(i=0;i<surah.length;i++){
                    int ayahLength=surah[i].ayahs.length;
                    for( b=0;b<ayahLength;b++){
                      print(surah[i].ayahs[b].text+surah[i].ayahs[b].numberInSurah.toString());
                  }}
                  return (Container(child:
                  Text( "${index+1}",style: TextStyle(fontSize: 30,color: Colors.black),),
                    padding: EdgeInsets.all(15), width: MediaQuery
                        .of(context)
                        .size
                        .width
                    , height: MediaQuery
                        .of(context)
                        .size
                        .height
                    ,));
                }),
              );
            } else {
              return Center(child: CircularProgressIndicator(),);
            }
          }),
    ));
  }
}
