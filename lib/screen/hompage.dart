import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import '../model/post.dart';
import '../model/image.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isLoading = false;
  bool hasErrorOccurred = false;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchDataFromServer();
  }

  String bodyText = "this is body";
  List<Hits> image = [];

  fetchDataFromServer() async {
    print("fetching data from server");

    final serverLocation =
        "https://pixabay.com/api/?key=29447421-9244ca6ce36069b8367b5865e&q=yellow+flowers&image_type=photo&pretty=true";

    final uri = Uri.parse(serverLocation);

    print("server url is $serverLocation");
// GET
    print("1. fetching value from server");

    isLoading = true;
    setState(() {});

    var response = http.get(uri);
    response.then((res) {
      final decoded = json.decode(res.body)['hits'];
      image = decoded.map<Hits>((item) {
        final convertedItem = Hits.convertPostsFromJson(item);
        return convertedItem;
      }).toList();

      bodyText = res.body;

      print("body text is-----------:$bodyText");
      isLoading = false;
      setState(() {});
    });
    response.catchError((e) {
      isLoading = false;
      hasErrorOccurred = true;
      errorMessage = e.toString();

      setState(() {});
      print(e);
      setState(() {});
    });

    Widget build(BuildContext context) {
      print("build called");
      return Scaffold(
          body: ListView.builder(
        itemCount: image.length,
        itemBuilder: ((context, index) {
          final Hits _image = image[index];
          return InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Column(children: [
                    Icon(Icons.add),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Instagram",
                      style: TextStyle(fontSize: 35),
                    ),
                    SizedBox(
                      width: 120,
                    ),
                    Row(
                      children: [
                        Icon(Icons.favorite),
                        SizedBox(
                          width: 40,
                        ),
                        Icon(Icons.send),
                      ],
                    ),

                    Flexible(
                        child: SizedBox(
                      height: 130,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Row(
                            children: [
                              //story WALA SECTION
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image(
                                  image: NetworkImage(_image.userImageURL),
                                  height: 65,
                                  width: 65,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: 45,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image(
                                  image: NetworkImage(_image.userImageURL),
                                  height: 65,
                                  width: 65,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: 35,
                              ),
                              //third
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image(
                                  image: NetworkImage(_image.userImageURL),
                                  height: 65,
                                  width: 65,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: 45,
                              ),
                              //fourth
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image(
                                  image: NetworkImage(_image.userImageURL),
                                  height: 65,
                                  width: 65,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: 45,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image(
                                  image: NetworkImage(_image.userImageURL),
                                  height: 65,
                                  width: 65,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: 45,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image(
                                  image: NetworkImage(_image.userImageURL),
                                  height: 65,
                                  width: 65,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: 35,
                              ),
                              //third
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image(
                                  image: NetworkImage(_image.userImageURL),
                                  height: 65,
                                  width: 65,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: 45,
                              ),
                              //fourth
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image(
                                  image: NetworkImage(_image.userImageURL),
                                  height: 65,
                                  width: 65,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),

                    Flexible(
                      child: SizedBox(
                        height: 40,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Your Story",
                                ),
                                Text(" __m_cgain"),
                                Text("_probably--prijesh-"),
                                Text(" mr_saurav"),
                                Text(
                                  "Your Story",
                                ),
                                Text(" __m_cgain"),
                                Text("_probably--prijesh-"),
                                Text(" mr_saurav"),
                                //USERSECTION KO CHILDREN KO BRACKET
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    //USERNAME SECTION
                    Row(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image(
                              image: NetworkImage(_image.userImageURL),
                              height: 65,
                              width: 65,
                              fit: BoxFit.cover,
                            )),
                        SizedBox(
                          width: 20,
                        ),
                        Text("suprim_01  "),
                        Icon(
                          Icons.verified,
                          color: Colors.blue,
                          size: 18,
                        ),
                        SizedBox(
                          width: 200,
                        ),
                        Icon(Icons.more_horiz)
                      ],
                    ),

                    //post section

                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 25),
                        ),
                        Icon(Icons.favorite_border),
                        SizedBox(
                          width: 25,
                        ),
                        Icon(Icons.insert_comment_outlined),
                        SizedBox(
                          width: 25,
                        ),
                        Icon(Icons.send),
                        SizedBox(
                          width: 250,
                        ),
                        Padding(
                            padding: EdgeInsets.fromLTRB(0.0, 10.0, 5.0, 10.0)),
                        Icon(Icons.bookmark)
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                        ),
                        Text("Liked by"),
                        Text(
                          " madhav and others",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text("1 min ago "),
                      ],
                    ),

                    SizedBox(
                      height: 40,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.home),
                        Icon(Icons.search),
                        Icon(Icons.tv),
                        Icon(Icons.shop),
                        Icon(Icons.account_box),
                      ],
                    ),

                    //ending point
                  ]),
                ),
              ));
        }),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildList(),
    );
  }
}
