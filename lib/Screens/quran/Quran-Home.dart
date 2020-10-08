
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran/Model/QuranModel.dart';
import 'package:quran/server/quranApi.dart';
class QHome extends StatefulWidget {
  @override
  _QHomeState createState() => _QHomeState();
}

class _QHomeState extends State<QHome> {
  @override
  Widget build(BuildContext context) {
    QuranServer quranServer=QuranServer();
    quranServer.QuranData();
    return Scaffold(appBar: AppBar(title: Text("ٌران كريم"),
    ),body: Container(
      child: FutureBuilder(future: quranServer.QuranData(),
          builder: (context,snapshot){
        List<Surah> surah=snapshot.data;
        if(snapshot.hasData){
          return Container(
            width: MediaQuery.of(context).size.width
            ,height: MediaQuery.of(context).size.height,
            child: ListView.builder(itemCount: surah.length,itemBuilder: (context,index){
              return (Container(child: Text(surah[index].name.toString())
                ,padding: EdgeInsets.all(15),width: MediaQuery.of(context).size.width
                ,height: MediaQuery.of(context).size.height
                ,));
            },),
          );
        }else{
return Center(child: CircularProgressIndicator(),);        }
      }),
    ));
  }
}
