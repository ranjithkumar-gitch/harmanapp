import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:harmanapp/Creatorsscreen.dart';
import 'package:harmanapp/SubscribersScreen.dart';
import 'package:harmanapp/explore/explore_tab.dart';
import 'package:harmanapp/helper.dart';
import 'package:harmanapp/models/user_post_model.dart';

class Subscriberprofile extends StatefulWidget {
  const Subscriberprofile({super.key});

  @override
  State<Subscriberprofile> createState() => _SubscriberprofileState();
}

enum SampleItem { itemOne, itemTwo, itemThree }

class _SubscriberprofileState extends State<Subscriberprofile> {
  SampleItem? selectedItem;
  @override
  Widget build(BuildContext context) {
    var size = 80;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: CupertinoColors.black,
        appBar: InstagramTopBar(),
        body: Column(
          children: [
            getSubscriber(
              posts.where((p) => p.name == 'Srikanth Natarajan').toList(),
              (u) => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SubscribersScreen(),
                                  ),
                                );
                              },
                              icon: Icon(Icons.arrow_back),
                              color: Colors.white,
                            ),
                            //SizedBox(width: 20),
                            Text(
                              u.name,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            //SizedBox(width: 130),
                            PopupMenuButton<SampleItem>(
                              iconColor: Colors.white,
                              itemBuilder: (BuildContext context) =>
                                  <PopupMenuEntry<SampleItem>>[
                                    const PopupMenuItem<SampleItem>(
                                      child: Text('Item 1'),
                                    ),
                                  ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              //width: 20,
                              child: Container(
                                height: size - 10,
                                width: size - 10,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    colors: [
                                      CupertinoColors.systemYellow,
                                      CupertinoColors.systemYellow,
                                    ],
                                  ),
                                ),

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
                                          'assets/sources/profiles/${u.profileImage}',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            //SizedBox(width: 20),
                            Column(
                              children: [
                                Text(
                                  u.name,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      '689',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 60),
                                    Row(
                                      children: [
                                        Text(
                                          '28.1M',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 60),
                                    Row(
                                      children: [
                                        Text(
                                          '1',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(width: 25),
                                    Text(
                                      'posts',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 40),
                                    Row(
                                      children: [
                                        Text(
                                          'followers',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 40),
                                    Row(
                                      children: [
                                        Text(
                                          'following',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 150,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Follow',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 150,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onPressed: () {},
                                child: Text('Message'),
                              ),
                            ),
                            IconButton(
                              color: Colors.white,
                              onPressed: () {},
                              icon: Icon(Icons.group_add),
                            ),
                            // ElevatedButton(
                            //   onPressed: () {},
                            //   child: Text('Follow'),
                            // ),
                          ],
                        ),
                        SizedBox(height: 15),
                        _horizontalList(
                          posts.where((p) => p.hasStory).toList(),
                          gradient: const [
                            CupertinoColors.systemGrey,
                            CupertinoColors.systemGrey2,
                          ],
                        ),
                        //SizedBox(height: 5),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //const SizedBox(height: 8),
            TabBar(
              indicatorColor: Color(0xFFDAA520),
              indicatorWeight: 4,
              labelColor: Color(0xFFDAA520),
              unselectedLabelColor: Colors.black54,
              dividerColor: Colors.transparent,

              tabs: const [
                Tab(icon: Icon(Icons.apps, size: 30, color: Color(0xFFFFFFFF))),
                Tab(
                  icon: Icon(
                    Icons.video_library_sharp,
                    size: 30,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.location_history_sharp,
                    size: 30,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Expanded(
              child: TabBarView(
                children: [ImagesTab(), ReelsTab(), ImagesTab()],
              ),
            ),
          ],
        ),
      ),
    );
    // );
  }

  Widget getSubscriber(
    List<UserPostModel> list,
    Widget Function(UserPostModel user) builder,
  ) {
    return Column(
      children: list.map((u) => builder(u)).toList(),

      // [Text('assets/sources/profiles/${list[1].profileImage}')],
    );
  }

  Widget _horizontalList(
    List<UserPostModel> list, {
    required List<Color> gradient,
  }) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemCount: list.length,
        itemBuilder: (_, i) {
          return SubscriberCircle(user: list[i], gradient: gradient);
        },
      ),
    );
  }
}

class Images_Tab extends StatelessWidget {
  const Images_Tab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.custom(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 2,
      ),
      childrenDelegate: SliverChildListDelegate([FlutterLogo(), FlutterLogo()]),
    );
  }

  // }
}

class Subscriber_post extends StatelessWidget {
  const Subscriber_post({
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
    return GestureDetector(
      child: SizedBox(
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
          ],
        ),
      ),
    );
  }
}
