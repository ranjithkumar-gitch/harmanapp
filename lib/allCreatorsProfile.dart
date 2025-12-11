// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:harmanapp/helper.dart';
// import 'package:harmanapp/models/user_post_model.dart';

// class AllCreatorsProfile extends StatefulWidget {
//   const AllCreatorsProfile({super.key});

//   @override
//   State<AllCreatorsProfile> createState() => _AllCreatorsProfileState();
// }

// class _AllCreatorsProfileState extends State<AllCreatorsProfile> {
//   @override
//   Widget build(BuildContext context) {
//     const profileSize = 80.0;
//     final user = posts.firstWhere((p) => p.name == 'Srikanth Natarajan');
//     return Scaffold(
//       backgroundColor: CupertinoColors.black,
//       appBar: InstagramTopBar(),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     IconButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       icon: const Icon(Icons.arrow_back),
//                       color: Colors.white,
//                     ),

//                     Expanded(
//                       child: Text(
//                         user.name,
//                         textAlign: TextAlign.center,
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                     SizedBox(width: 15),
//                   ],
//                 ),

//                 const SizedBox(height: 15),

//                 Column(
//                   children: [
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Container(
//                           height: profileSize,
//                           width: profileSize,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             gradient: const LinearGradient(
//                               colors: [
//                                 CupertinoColors.systemYellow,
//                                 CupertinoColors.systemYellow,
//                               ],
//                             ),
//                           ),
//                           padding: const EdgeInsets.all(2),
//                           child: Container(
//                             decoration: const BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: Colors.white,
//                             ),
//                             padding: const EdgeInsets.all(2),
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 image: DecorationImage(
//                                   image: AssetImage(
//                                     'assets/sources/profiles/${user.profileImage}',
//                                   ),
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),

//                         const SizedBox(width: 20),

//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: const [
//                                   _Stat("689", "posts"),
//                                   _Stat("28.1M", "followers"),
//                                   _Stat("1", "following"),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),

//                     // ---------------------------------------------------------
//                     // BELOW PROFILE IMAGE
//                     // ---------------------------------------------------------
//                     const SizedBox(height: 10),

//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // Two vertical texts
//                         const Text(
//                           "Content Creator",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const SizedBox(height: 5),
//                         const Text(
//                           "Premium Badges",
//                           style: TextStyle(color: Colors.white70, fontSize: 14),
//                         ),

//                         const SizedBox(height: 15),
//                         Row(
//                           children: [
//                             Expanded(
//                               child: _Button(
//                                 text: "Subscribe",
//                                 color: Colors.blue,
//                               ),
//                             ),
//                             const SizedBox(width: 8),

//                             // Expanded(
//                             //   child: _Button(
//                             //     text: "Upgrade",
//                             //     color: Colors.grey,
//                             //   ),
//                             // ),
//                           ],
//                         ),
//                         // Divider
//                         Divider(color: Colors.white24, thickness: 1),

//                         const SizedBox(height: 10),

//                         // 3 Cards Row
//                         Column(
//                           children: [
//                             _BadgeCard(title: "Gold", color: Color(0xFFFFD700)),
//                             _BadgeCard(
//                               title: "Silver",
//                               color: Color(0xFFC0C0C0),
//                             ),
//                             _BadgeCard(
//                               title: "Bronze",
//                               color: Color(0xFFCD7F32),
//                             ),
//                           ],
//                         ),

//                         const SizedBox(height: 10),
//                       ],
//                     ),
//                   ],
//                 ),

//                 const SizedBox(height: 20),
//               ],
//             ),
//           ),

//           // const TabBar(
//           //   indicatorColor: Color(0xFFDAA520),
//           //   indicatorWeight: 4,
//           //   labelColor: Color(0xFFDAA520),
//           //   unselectedLabelColor: Colors.white54,
//           //   tabs: [
//           //     Tab(icon: Icon(Icons.apps, size: 28)),
//           //     Tab(icon: Icon(Icons.video_library_sharp, size: 28)),
//           //     Tab(icon: Icon(Icons.live_tv, size: 28)),
//           //     Tab(icon: Icon(Icons.person, size: 28)),
//           //   ],
//           // ),
//           const SizedBox(height: 10),
//         ],
//       ),
//     );
//   }
// }

// class _Button extends StatelessWidget {
//   final String text;
//   final Color color;
//   const _Button({required this.text, required this.color});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 38,
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: color,
//           foregroundColor: Colors.white,
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//         ),
//         onPressed: () {},
//         child: Text(text),
//       ),
//     );
//   }
// }

// class _Stat extends StatelessWidget {
//   final String value;
//   final String label;
//   const _Stat(this.value, this.label);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(
//           value,
//           style: const TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         Text(
//           label,
//           style: const TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ],
//     );
//   }
// }

// class _BadgeCard extends StatelessWidget {
//   final String title;
//   final Color color;

//   const _BadgeCard({required this.title, required this.color, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         width: double.infinity,
//         padding: const EdgeInsets.symmetric(vertical: 10),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           border: Border.all(color: color, width: 2),
//           color: Colors.black12,
//         ),
//         child: Column(
//           children: [
//             // Badge Title
//             Text(
//               title,
//               style: TextStyle(
//                 color: color,
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),

