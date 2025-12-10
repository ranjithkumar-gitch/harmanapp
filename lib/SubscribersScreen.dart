import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harmanapp/Creatorsscreen.dart';
import 'package:harmanapp/helper.dart';
import 'package:harmanapp/models/user_post_model.dart';
import 'package:harmanapp/subScriberProfile.dart';

// class SubScribersscreen extends StatefulWidget {
//   const SubScribersscreen({super.key});

//   @override
//   State<SubScribersscreen> createState() => _SubScribersscreenState();
// }

// class _SubScribersscreenState extends State<SubScribersscreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: Center(child: Text("SubScribersscreen")));
//   }
// }

// import 'package:harmanapp/helper.dart';
// import 'package:harmanapp/models/user_post_model.dart';
// import 'package:harmanapp/Creatorsscreen.dart';
// import 'package:harmanapp/subScriberProfile.dart';

// class SubscribersScreen extends StatefulWidget {
//   const SubscribersScreen({super.key});

//   @override
//   State<SubscribersScreen> createState() => _SubscribersScreenState();
// }

// class _SubscribersScreenState extends State<SubscribersScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoTabView(
//       builder: (_) => CupertinoPageScaffold(
//         backgroundColor: CupertinoColors.black,
//         navigationBar: const InstagramTopBar(),

//         child: SafeArea(
//           child: ListView(
//             padding: EdgeInsets.zero,
//             children: [
//               const Padding(
//                 padding: EdgeInsets.symmetric(vertical: 15),
//                 child: Divider(color: Colors.white12, height: 1),
//               ),

//               // 🔍 SEARCH BAR
//               Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: SizedBox(
//                   width: 350,
//                   child: SearchBar(
//                     hintText: "Search subscribers...",
//                     padding: const WidgetStatePropertyAll<EdgeInsets>(
//                       EdgeInsets.symmetric(horizontal: 16.0),
//                     ),
//                     leading: const Icon(Icons.search),
//                     onTap: () {
//                       showSearch(context: context, delegate: DataSearch(posts));
//                     },
//                     onChanged: (value) {
//                       showSearch(context: context, delegate: DataSearch(posts));
//                     },
//                   ),
//                 ),
//               ),

//               // 🟡 GOLD GRID
//               // sectionTitle("Gold", const Color(0xffad9c00)),
//               subscriberGrid(
//                 posts.where((p) => p.hasStory).toList(),
//                 (u) => goldSubscriber_post(user: u, size: 110),
//               ),

//               const Divider(color: Colors.white12, height: 1),

//               // ⚪ SILVER GRID
//               // sectionTitle("Silver", CupertinoColors.systemGrey),
//               subscriberGrid(
//                 posts.where((p) => p.hasStory).toList(),
//                 (u) => silverSubscriber_post(user: u, size: 110),
//               ),

//               const Divider(color: Colors.white12, height: 1),

//               // 🟤 BRONZE GRID
//               // sectionTitle("Bronze", CupertinoColors.systemBrown),
//               subscriberGrid(
//                 posts.where((p) => p.hasStory).toList(),
//                 (u) => bronzeSubscriber_post(user: u, size: 110),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // SECTION TITLE
//   Widget sectionTitle(String label, Color color) {
//     return Padding(
//       padding: const EdgeInsets.all(12.0),
//       child: Text(
//         label,
//         style: TextStyle(
//           color: color,
//           fontSize: 20,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }

