import 'package:flutter/material.dart';

import 'music_player.dart';

class RadioPage extends StatefulWidget {
  const RadioPage({super.key});

  @override
  State<RadioPage> createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {
  List radio = [
    {
      'text1': 'Music 1',
      'text2': 'The new music matter',
      "topMsg": "Made for you",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/1/1b/Joji_-_Nectar.png",
      "title": "Nectar",
      "artist": "Joji",
      "song": ""
    },
    {
      'text1': 'Music Hits',
      'text2': 'Songs you know and love',
      "topMsg": "New Release",
      "image":
          "https://static.stereogum.com/uploads/2023/03/LDR-Tunnel-1679672318-1000x1000.jpg",
      "title": "Ocean Blvd",
      "artist": "Lana Del Rey",
      "song": ""
    },
    {
      'text1': 'Music Country',
      'text2': 'Where it sounds like home',
      "topMsg": "Featuring Tame Impala",
      "image":
          "https://qodeinteractive.com/magazine/wp-content/uploads/2020/06/16-Tame-Impala.jpg",
      "title": "Tame Impala",
      "artist": "Currents",
      "song": ""
    },
    {
      'text1': 'Music Country',
      'text2': 'Where it sounds like home',
      "topMsg": "Made for you",
      "image":
          "https://t2.gstatic.com/licensed-image?q=tbn:ANd9GcT9kry1myZTi2dMJ7OtgJjmdT__lImpI-pJ9mdq42Cz8HhIet_ro_Obp6q4xbksBbpT",
      "title": "The dark side of the moon",
      "artist": "Pink floyd ",
      "song": ""
    },
    // {
    //   "topMsg": "Featuring Tame Nico",
    //   "image":
    //       "https://upload.wikimedia.org/wikipedia/en/0/0c/Velvet_Underground_and_Nico.jpg",
    //   "title": "The Velvet Underground and Nico",
    //   "artist": "Nico",
    //   "song": ""
    // },
  ];
  List song = [
    {
      "id": "wake_up_01",
      "title": "Intro - The Way Of Waking Up (feat. Alan Watts)",
      "album": "Wake Up",
      "artist": "The Kyoto Connection",
      "genre": "Electronic",
      "source":
          "https://storage.googleapis.com/uamp/The_Kyoto_Connection_-_Wake_Up/01_-_Intro_-_The_Way_Of_Waking_Up_feat_Alan_Watts.mp3",
      "image":
          "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/love-song-mixtape-album-cover-template-design-250a66b33422287542e2690b437f881b_screen.jpg?ts=1635176340",
      "trackNumber": 1,
      "totalTrackCount": 13,
      "duration": 90,
      "site":
          "http://freemusicarchive.org/music/The_Kyoto_Connection/Wake_Up_1957/"
    },
    {
      "id": "wake_up_02",
      "title": "Geisha",
      "album": "Wake Up",
      "artist": "The Kyoto Connection",
      "genre": "Electronic",
      "source":
          "https://storage.googleapis.com/uamp/The_Kyoto_Connection_-_Wake_Up/02_-_Geisha.mp3",
      "image":
          "https://storage.googleapis.com/uamp/The_Kyoto_Connection_-_Wake_Up/art.jpg",
      "trackNumber": 2,
      "totalTrackCount": 13,
      "duration": 267,
      "site":
          "http://freemusicarchive.org/music/The_Kyoto_Connection/Wake_Up_1957/"
    },
    {
      "id": "tell_the_angels",
      "title": "Tell The Angels",
      "album": "Youtube Audio Library Rock",
      "artist": "Letter Box",
      "genre": "Rock",
      "source":
          "https://storage.googleapis.com/automotive-media/Tell_The_Angels.mp3",
      "image":
          "https://storage.googleapis.com/automotive-media/album_art_2.jpg",
      "trackNumber": 6,
      "totalTrackCount": 7,
      "duration": 208,
      "site": "https://www.youtube.com/audiolibrary/music"
    },
    {
      "id": "the_coldest_shoulder",
      "title": "The Coldest Shoulder",
      "album": "Youtube Audio Library Rock 2",
      "artist": "The 126ers",
      "genre": "Rock",
      "source":
          "https://storage.googleapis.com/automotive-media/The_Coldest_Shoulder.mp3",
      "image":
          "https://storage.googleapis.com/automotive-media/album_art_3.jpg",
      "trackNumber": 2,
      "totalTrackCount": 2,
      "duration": 160,
      "site": "https://www.youtube.com/audiolibrary/music"
    },
    {
      "id": "spatial_01",
      "title": "Pre-game marching band",
      "album": "Spatial Audio",
      "artist": "Watson Wu",
      "genre": "People",
      "source":
          "https://storage.googleapis.com/uamp/Spatial Audio/Marching band.wav",
      "image":
          "https://storage.googleapis.com/uamp/Spatial Audio/Marching band.jpg",
      "trackNumber": 1,
      "totalTrackCount": 6,
      "duration": 56,
      "site": "https://library.soundfield.com/track/163"
    },
    {
      "id": "spatial_02",
      "title": "Chickens on a farm",
      "album": "Spatial Audio",
      "artist": "Watson Wu",
      "genre": "Animals",
      "source":
          "https://storage.googleapis.com/uamp/Spatial Audio/Chickens.wav",
      "image": "https://storage.googleapis.com/uamp/Spatial Audio/Chickens.jpg",
      "trackNumber": 2,
      "totalTrackCount": 6,
      "duration": 180,
      "site": "https://library.soundfield.com/track/129"
    },
    {
      "id": "spatial_03",
      "title": "Rural market busker",
      "album": "Spatial Audio",
      "artist": "Stephan Schutze",
      "genre": "Ambience",
      "source":
          "https://storage.googleapis.com/uamp/Spatial Audio/Rural market.wav",
      "image":
          "https://storage.googleapis.com/uamp/Spatial Audio/Rural market.jpg",
      "trackNumber": 3,
      "totalTrackCount": 6,
      "duration": 299,
      "site": "https://library.soundfield.com/track/55"
    },
    {
      "id": "spatial_04",
      "title": "Steamtrain interior",
      "album": "Spatial Audio",
      "artist": "Stephan Schutze",
      "genre": "Ambience",
      "source":
          "https://storage.googleapis.com/uamp/Spatial Audio/Steamtrain.wav",
      "image":
          "https://storage.googleapis.com/uamp/Spatial Audio/Steamtrain.jpg",
      "trackNumber": 4,
      "totalTrackCount": 6,
      "duration": 296,
      "site": "https://library.soundfield.com/track/65"
    },
    {
      "id": "spatial_05",
      "title": "Rural road car pass",
      "album": "Spatial Audio",
      "artist": "Stephan Schutze",
      "genre": "Ambience",
      "source":
          "https://storage.googleapis.com/uamp/Spatial Audio/Car pass.wav",
      "image":
          "https://i.pinimg.com/474x/63/d8/c2/63d8c24d77ea080d1a8dcb1cca2a683e.jpg",
      "trackNumber": 5,
      "totalTrackCount": 6,
      "duration": 302,
      "site": "https://library.soundfield.com/track/57"
    },
    {
      "id": "spatial_06",
      "title": "10 feet from shore",
      "album": "Spatial Audio",
      "artist": "Watson Wu",
      "genre": "Ambience",
      "source": "https://storage.googleapis.com/uamp/Spatial Audio/Shore.wav",
      "image":
          "https://i.pinimg.com/474x/aa/ec/28/aaec2887892340a23889a4e98d44afcb.jpg",
      "trackNumber": 6,
      "totalTrackCount": 6,
      "duration": 180,
      "site": "https://library.soundfield.com/track/114"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Text(
          "Radio",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
        ),
        actions: [
          Container(
            // color: Colors.amber,
            padding: EdgeInsets.only(right: 5),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.account_circle_rounded,
                  size: 40,
                )),
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            // height: 600,
            child: Column(children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                // color: Colors.amber,
                child: Column(
                  children: [
                    Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      // padding: EdgeInsets.all(5),
                                      child: Icon(
                                        Icons.apple,
                                        size: 25,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(left: 1),
                                        child: Text(radio[0]['text1'],
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold))),
                                  ],
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(radio[0]['text2'],
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 15))),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 15),
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(150),
                                color: Color.fromARGB(84, 110, 110, 110),
                              ),
                              child: Icon(
                                Icons.calendar_month_rounded,
                                color: Colors.red,
                                size: 25,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          // color: Colors.amber,
                          margin: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipPath(
                                clipper: ShapeBorderClipper(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15)),
                                  ),
                                ),
                                child: Image.network(
                                  radio[0]['image'],
                                  height: 280,
                                  width: 380,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              ClipPath(
                                clipper: ShapeBorderClipper(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15)),
                                  ),
                                ),
                                child: Container(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  height: 100,
                                  width: 380,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                    colors: [
                                      const Color.fromARGB(255, 83, 83, 83),
                                      Color.fromARGB(255, 65, 65, 65)
                                    ],
                                    stops: [0, 1],
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                  )),

                                  // color: Color.fromARGB(255, 255, 227, 114),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("LIVE • 9:30 - 11:30 PM",
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Text(
                                                  radio[0]['title'],
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                Text(
                                                  radio[0]['artist'],
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 18),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                            Icon(
                                              Icons.play_circle_fill_rounded,
                                              size: 35,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                // color: Colors.amber,
                child: Column(
                  children: [
                    Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      // padding: EdgeInsets.all(5),
                                      child: Icon(
                                        Icons.apple,
                                        size: 25,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(left: 1),
                                        child: Text(radio[1]['text1'],
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold))),
                                  ],
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(radio[1]['text2'],
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 15))),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 15),
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(150),
                                color: Color.fromARGB(84, 110, 110, 110),
                              ),
                              child: Icon(
                                Icons.calendar_month_rounded,
                                color: Colors.red,
                                size: 25,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          // color: Colors.amber,
                          margin: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipPath(
                                clipper: ShapeBorderClipper(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15)),
                                  ),
                                ),
                                child: Image.network(
                                  radio[1]['image'],
                                  height: 280,
                                  width: 380,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              ClipPath(
                                clipper: ShapeBorderClipper(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15)),
                                  ),
                                ),
                                child: Container(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  height: 100,
                                  width: 380,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                    colors: [
                                      const Color.fromARGB(255, 83, 83, 83),
                                      Color.fromARGB(255, 65, 65, 65)
                                    ],
                                    stops: [0, 1],
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                  )),

                                  // color: Color.fromARGB(255, 255, 227, 114),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("LIVE • 9:30 - 11:30 PM",
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Text(
                                                  radio[1]['title'],
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                Text(
                                                  radio[1]['artist'],
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 18),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                            Icon(
                                              Icons.play_circle_fill_rounded,
                                              size: 35,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                // color: Colors.amber,
                child: Column(
                  children: [
                    Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      // padding: EdgeInsets.all(5),
                                      child: Icon(
                                        Icons.apple,
                                        size: 25,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(left: 1),
                                        child: Text(radio[2]['text1'],
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold))),
                                  ],
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(radio[2]['text2'],
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 15))),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 15),
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(150),
                                color: Color.fromARGB(84, 110, 110, 110),
                              ),
                              child: Icon(
                                Icons.calendar_month_rounded,
                                color: Colors.red,
                                size: 25,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          // color: Colors.amber,
                          margin: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipPath(
                                clipper: ShapeBorderClipper(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15)),
                                  ),
                                ),
                                child: Image.network(
                                  radio[2]['image'],
                                  height: 280,
                                  width: 380,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              ClipPath(
                                clipper: ShapeBorderClipper(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15)),
                                  ),
                                ),
                                child: Container(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  height: 100,
                                  width: 380,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                    colors: [
                                      const Color.fromARGB(255, 83, 83, 83),
                                      Color.fromARGB(255, 65, 65, 65)
                                    ],
                                    stops: [0, 1],
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                  )),

                                  // color: Color.fromARGB(255, 255, 227, 114),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("LIVE • 9:30 - 11:30 PM",
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Text(
                                                  radio[2]['title'],
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                Text(
                                                  radio[2]['artist'],
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 18),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                            Icon(
                                              Icons.play_circle_fill_rounded,
                                              size: 35,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ]),
          ),
          Container(
            // color: Colors.amber,
            margin: EdgeInsets.only(top: 20),
            height: 30,
            padding: EdgeInsets.only(left: 15),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/musiclist');
              },
              child: Row(
                children: [
                  Text(
                    "Recently Played",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Container(
            // color: Color.fromARGB(255, 5, 69, 68),
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(10),
              itemCount: 10,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MusicPlayer(index: index)),
                    );
                  },
                  child: Container(
                    // color: Colors.amber,
                    margin: EdgeInsets.only(right: 10, left: 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        ClipPath(
                          clipper: ShapeBorderClipper(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Image.network(
                            song[index]['image'],
                            height: 170,
                            width: 170,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(padding: EdgeInsets.only(top: 2.5)),
                            Container(
                              width: 165,
                              // color: Colors.amberAccent,
                              child: Text(
                                song[index]['title'],
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                    color: Colors.white),
                              ),
                            ),
                            Text(
                              song[index]['artist'],
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12,
                                  color: Colors.grey),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      )),
    );
  }
}
