import 'package:flutter/material.dart';
import './main.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:zeitgeist/StarNight.dart' as StarNight;
import 'package:zeitgeist/Detail.dart' as Detail;
import 'package:zeitgeist/SampleEvent.dart' as Sample;

class MyApp extends StatefulWidget {
  int page;
  MyApp(int p){
    page = p;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState(page);
  }
}

class MyAppState extends State<MyApp> {

  int _selectedPage = 0,page;
  var _pageOptions;

  MyAppState(int p){
    page = p;
    if(page==1)
    {
      _pageOptions = [
        getListViewDay1(),
        StarNight.StarNight(),

        //Text('Day 1 Competions',textAlign: TextAlign.center,),
        //Text('Day 1 Pro nights',textAlign: TextAlign.center,)
      ];
    }
    else if (page == 2)
    {
      _pageOptions = [
        getListViewDay2(),
        StarNight.StarNight(),
        //getListTile('event_name', 'event_category', 'time'),
      ];
    }

    else if (page == 3)
    {
      _pageOptions = [
        getListViewDay3(),
        StarNight.StarNight(),
        //getListTile('event_name', 'event_category', 'time'),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        //debugShowCheckedModeBanner: false,
        //theme: ThemeData(primarySwatch: Colors.blue),
          backgroundColor: Colors.white,
          body: _pageOptions[_selectedPage],
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              // sets the background color of the `BottomNavigationBar`
                canvasColor: Color.fromRGBO(139,0,0,1),
                // sets the active color of the `BottomNavigationBar` if `Brightness` is light
                primaryColor: Colors.white,
                textTheme: Theme
                    .of(context)
                    .textTheme
                    .copyWith(caption: new TextStyle(color: Colors.white))),
            child:BottomNavigationBar(
                currentIndex: _selectedPage,
                onTap: (int index) {
                  setState(() {
                    _selectedPage = index;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.event), title: Text('Schedule'),backgroundColor: Color.fromRGBO(166, 16, 30, 1)),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.star), title: Text('Pro-Nights'),backgroundColor: Color.fromRGBO(166, 16, 30, 1)),
                ]),
          )

        );
  }

  Future<List<Sample.SampleEvent>> _getEventday1() async{
    var data = await http.get("http://www.zeitgeist.org.in/data-api/events/");
    var jsonData = json.decode(data.body);

    List<Sample.SampleEvent> sampleEvents=[];
    for(var u in jsonData){

      Sample.SampleEvent sampleEvent = Sample.SampleEvent(u['name'], u['start_date_time'], u['description']);
      String s="";
      for(var i=0;i<10;i++)
        {
          s+=sampleEvent.start_date_time[i];
        }

      if(s=='2019-10-11')
        {
          sampleEvents.add(sampleEvent);
        }
      //events.add(event);
    }

    print(sampleEvents.length);
    return sampleEvents;
  }

  Future<List<Sample.SampleEvent>> _getEventday2() async{
    var data = await http.get("http://www.zeitgeist.org.in/data-api/events/");
    var jsonData = json.decode(data.body);

    List<Sample.SampleEvent> sampleEvents=[];

    for(var u in jsonData){
      Sample.SampleEvent sampleEvent = Sample.SampleEvent(u['name'], u['start_date_time'], u['description']);
      String s="";
      for(var i=0;i<10;i++)
      {
        s+=sampleEvent.start_date_time[i];
      }

      if(s=='2019-10-12')
      {
        sampleEvents.add(sampleEvent);
      }
      //events.add(event);
    }

    print(sampleEvents.length);
    return sampleEvents;
  }

  Future<List<Sample.SampleEvent>> _getEventday3() async{
    var data = await http.get("http://www.zeitgeist.org.in/data-api/events/");
    var jsonData = json.decode(data.body);

    List<Sample.SampleEvent> sampleEvents=[];
    for(var u in jsonData){


      Sample.SampleEvent sampleEvent = Sample.SampleEvent(u['name'], u['start_date_time'], u['description']);
      String s="";
      for(var i=0;i<10;i++)
      {
        s+=sampleEvent.start_date_time[i];
      }

      if(s=='2019-10-13')
      {
        sampleEvents.add(sampleEvent);
      }
      //events.add(event);
    }

    print(sampleEvents.length);
    return sampleEvents;
  }

  Widget getListViewDay1() {
    /*var listView = ListView
      children: <Widget>[
        getListTile('a1', 'b1', 't1'),
        getListTile('a2', 'b2', 't2'),
        getListTile('a3', 'b3', 't3'),

      ],
    );
    return listView;*/

    return Container(
        child: FutureBuilder(
          future: _getEventday1(),
          builder: (BuildContext context,AsyncSnapshot snapshot){

            if(snapshot.data==null){
              return Container(
                child: Center(
                  child: Text("Loading....",
                  style: TextStyle(
                    color: Colors.black
                  ),),
                ),
              );
            }
            else{
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context,int index){
                  return getListTile
                    (snapshot.data[index]);

                },
              );
            }},
        )
    );
  }

  Widget getListViewDay2() {
    /*var listView = ListView(
      children: <Widget>[
        getListTile('a1', 'b1', 't1'),
        getListTile('a2', 'b2', 't2'),
        getListTile('a3', 'b3', 't3'),

      ],
    );
    return listView;*/

    return Container(
        child: FutureBuilder(
          future: _getEventday2(),
          builder: (BuildContext context,AsyncSnapshot snapshot){

            if(snapshot.data==null){
              return Container(
                child: Center(
                  child: Text("Loading....",
                  style: TextStyle(
                    color: Colors.black
                  ),),
                ),
              );
            }
            else{
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context,int index){
                  return getListTile
                    (snapshot.data[index]);

                },
              );
            }},
        )
    );
  }

 Widget getListViewDay3() {
   /* var listView = ListView(
      children: <Widget>[
        getListTile('a1', 'b1', 't1'),
        getListTile('a2', 'b2', 't2'),
        getListTile('a3', 'b3', 't3'),

      ],
    );
    return listView;*/

    return Container(
        child: FutureBuilder(
          future: _getEventday3(),
          builder: (BuildContext context,AsyncSnapshot snapshot){

            if(snapshot.data==null){
              return Container(
                child: Center(
                  child: Text("Loading....",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black
                    ),),
                ),
              );
            }
            else{
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context,int index){
                  return getListTile
                    (snapshot.data[index]);

                },
              );
            }},
        )
    );
  }

  Widget getListTile(Sample.SampleEvent sampleEvent) {
   /*var listTile = Card(
        child:ListTile(
          leading: FlightImageAsset(event_name),
          title: Text(event_name,
            style: TextStyle(
                color: Colors.black,
                fontSize: 18
            ),),
          subtitle: Text(event_category,
            style: TextStyle(
                color: Colors.black
            ),),
          trailing: Text(time,
            style: TextStyle(
                color: Colors.black
            ),),
        )
    );

    return listTile;*/

  var listTile = Card(
      color:Color.fromRGBO(255,118,25, 0.88),
     child: ExpansionTile(
         title: Container(
           padding: EdgeInsets.all(0),
           child: ListTile(
             leading: FlightImageAsset(sampleEvent.name),
             title: Text(sampleEvent.name,
               style: TextStyle(
                   color: Colors.white,
                   fontSize: 18,
                   fontWeight: FontWeight.bold
               ),),
             subtitle: Text(sampleEvent.description,
               style: TextStyle(
                   color: Colors.white,
                   fontWeight: FontWeight.bold
               ),),
             onTap: (){
               Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)
               =>Detail.Info(Sample.SampleEvent(sampleEvent.name,sampleEvent.start_date_time,sampleEvent.description))));
             },
             /*trailing: Text(time,
               style: TextStyle(
                   color: Colors.black
               ),),*/
           ),
         ),

       children: <Widget>[
         Detail.Info(Sample.SampleEvent(sampleEvent.name,sampleEvent.start_date_time,sampleEvent.description))
       ],
     )
   );

   return listTile;
  }
}