//   // GRID VIEW BUILDER (3 per row)
//   Widget subscriberGrid(
//     List<UserPostModel> list,
//     Widget Function(UserPostModel user) builder,
//   ) {
//     return GridView.count(
//       crossAxisCount: 2,
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       mainAxisSpacing: 5,
//       crossAxisSpacing: 20,
//       children: list.map((u) => builder(u)).toList(),
//     );
//   }
// }

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
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => Subscriberprofile()),
//         );
//       },
//       child: SizedBox(
//         width: size,
//         child: Column(
//           children: [
//             Container(
//               height: size - 10,
//               width: size - 10,
//               decoration: user.hasStory
//                   ? const BoxDecoration(
//                       shape: BoxShape.circle,
//                       gradient: LinearGradient(
//                         colors: [
//                           CupertinoColors.systemYellow,
//                           CupertinoColors.systemYellow,
//                         ],
//                       ),
//                     )
//                   : null,
//               padding: const EdgeInsets.all(2),
//               child: Container(
//                 decoration: const BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: CupertinoColors.white,
//                 ),
//                 padding: const EdgeInsets.all(2),
//                 child: Container(
//                   padding: const EdgeInsets.all(2),
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: CupertinoColors.white,
//                     image: DecorationImage(
//                       image: AssetImage(
//                         'assets/sources/profiles/${user.profileImage}',
//                       ),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             if (!hideName)
//               Text(
//                 user.name,

//                 style: TextStyle(
//                   color: CupertinoColors.white,
//                   fontSize: 12,
//                   fontFamily: "Gilroy",
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

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

class SubscribersScreen extends StatefulWidget {
  const SubscribersScreen({super.key});

  @override
  State<SubscribersScreen> createState() => _SubscribersScreenState();
}

class _SubscribersScreenState extends State<SubscribersScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabView(builder: (_) => const SubscribersContentPage());
  }
}

class SubscribersContentPage extends StatelessWidget {
  const SubscribersContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.black,
      navigationBar: const InstagramTopBar(),
      child: const SafeArea(child: SubscribersListView()),
    );
  }
}

class SubscribersListView extends StatelessWidget {
  const SubscribersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const SizedBox(height: 10),

        // 🔍 Search Bar
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: SearchBar(
            hintText: "Search Creators...",
            leading: const Icon(Icons.search),
            onTap: () {
              showSearch(context: context, delegate: DataSearch(posts));
            },
          ),
        ),

        subscriberList(
          context,
          posts.where((p) => p.hasStory).take(4).toList(),
          tier: "Gold",
          color: const Color(0xffd4af37),
        ),

        subscriberList(
          context,
          posts.where((p) => p.hasStory).take(4).toList(),
          tier: "Silver",
          color: CupertinoColors.systemGrey,
        ),

        subscriberList(
          context,
          posts.where((p) => p.hasStory).take(4).toList(),
          tier: "Bronze",
          color: CupertinoColors.systemBrown,
        ),

        const SizedBox(height: 50),
      ],
    );
  }
}

Widget sectionTitle(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
    child: Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        color: CupertinoColors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget subscriberList(
  BuildContext context,
  List<UserPostModel> list, {
  required String tier,
  required Color color,
}) {
  return Column(
    children: list.map((user) {
      return subscriberCard(context, user, color, tier);
    }).toList(),
  );
}

Widget subscriberCard(
  BuildContext context,
  UserPostModel user,
  Color color,
  String tier,
) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        CupertinoPageRoute(builder: (_) => const Subscriberprofile()),
      );
    },
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: CupertinoColors.darkBackgroundGray,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color, width: 1.8),
      ),
      child: Row(
        children: [
          ClipOval(
            child: Image.asset(
              "assets/sources/profiles/${user.profileImage}",
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 12),

          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Text(
          //       user.name,
          //       style: const TextStyle(
          //         color: CupertinoColors.white,
          //         fontSize: 16,
          //         fontFamily: "Gilroy",
          //       ),
          //     ),
          //     const SizedBox(height: 3),
          //     Text(
          //       tier,
          //       style: TextStyle(
          //         color: color,
          //         fontSize: 13,
          //         fontWeight: FontWeight.w500,
          //       ),
          //     ),
          //   ],
          // ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    user.name,
                    style: const TextStyle(
                      color: CupertinoColors.white,
                      fontSize: 16,
                      fontFamily: "Gilroy",
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    "• ${user.category}",
                    style: const TextStyle(
                      color: CupertinoColors.systemGrey2,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 3),
              Text(
                tier,
                style: TextStyle(
                  color: color,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          const Spacer(),

          const Icon(
            CupertinoIcons.forward,
            color: CupertinoColors.systemGrey2,
          ),
        ],
      ),
    ),
  );
}
