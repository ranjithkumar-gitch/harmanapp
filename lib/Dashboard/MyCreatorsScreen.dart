import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harmanapp/AppBar/AppBar.dart';
import 'package:harmanapp/ProfilePages/my_profile_videocover.dart';

import 'package:harmanapp/models/user_post_model.dart';
import 'package:harmanapp/ProfilePages/MyCreatorProfile.dart';
import 'package:harmanapp/widgets/colors.dart';
import 'package:lottie/lottie.dart';

class MyCreatorsScreen extends StatefulWidget {
  const MyCreatorsScreen({super.key});

  @override
  State<MyCreatorsScreen> createState() => _MyCreatorsScreenState();
}

class _MyCreatorsScreenState extends State<MyCreatorsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isPlaying = false;
  String imageUrl = "";
  String strName = "";
  int tappedIndex = -1;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() => isPlaying = false);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => tappedIndex == 0
                ? Mycreatorprofile(usrName: strName)
                : Mycreator_videocover(usrName: strName),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _playAnimation() {
    setState(() => isPlaying = true);
    _controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    return Scaffold(
      backgroundColor: kblackColor,
      appBar: CustomAppBar(),
      body: isPlaying
          ? Stack(
              children: [
                Center(
                  child: Lottie.asset(
                    'assets/dots.json',
                    controller: _controller,
                  ),
                ),
                Center(
                  child: ClipOval(
                    child: Image.asset(
                      imageUrl,
                      height: width * 0.45,
                      width: width * 0.45,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            )
          : ListView(
              padding: EdgeInsets.zero,
              children: [
                _searchBar(),
                _subscriberList(
                  context,
                  creators.take(7).toList(),
                  tier: "Gold",
                  color: kgoldColor,
                ),

                _subscriberList(
                  context,
                  creators.skip(7).take(7).toList(),
                  tier: "Silver",
                  color: CupertinoColors.systemGrey,
                ),
                _subscriberList(
                  context,
                  creators.skip(14).toList(),
                  tier: "Bronze",
                  color: CupertinoColors.systemBrown,
                ),
                const SizedBox(height: 80),
              ],
            ),
    );
  }

  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: SearchBar(
        backgroundColor: const WidgetStatePropertyAll(Colors.black),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: kgoldColor),
          ),
        ),
        hintText: "Search Stars...",
        hintStyle: const WidgetStatePropertyAll(TextStyle(color: Colors.white)),
        textStyle: const WidgetStatePropertyAll(TextStyle(color: Colors.white)),
        trailing: const [Icon(Icons.search, color: kgoldColor)],
      ),
    );
  }

  Widget _subscriberList(
    BuildContext context,
    List<UserPostModel> list, {
    required String tier,
    required Color color,
  }) {
    final width = MediaQuery.of(context).size.width;

    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (context, index) {
        final user = list[index];

        return GestureDetector(
          onTap: () {
            setState(() {
              imageUrl = "assets/sources/profiles/${user.profileImage}";
              strName = user.name;
              tappedIndex = index;
            });
            _playAnimation();
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: kblackColor,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: color, width: 1.8),
            ),
            child: Row(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: width * 0.13,
                      width: width * 0.13,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/sources/profiles/${user.profileImage}",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -6,
                      right: -6,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: kblackColor,
                          shape: BoxShape.circle,
                          border: Border.all(color: color),
                        ),
                        child: Icon(Icons.star, color: color, size: 12),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        user.category,
                        style: const TextStyle(
                          color: CupertinoColors.systemGrey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(CupertinoIcons.forward, color: color),
              ],
            ),
          ),
        );
      },
    );
  }
}

class UserPostModel {
  final String name;
  final String category;
  final String profileImage;

  UserPostModel({
    required this.name,
    required this.category,
    required this.profileImage,
  });
}

final List<UserPostModel> creators = [
  UserPostModel(
    name: "Virat Kohli",
    category: "Cricketer & youth icon",
    profileImage: "Virat_Kohli.jpg",
  ),
  UserPostModel(
    name: "Ratan Tata",
    category: "Business icon & philanthropist",
    profileImage: "Ratan_Tata.jpg",
  ),
  UserPostModel(
    name: "Deepika Padukone",
    category: "Actress & mental health advocate",
    profileImage: "deepika.jpg",
  ),
  UserPostModel(
    name: "Narayana Murthy",
    category: "Infosys founder",
    profileImage: "murthy.jpg",
  ),
  UserPostModel(
    name: "Falguni Nayar",
    category: "Nykaa founder",
    profileImage: "nayar.jpeg",
  ),
  UserPostModel(
    name: "Oprah Winfrey",
    category: "Media mogul",
    profileImage: "oprah.jpg",
  ),
  UserPostModel(
    name: "Elon Musk",
    category: "Tesla & SpaceX founder",
    profileImage: "elon.jpeg",
  ),
  UserPostModel(
    name: "Barack Obama",
    category: "Former U.S. President",
    profileImage: "obama.jpg",
  ),
  UserPostModel(
    name: "Jeff Bezos",
    category: "Amazon founder",
    profileImage: "jeff.jpeg",
  ),
  UserPostModel(
    name: "Taylor Swift",
    category: "Global cultural icon",
    profileImage: "swift.jpg",
  ),
  UserPostModel(
    name: "Céline Dion",
    category: "Legendary singer",
    profileImage: "dion.jpg",
  ),
  UserPostModel(
    name: "David Suzuki",
    category: "Environmentalist",
    profileImage: "suzuki.jpg",
  ),
  UserPostModel(
    name: "Michele Romanow",
    category: "Tech entrepreneur",
    profileImage: "michele.jpg",
  ),
  UserPostModel(
    name: "Shawn Mendes",
    category: "Pop singer",
    profileImage: "shawn.jpg",
  ),
  UserPostModel(
    name: "Nav Bhatia",
    category: "Entrepreneur & superfan",
    profileImage: "bhatia.jpg",
  ),
  UserPostModel(
    name: "Malala Yousafzai",
    category: "Nobel laureate",
    profileImage: "malala.jpg",
  ),
  UserPostModel(
    name: "Greta Thunberg",
    category: "Climate activist",
    profileImage: "greta.jpeg",
  ),
  UserPostModel(
    name: "Lionel Messi",
    category: "Football icon",
    profileImage: "messi.jpg",
  ),
  UserPostModel(
    name: "Jack Ma",
    category: "Alibaba founder",
    profileImage: "jack.jpg",
  ),
  UserPostModel(
    name: "Richard Branson",
    category: "Virgin Group founder",
    profileImage: "richard.jpeg",
  ),
];