//             const SizedBox(height: 10),

//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 // Price
//                 const Text(
//                   "\$40.99",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),

//                 // Vertical Divider
//                 Container(
//                   height: 18,
//                   width: 1.5,
//                   color: Colors.white30,
//                   margin: const EdgeInsets.symmetric(horizontal: 8),
//                 ),

//                 // Purchase Now
//                 const Text("Purchase", style: TextStyle(color: Colors.white70)),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harmanapp/helper.dart';
import 'package:harmanapp/models/user_post_model.dart';

class AllCreatorsProfile extends StatefulWidget {
  const AllCreatorsProfile({super.key});

  @override
  State<AllCreatorsProfile> createState() => _AllCreatorsProfileState();
}

class _AllCreatorsProfileState extends State<AllCreatorsProfile> {
  @override
  Widget build(BuildContext context) {
    const profileSize = 80.0;
    final user = posts.firstWhere((p) => p.name == 'Srikanth Natarajan');

    return Scaffold(
      backgroundColor: CupertinoColors.black,
      appBar: InstagramTopBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back),
                      color: Colors.white,
                    ),

                    Expanded(
                      child: Text(
                        user.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 15),
                  ],
                ),

                const SizedBox(height: 15),

                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: profileSize,
                          width: profileSize,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: const LinearGradient(
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
                              color: Colors.white,
                            ),
                            padding: const EdgeInsets.all(2),
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
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

                        const SizedBox(width: 20),

                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              _Stat("689", "posts"),
                              _Stat("28.1M", "followers"),
                              _Stat("1", "following"),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Content Creator",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          "Premium Badges",
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),

                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Expanded(
                              child: _Button(
                                text: "Subscribe",
                                color: Colors.blue,
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        backgroundColor: Colors.black87,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                        ),
                                        title: const Text(
                                          "Choose Your Plan",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        content: SingleChildScrollView(
                                          child: Column(
                                            children: const [
                                              _BadgeCard(
                                                title: "Gold",
                                                color: Color(0xFFFFD700),
                                              ),
                                              _BadgeCard(
                                                title: "Silver",
                                                color: Color(0xFFC0C0C0),
                                              ),
                                              _BadgeCard(
                                                title: "Bronze",
                                                color: Color(0xFFCD7F32),
                                              ),
                                            ],
                                          ),
                                        ),
                                        actions: [
                                          TextButton(
                                            child: const Text(
                                              "Close",
                                              style: TextStyle(
                                                color: Colors.white70,
                                              ),
                                            ),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),

                        const Divider(color: Colors.white24, thickness: 1),

                        const SizedBox(height: 10),

                        // Column(
                        //   children: const [
                        //     _BadgeCard(title: "Gold", color: Color(0xFFFFD700)),
                        //     _BadgeCard(
                        //       title: "Silver",
                        //       color: Color(0xFFC0C0C0),
                        //     ),
                        //     _BadgeCard(
                        //       title: "Bronze",
                        //       color: Color(0xFFCD7F32),
                        //     ),
                        //   ],
                        // ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),

          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class _Button extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback? onPressed;

  const _Button({required this.text, required this.color, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  final String value;
  final String label;
  const _Stat(this.value, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

// class _BadgeCard extends StatelessWidget {
//   final String title;
//   final Color color;

//   const _BadgeCard({required this.title, required this.color, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         width: double.infinity,
//         padding: const EdgeInsets.symmetric(vertical: 10),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           border: Border.all(color: color, width: 2),
//           color: Colors.black26,
//         ),
//         child: Column(
//           children: [
//             Text(
//               title,
//               style: TextStyle(
//                 color: color,
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),

//             const SizedBox(height: 10),

//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text(
//                   "\$40.99",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),

//                 Container(
//                   height: 18,
//                   width: 1.5,
//                   color: Colors.white30,
//                   margin: const EdgeInsets.symmetric(horizontal: 8),
//                 ),

//                 const Text("Purchase", style: TextStyle(color: Colors.white70)),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
class _BadgeCard extends StatelessWidget {
  final String title;
  final Color color;

  const _BadgeCard({required this.title, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color, width: 2),
          color: Colors.black26,
        ),
        child: Row(
          children: [
            // -----------------------------------------------
            // BADGE IMAGE WITH TITLE ON TOP (STACK)
            // -----------------------------------------------
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 70,
                  width: 70,
                  child: Image.asset("assets/badge4.png", fit: BoxFit.contain),
                ),

                // Text on top of badge
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black, // change to white if needed
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            Container(height: 20, width: 1.5, color: Colors.white30),
            const SizedBox(width: 12),

            // -----------------------------------------------
            // TEXTS IN ROW
            // -----------------------------------------------
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Price
                  const Text(
                    "\$40.99",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 5),

                  // Vertical Divider
                  Container(height: 20, width: 1.2, color: Colors.white30),
                  const SizedBox(width: 5),

                  // Purchase
                  // const Text(
                  //   "Purchase",
                  //   style: TextStyle(color: Colors.white70, fontSize: 14),
                  // ),
                  SizedBox(
                    height: 32,
                    child: ElevatedButton(
                      onPressed: () {
                        // add purchase logic here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Purchase",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