class FlightImageAsset extends StatelessWidget{
  String name;

  FlightImageAsset(this.name);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AssetImage assetImage;

    if(name=='Calypso' || name=='Tarang' || name=='Waltz' || name=='Junoon' || name=='Smack That' || name=='Groove-Z' || name=='Western Dance'
        || name=='Street Battle' || name=='Tarang (Folk Dance)')
      {
        assetImage = AssetImage('Images/dance.jpg');
      }
    else if(name=='Torque' || name=='Saaz' || name=='Adagio' || name=='Harmony' || name=='Rap-iD' || name=='Capriccio')
      {
        assetImage = AssetImage('Images/music.png');
      }
    else if(name=='MELA Quiz' || name=='General Quiz' || name=='Brainwaves' || name=='Puzzling Quiz' || name=='India Quiz' || name=='Mela Quiz')
      {
        assetImage = AssetImage('Images/quiz.png');
      }
    else if(name=='Fotopedia' || name=='Pixelerator')
      {
        assetImage = AssetImage('Images/camera.jpg');
      }
    else if(name=='CS-GO' || name=='FIFA' || name=='PUBG' || name=='Fifa')
      {
        assetImage = AssetImage('Images/gaming.png');
      }
    else if(name=='Parley' || name=='Melodum' || name=='Spell Bee' || name=='GD' || name=='Extempore' || name=='Turncoat')
      {
        assetImage = AssetImage('Images/debate.png');
      }
    else if(name=='Wall Graffiti' || name=='On The Spot' || name=='Face Painting' || name=='Rangoli' || name=='Doodle 4 Zeitgeist'
        || name=='Poster Designing' || name=='Shoe Designing' || name=='Live sketching' || name=='Poster Making')
      {
        assetImage = AssetImage('Images/paint.jpg');
      }

    else if(name=="Director's Cut" || name=='Ad-Mad' || name=='Dubsmash')
      {
        assetImage = AssetImage('Images/videomaking.jpg');
      }
    else if(name=='Nukkad Natak' || name=='Yatharth' || name=='Chaplin' || name=='Abhivyakti' || name=='Improv')
      {
        assetImage = AssetImage('Images/dramatics.png');
      }
    else
      {
        assetImage = AssetImage('Images/festposter.jpg');
      }

    return Container(
      child: CircleAvatar(
        backgroundImage: assetImage,
        radius: 30,
      ),
    );

    Image image = Image(image: assetImage,
        width: 80,
        height: 80,
        color: null,
        fit: BoxFit.scaleDown,
        alignment: Alignment.center);
    return Container(child:image);
  }

}


