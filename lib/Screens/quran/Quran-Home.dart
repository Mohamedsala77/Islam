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
    return Scaffold(appBar: AppBar(title: Text(" قراءن كريم"),
    ), body: Container(
      child: FutureBuilder(future: quranServer.QuranData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Surah> surah = snapshot.data;
                 List<Ayahs> listayah=[];
                for(int i=0;i<surah.length;i++){
                  int ayahLenght=surah[i].ayahs.length;
                  for(int b=0;b<ayahLenght;b++){
               listayah.add( surah[i].ayahs[b]);
                  }
                }
              return Container(
                child: PageView.builder(
                    itemCount: 603, itemBuilder: (context, index) {
                  return (Container(
                    child:


                    Stack(

                      children:[ Wrap(
                          children: listayah.map((e) => Text((e.page== index+1)?e.text+e.numberInSurah.toString():"",style: TextStyle(fontSize: 20),)).toList()),
                        Transform.translate(
                          offset: Offset(-150,MediaQuery.of(context).size.height-150),
                          child:Container(
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(30)),
                            width: 60,
                            height: 60,

                            child: FlatButton(
                              child: Text((index+1).toString(),style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black)),
                            ),
                          ),
                        )
                   ] ),
                  ));
                }),
              );
            } else {
              return Center(child: CircularProgressIndicator(),);
            }
          }),
    ));
  }
}
