// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:harmanapp/helper.dart';

// import 'package:harmanapp/models/user_post_model.dart';
// //import 'package:list_wheel_scroll_view_nls/list_wheel_scroll_view_nls.dart';

// class CreatorsScreen extends StatefulWidget {
//   const CreatorsScreen({super.key});

//   @override
//   State<CreatorsScreen> createState() => _CreatorsScreenState();
// }

// class _CreatorsScreenState extends State<CreatorsScreen> {
//   bool isDark = false;
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoTabView(
//       builder: (context) => CupertinoPageScaffold(
//         backgroundColor: CupertinoColors.black,
//         navigationBar: const InstagramTopBar(),

//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Center(
//             //   child: Text(
//             //     'SubScription',
//             //     style: TextStyle(
//             //       color: Colors.white,
//             //       fontSize: 20,
//             //       fontWeight: FontWeight.bold,
//             //     ),
//             //   ),
//             // ),
//             const Padding(
//               padding: EdgeInsets.symmetric(vertical: 15),
//               child: Divider(color: Colors.white12, height: 1),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(12.0),

//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     width: 350,
//                     child: SearchBar(
//                       padding: const WidgetStatePropertyAll<EdgeInsets>(
//                         EdgeInsets.symmetric(horizontal: 16.0),
//                       ),
//                       onTap: () {
//                         showSearch(
//                           context: context,
//                           delegate: DataSearch(posts),
//                         );
//                       },
//                       onChanged: (value) {
//                         showSearch(
//                           context: context,
//                           delegate: DataSearch(posts),
//                         );
//                       },
//                       leading: const Icon(Icons.search),
//                     ),
//                   ),

//                   // StandardSearchAnchor(searchBar: StandardSearchBar(bgColor: Colors.white,),
//                   // suggestions: StandardSuggestions(suggestions: posts[])),
//                   // SizedBox(width: 20,),
//                 ],
//               ),
//               // ),
//             ),

//             Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Text(
//                 'Gold',
//                 style: TextStyle(
//                   color: Color(0xffad9c00),
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20,
//                 ),
//               ),
//             ),
//             Expanded(
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 // itemExtent: 250,
//                 //diameterRatio: 10,
//                 children: [
//                   SizedBox(
//                     //height: 200,
//                     child: SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       child: Row(
//                         children: [
//                           // const CreateStory(),
//                           // const SizedBox(width: 5),
//                           ...posts
//                               .where((post) => post.hasStory)
//                               .map(
//                                 (user) => Padding(
//                                   padding: const EdgeInsets.only(left: 10),
//                                   child: goldSubscriber_post(user: user),
//                                 ),
//                               )
//                               .toList(),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.symmetric(vertical: 15),
//               child: Divider(color: Colors.white12, height: 1),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Text(
//                 'Silver',
//                 style: TextStyle(
//                   color: Color.fromARGB(255, 194, 193, 191),
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20,
//                 ),
//               ),
//             ),
//             Expanded(
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 //dragStartBehavior: DragScrollActivity(delegate, controller),
//                 children: [
//                   SizedBox(
//                     //height: 200,
//                     child: SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       child: Row(
//                         children: [
//                           // const CreateStory(),
//                           // const SizedBox(width: 5),
//                           ...posts
//                               .where((post) => post.hasStory)
//                               .map(
//                                 (user) => Padding(
//                                   padding: const EdgeInsets.only(left: 10),
//                                   child: silverSubscriber_post(user: user),
//                                 ),
//                               )
//                               .toList(),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.symmetric(vertical: 15),
//               child: Divider(color: Colors.white12, height: 1),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Text(
//                 'Bronze',
//                 style: TextStyle(
//                   color: Color.fromARGB(205, 146, 50, 20),
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20,
//                 ),
//               ),
//             ),
//             Expanded(
//               child: ListView(
//                 children: [
//                   SizedBox(
//                     //height: 200,
//                     child: SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       child: Row(
//                         children: [
//                           // const CreateStory(),
//                           // const SizedBox(width: 5),
//                           ...posts
//                               .where((post) => post.hasStory)
//                               .map(
//                                 (user) => Padding(
//                                   padding: const EdgeInsets.only(left: 10),
//                                   child: bronzeSubscriber_post(user: user),
//                                 ),
//                               )
//                               .toList(),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       // ),
//       // ),
//     );
//   }
// }

// class DataSearch extends SearchDelegate<String> {
//   final List<UserPostModel> listSubscribe;
//   DataSearch(this.listSubscribe);
//   @override
//   List<Widget> buildActions(BuildContext context) {
//     //Actions for app bar
//     return [
//       IconButton(
//         icon: Icon(Icons.clear),
//         onPressed: () {
//           query = '';
//         },
//       ),
//     ];
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     //leading icon on the left of the app bar
//     return IconButton(
//       icon: AnimatedIcon(
//         icon: AnimatedIcons.view_list,
//         progress: transitionAnimation,
//       ),
//       onPressed: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => CreatorsScreen()),
//         );
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     // show some result based on the selection
//     final suggestionList = posts;

//     return ListView.builder(
//       itemBuilder: (context, index) => ListTile(
//         title: Text(posts[index].name),
//         subtitle: Text(posts[index].name),
//       ),
//       itemCount: suggestionList.length,
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     // show when someone searches for something

//     final suggestionList = query.isEmpty
//         ? posts
//         : posts
//               .where(
//                 (p) => p.name.contains(RegExp(query, caseSensitive: false)),
//               )
//               .toList();

//     return ListView.builder(
//       itemBuilder: (context, index) => ListTile(
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) =>
//                   goldSubscriber_post(user: suggestionList[index]),
//             ),
//           );
//         },
//         trailing: Icon(Icons.remove_red_eye),
//         title: RichText(
//           text: TextSpan(
//             text: suggestionList[index].name.substring(0, query.length),
//             style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
//             children: [
//               TextSpan(
//                 text: suggestionList[index].name.substring(query.length),
//                 style: TextStyle(color: Colors.grey),
//               ),
//             ],
//           ),
//         ),
//       ),
//       itemCount: suggestionList.length,
//     );
//   }
// }

