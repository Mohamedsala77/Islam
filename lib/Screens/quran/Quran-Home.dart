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
    return Scaffold(
        appBar: AppBar(
          title: Text("قرأن كريم"),
        ),
        body: Container(
          child: FutureBuilder(
              future: quranServer.QuranData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Surah> surah = snapshot.data;
                  return Container(
                    child: PageView.builder(
                        itemCount: 603,
                        itemBuilder: (context, index) {
                          List<String> text = [];
                          List<String> surahName = [];
                          for (int i = 0; i < surah.length; i++) {
                            int ayahLenght = surah[i].ayahs.length;
                            for (int b = 0; b < ayahLenght; b++) {
                              if (surah[i].ayahs[b].page == (index + 1)) {
                                text.add(surah[i].ayahs[b].text);
                                if (surah[i].ayahs[b].page == 48) {
                                }
                                if (i <= surah[i].ayahs[b].text.length) {
                                  surahName.add(surah[i].name);
                                } else {
                                  surahName.add(surah[i + 1].name);
                                }
                              }
                            }
                          }
                          return Column(
                            children: [
                              Text(
                                text.toString(),
                                textAlign: TextAlign.start,
                                style: TextStyle(fontSize: 20),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                (index + 1).toString(),
                                textAlign: TextAlign.start,
                                style: TextStyle(fontSize: 30),
                              ),
                              Text(
                                surahName[1].toString(),
                                textAlign: TextAlign.start,
                                style: TextStyle(fontSize: 30),
                              )
                            ],
                          );
                        }),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ));
  }
}
