import 'package:flutter/material.dart';

class TiktokPage extends StatefulWidget {
  const TiktokPage({Key? key}) : super(key: key);

  @override
  State<TiktokPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<TiktokPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 40,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Icon(
              Icons.home,
            ),
            const Icon(
              Icons.people_alt,
            ),
            const Icon(
              Icons.add_box_rounded,
            ),
            const Icon(
              Icons.message,
            ),
            const Icon(
              Icons.person,
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          ///lowermost content
          Container(
            color: Colors.black,
          ),

          //follow following text
          Positioned(
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.values[2],
                children: const [
                  Padding(padding: EdgeInsets.all(6.0)),
                  Icon(
                    Icons.live_tv,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Following     For You ",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),

          ///rightside for  profilecontainer & like , comment , bookmark , share , music button

          Positioned(
            right: 0,
            bottom: 170,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20)),
                  width: 40,
                  height: 40,
                  child: Icon(Icons.person),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Icon(
                  Icons.comment,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Icon(
                  Icons.bookmark,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Icon(
                  Icons.share,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[350],
                      borderRadius: BorderRadius.circular(20)),
                  width: 40,
                  height: 40,
                  child: const Icon(Icons.music_note),
                ),
              ],
            ),
          ),

          ///caption
          Positioned(
            left: 0,
            bottom: 20,
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Padding(padding: EdgeInsets.only(left: 0)),
                        const Text(
                          "@suprim_01",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white),
                        ),
                        const Icon(
                          Icons.verified,
                          color: Colors.blue,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        const Text(
                          "1h ago",
                          style: TextStyle(
                              fontWeight: FontWeight.w100,
                              fontSize: 10,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "making tiktok UI as an assignment",
                      style: TextStyle(color: Colors.white),
                    ),
                    const Text(
                      "#fyp #diy #keepexploring #suprimtamang:)",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