// //gold Sub scriber
// class goldSubscriber_post extends StatelessWidget {
//   const goldSubscriber_post({
//     Key? key,
//     required this.user,
//     this.hideName = false,
//     this.size = 80,
//   }) : super(key: key);
//   final UserPostModel user;
//   final bool hideName;
//   final double size;
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: size,
//       child: Column(
//         children: [
//           Container(
//             height: size - 10,
//             width: size - 10,
//             decoration: user.hasStory
//                 ? const BoxDecoration(
//                     shape: BoxShape.circle,
//                     gradient: LinearGradient(
//                       colors: [
//                         CupertinoColors.systemYellow,
//                         CupertinoColors.systemYellow,
//                       ],
//                     ),
//                   )
//                 : null,
//             padding: const EdgeInsets.all(2),
//             child: Container(
//               decoration: const BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: CupertinoColors.white,
//               ),
//               padding: const EdgeInsets.all(2),
//               child: Container(
//                 padding: const EdgeInsets.all(2),
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: CupertinoColors.white,
//                   image: DecorationImage(
//                     image: AssetImage(
//                       'assets/sources/profiles/${user.profileImage}',
//                     ),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           if (!hideName)
//             Text(
//               user.name,

//               style: TextStyle(
//                 color: CupertinoColors.white,
//                 fontSize: 12,
//                 fontFamily: "Gilroy",
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }

// //Silver subScriber
// class silverSubscriber_post extends StatelessWidget {
//   const silverSubscriber_post({
//     Key? key,
//     required this.user,
//     this.hideName = false,
//     this.size = 80,
//   }) : super(key: key);
//   final UserPostModel user;
//   final bool hideName;
//   final double size;
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: size,
//       child: Column(
//         children: [
//           Container(
//             height: size - 10,
//             width: size - 10,
//             decoration: user.hasStory
//                 ? const BoxDecoration(
//                     shape: BoxShape.circle,
//                     gradient: LinearGradient(
//                       colors: [
//                         CupertinoColors.systemGrey,
//                         CupertinoColors.systemGrey2,
//                       ],
//                     ),
//                   )
//                 : null,
//             padding: const EdgeInsets.all(2),
//             child: Container(
//               decoration: const BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: CupertinoColors.white,
//               ),
//               padding: const EdgeInsets.all(2),
//               child: Container(
//                 padding: const EdgeInsets.all(2),
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: CupertinoColors.white,
//                   image: DecorationImage(
//                     image: AssetImage(
//                       'assets/sources/profiles/${user.profileImage}',
//                     ),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           if (!hideName)
//             Text(
//               user.name,

//               style: TextStyle(
//                 color: CupertinoColors.white,
//                 fontSize: 12,
//                 fontFamily: "Gilroy",
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }

