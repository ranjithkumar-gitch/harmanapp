import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harmanapp/helper.dart';

import 'package:harmanapp/models/user_post_model.dart';
//import 'package:list_wheel_scroll_view_nls/list_wheel_scroll_view_nls.dart';

class Subscribers extends StatefulWidget {
  const Subscribers({super.key});

  @override
  State<Subscribers> createState() => _SubscribersState();
}

class _SubscribersState extends State<Subscribers> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return CupertinoTabView(
      builder: (context) => CupertinoPageScaffold(
        backgroundColor: CupertinoColors.black,
        navigationBar: const InstagramTopBar(),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'SubScription',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Divider(color: Colors.white12, height: 1),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 350,
                    child: SearchBar(
                      padding: const WidgetStatePropertyAll<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 16.0),
                      ),
                      onTap: () {
                        showSearch(
                          context: context,
                          delegate: DataSearch(posts),
                        );
                      },
                      onChanged: (value) {
                        showSearch(
                          context: context,
                          delegate: DataSearch(posts),
                        );
                      },
                      leading: const Icon(Icons.search),
                    ),
                  ),

                  // StandardSearchAnchor(searchBar: StandardSearchBar(bgColor: Colors.white,),
                  // suggestions: StandardSuggestions(suggestions: posts[])),
                  // SizedBox(width: 20,),
                ],
              ),
              // ),
            ),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Gold',
                style: TextStyle(
                  color: Color(0xffad9c00),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                // itemExtent: 250,
                //diameterRatio: 10,
                children: [
                  SizedBox(
                    //height: 200,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          // const CreateStory(),
                          // const SizedBox(width: 5),
                          ...posts
                              .where((post) => post.hasStory)
                              .map(
                                (user) => Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: goldSubscriber_post(user: user),
                                ),
                              )
                              .toList(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Divider(color: Colors.white12, height: 1),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Silver',
                style: TextStyle(
                  color: Color.fromARGB(255, 194, 193, 191),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                //dragStartBehavior: DragScrollActivity(delegate, controller),
                children: [
                  SizedBox(
                    //height: 200,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          // const CreateStory(),
                          // const SizedBox(width: 5),
                          ...posts
                              .where((post) => post.hasStory)
                              .map(
                                (user) => Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: silverSubscriber_post(user: user),
                                ),
                              )
                              .toList(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Divider(color: Colors.white12, height: 1),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Bronze',
                style: TextStyle(
                  color: Color.fromARGB(205, 146, 50, 20),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  SizedBox(
                    //height: 200,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          // const CreateStory(),
                          // const SizedBox(width: 5),
                          ...posts
                              .where((post) => post.hasStory)
                              .map(
                                (user) => Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: bronzeSubscriber_post(user: user),
                                ),
                              )
                              .toList(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // ),
      // ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final List<UserPostModel> listSubscribe;
  DataSearch(this.listSubscribe);
  @override
  List<Widget> buildActions(BuildContext context) {
    //Actions for app bar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //leading icon on the left of the app bar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.view_list,
        progress: transitionAnimation,
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Subscribers()),
        );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some result based on the selection
    final suggestionList = posts;

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        title: Text(posts[index].name),
        subtitle: Text(posts[index].name),
      ),
      itemCount: suggestionList.length,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something

    final suggestionList = query.isEmpty
        ? posts
        : posts
              .where(
                (p) => p.name.contains(RegExp(query, caseSensitive: false)),
              )
              .toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  goldSubscriber_post(user: suggestionList[index]),
            ),
          );
        },
        trailing: Icon(Icons.remove_red_eye),
        title: RichText(
          text: TextSpan(
            text: suggestionList[index].name.substring(0, query.length),
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: suggestionList[index].name.substring(query.length),
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }
}

//gold Sub scriber
class goldSubscriber_post extends StatelessWidget {
  const goldSubscriber_post({
    Key? key,
    required this.user,
    this.hideName = false,
    this.size = 80,
  }) : super(key: key);
  final UserPostModel user;
  final bool hideName;
  final double size;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      child: Column(
        children: [
          Container(
            height: size - 10,
            width: size - 10,
            decoration: user.hasStory
                ? const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        CupertinoColors.systemYellow,
                        CupertinoColors.systemYellow,
                      ],
                    ),
                  )
                : null,
            padding: const EdgeInsets.all(2),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: CupertinoColors.white,
              ),
              padding: const EdgeInsets.all(2),
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: CupertinoColors.white,
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/sources/profiles/${user.profileImage}',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          if (!hideName)
            Text(
              user.name,

              style: TextStyle(
                color: CupertinoColors.white,
                fontSize: 12,
                fontFamily: "Gilroy",
                overflow: TextOverflow.ellipsis,
              ),
            ),
        ],
      ),
    );
  }
}

//Silver subScriber
class silverSubscriber_post extends StatelessWidget {
  const silverSubscriber_post({
    Key? key,
    required this.user,
    this.hideName = false,
    this.size = 80,
  }) : super(key: key);
  final UserPostModel user;
  final bool hideName;
  final double size;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      child: Column(
        children: [
          Container(
            height: size - 10,
            width: size - 10,
            decoration: user.hasStory
                ? const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        CupertinoColors.systemGrey,
                        CupertinoColors.systemGrey2,
                      ],
                    ),
                  )
                : null,
            padding: const EdgeInsets.all(2),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: CupertinoColors.white,
              ),
              padding: const EdgeInsets.all(2),
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: CupertinoColors.white,
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/sources/profiles/${user.profileImage}',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          if (!hideName)
            Text(
              user.name,

              style: TextStyle(
                color: CupertinoColors.white,
                fontSize: 12,
                fontFamily: "Gilroy",
                overflow: TextOverflow.ellipsis,
              ),
            ),
        ],
      ),
    );
  }
}

//Bronze subscriber list
class bronzeSubscriber_post extends StatelessWidget {
  const bronzeSubscriber_post({
    Key? key,
    required this.user,
    this.hideName = false,
    this.size = 80,
  }) : super(key: key);
  final UserPostModel user;
  final bool hideName;
  final double size;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      child: Column(
        children: [
          Container(
            height: size - 10,
            width: size - 10,
            decoration: user.hasStory
                ? const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        CupertinoColors.systemBrown,
                        CupertinoColors.systemBrown,
                      ],
                    ),
                  )
                : null,
            padding: const EdgeInsets.all(2),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: CupertinoColors.white,
              ),
              padding: const EdgeInsets.all(2),
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: CupertinoColors.white,
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/sources/profiles/${user.profileImage}',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          if (!hideName)
            Text(
              user.name,
              style: TextStyle(
                color: CupertinoColors.white,
                fontSize: 12,
                fontFamily: "Gilroy",
                overflow: TextOverflow.ellipsis,
              ),
            ),
        ],
      ),
    );
  }
}