// //Bronze subscriber list
// class bronzeSubscriber_post extends StatelessWidget {
//   const bronzeSubscriber_post({
//     Key? key,
//     required this.user,
//     this.hideName = false,
//     this.size = 80,
//   }) : super(key: key);
//   final UserPostModel user;
//   final bool hideName;
//   final double size;
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: size,
//       child: Column(
//         children: [
//           Container(
//             height: size - 10,
//             width: size - 10,
//             decoration: user.hasStory
//                 ? const BoxDecoration(
//                     shape: BoxShape.circle,
//                     gradient: LinearGradient(
//                       colors: [
//                         CupertinoColors.systemBrown,
//                         CupertinoColors.systemBrown,
//                       ],
//                     ),
//                   )
//                 : null,
//             padding: const EdgeInsets.all(2),
//             child: Container(
//               decoration: const BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: CupertinoColors.white,
//               ),
//               padding: const EdgeInsets.all(2),
//               child: Container(
//                 padding: const EdgeInsets.all(2),
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: CupertinoColors.white,
//                   image: DecorationImage(
//                     image: AssetImage(
//                       'assets/sources/profiles/${user.profileImage}',
//                     ),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           if (!hideName)
//             Text(
//               user.name,
//               style: TextStyle(
//                 color: CupertinoColors.white,
//                 fontSize: 12,
//                 fontFamily: "Gilroy",
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harmanapp/helper.dart';
import 'package:harmanapp/models/user_post_model.dart';

class CreatorsScreen extends StatefulWidget {
  const CreatorsScreen({super.key});

  @override
  State<CreatorsScreen> createState() => _CreatorsScreenState();
}

class _CreatorsScreenState extends State<CreatorsScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return CupertinoTabView(
      builder: (context) => CupertinoPageScaffold(
        backgroundColor: CupertinoColors.black,
        navigationBar: const InstagramTopBar(),

        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(color: Colors.white24),

              /// SEARCH BAR
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: SizedBox(
                    width: size.width * 0.85,
                    child: SearchBar(
                      hintText: "Search creators...",
                      padding: const WidgetStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 16),
                      ),
                      leading: const Icon(Icons.search),

                      onTap: () => showSearch(
                        context: context,
                        delegate: DataSearch(posts),
                      ),
                    ),
                  ),
                ),
              ),

              /// GOLD SECTION
              _title("Gold", const Color(0xffd4b300)),
              _horizontalList(
                posts.where((p) => p.hasStory).toList(),
                gradient: const [
                  CupertinoColors.systemYellow,
                  CupertinoColors.systemYellow,
                ],
              ),

              const Divider(color: Colors.white24),

              /// SILVER SECTION
              _title("Silver", Colors.grey),
              _horizontalList(
                posts.where((p) => p.hasStory).toList(),
                gradient: const [
                  CupertinoColors.systemGrey,
                  CupertinoColors.systemGrey2,
                ],
              ),

              const Divider(color: Colors.white24),

              /// BRONZE SECTION
              _title("Bronze", CupertinoColors.systemBrown),
              _horizontalList(
                posts.where((p) => p.hasStory).toList(),
                gradient: const [
                  CupertinoColors.systemBrown,
                  CupertinoColors.systemBrown,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _title(String text, Color color) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
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

class SubscriberCircle extends StatelessWidget {
  final UserPostModel user;
  final List<Color> gradient;
  final double size;
  final bool hideName;

  const SubscriberCircle({
    super.key,
    required this.user,
    required this.gradient,
    this.size = 80,
    this.hideName = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      child: Column(
        children: [
          Container(
            height: size - 10,
            width: size - 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: gradient),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Container(
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
              style: const TextStyle(
                color: CupertinoColors.white,
                fontSize: 12,
              ),
              overflow: TextOverflow.ellipsis,
            ),
        ],
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final List<UserPostModel> listSubscribe;
  DataSearch(this.listSubscribe);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: const Icon(Icons.clear), onPressed: () => query = ""),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(CupertinoIcons.back),
      onPressed: () => Navigator.pop(context),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final result = listSubscribe
        .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: result.length,
      itemBuilder: (_, index) => ListTile(
        title: Text(
          result[index].name,
          style: const TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          "Subscriber",
          style: const TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? listSubscribe
        : listSubscribe
              .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
              .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (_, index) {
        final name = suggestionList[index].name;

        final startIndex = name.toLowerCase().indexOf(query.toLowerCase());
        final endIndex = startIndex + query.length;

        return ListTile(
          onTap: () {
            close(context, "");
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (_) => SubscriberCircle(user: suggestionList[index]),
            //   ),
            // );
          },
          title: RichText(
            text: TextSpan(
              children: [
                TextSpan(text: name.substring(0, startIndex)),
                TextSpan(
                  text: name.substring(startIndex, endIndex),
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(text: name.substring(endIndex)),
              ],
            ),
          ),
        );
      },
    );
  }
}
