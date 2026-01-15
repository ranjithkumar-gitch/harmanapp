import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harmanapp/star_module/MyAccount/create_post.dart';
import 'package:harmanapp/star_module/MyAccount/edit_profile.dart';
import 'package:harmanapp/star_module/MyAccount/legacy.dart';
import 'package:harmanapp/star_module/MyAccount/star_market.dart';
import 'package:harmanapp/star_module/MyAccount/star_my_memberships.dart';
import 'package:harmanapp/star_module/MyAccount/star_my_orders.dart';
import 'package:harmanapp/star_module/MyAccount/star_my_posts.dart';
import 'package:harmanapp/star_module/widgets/star_side_menu.dart';
import 'package:harmanapp/widgets/theme_notifier.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';

class StarMyAccount extends StatefulWidget {
  const StarMyAccount({super.key});

  @override
  State<StarMyAccount> createState() => _StarMyAccountState();
}

enum Menu { preview, share, remove }

class _StarMyAccountState extends State<StarMyAccount> {
  String selectedCard = "";
  File? _coverImageFile;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    selectedCard = "";
    super.initState();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? kblackColor
            : kwhiteColor,
        endDrawer: starendDrawer(context),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 290,
                child: Stack(
                  children: [
                    coverImage(
                      'assets/sources/profiles/lucas-sankey.jpg',
                      'Peeter Hain',
                    ),
                    profileImage(
                      'assets/sources/profiles/lucas-sankey.jpg',
                      'Virat Kohli',
                    ),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(left: 8, right: 8),
                child: Column(
                  children: [
                    Text(
                      'Digital Artist | Content Creator | Photographer | Travel Enthusiast',
                      style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? kwhiteColor
                            : kblackColor,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.email,
                              color:
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? kwhiteColor
                                  : kblackColor,
                              size: 15,
                            ),
                            Text(
                              'peeter_hain@gmail.com',
                              style: TextStyle(
                                color:
                                    Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? kwhiteColor
                                    : kblackColor,
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              'o',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 4,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            SizedBox(width: 5),
                            Icon(
                              Icons.calendar_month,
                              color:
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? kwhiteColor
                                  : kblackColor,
                              size: 15,
                            ),
                            Text(
                              '14/05/1989',
                              style: TextStyle(
                                color:
                                    Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? kwhiteColor
                                    : kblackColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color:
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? kwhiteColor
                                  : kblackColor,
                              size: 15,
                            ),
                            Text(
                              'Circular Quay,',
                              style: TextStyle(
                                color:
                                    Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? kwhiteColor
                                    : kblackColor,
                              ),
                            ),
                            SizedBox(width: 2),
                            Text(
                              'Australia',
                              style: TextStyle(
                                color:
                                    Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? kwhiteColor
                                    : kblackColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 12),

                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 1.1, // adjust if needed
                      children: [
                        /// 1️⃣ Create Post
                        _optionCard(
                          icon: Icons.add_box_outlined,
                          title: 'Create Post',
                          subtitle: 'Stills | Bits | Videos',
                          isSelected: selectedCard == "CreatePost",
                          onTap: () => setState(
                            () => selectedCard = selectedCard == "CreatePost"
                                ? ""
                                : "CreatePost",
                          ),
                          onButtonPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const CreatePostPage(),
                              ),
                            );
                          },
                        ),

                        _optionCard(
                          icon: Icons.history,
                          title: 'Legacy',
                          subtitle: 'Legacy management',
                          isSelected: selectedCard == "Legacy",
                          onTap: () => setState(
                            () => selectedCard = selectedCard == "Legacy"
                                ? ""
                                : "Legacy",
                          ),
                          onButtonPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const Legacy()),
                            );
                          },
                        ),

                        /// 3️⃣ Orders
                        _optionCard(
                          icon: Icons.checklist_sharp,
                          title: 'Orders',
                          subtitle: 'Checkout all my orders',
                          isSelected: selectedCard == "Orders",
                          onTap: () => setState(
                            () => selectedCard = selectedCard == "Orders"
                                ? ""
                                : "Orders",
                          ),
                          onButtonPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const StarMyOrders(),
                              ),
                            );
                          },
                        ),

                        _optionCard(
                          icon: Icons.card_membership_outlined,
                          title: 'Memberships',
                          subtitle: 'Subscription management',
                          isSelected: selectedCard == "Memberships",
                          onTap: () => setState(
                            () => selectedCard = selectedCard == "Memberships"
                                ? ""
                                : "Memberships",
                          ),
                          onButtonPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const StarMembershipScreen(),
                              ),
                            );
                          },
                        ),

                        /// 5️⃣ My Posts
                        _optionCard(
                          icon: Icons.article_outlined,
                          title: 'My Posts',
                          subtitle: 'View all my posts',
                          isSelected: selectedCard == "MyPosts",
                          onTap: () => setState(
                            () => selectedCard = selectedCard == "MyPosts"
                                ? ""
                                : "MyPosts",
                          ),
                          onButtonPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const StarMyPosts(),
                              ),
                            );
                          },
                        ),

                        /// 6️⃣ My Marketplace
                        _optionCard(
                          icon: Icons.storefront_outlined,
                          title: 'My Marketplace',
                          subtitle: 'My listed products',
                          isSelected: selectedCard == "Marketplace",
                          onTap: () => setState(
                            () => selectedCard = selectedCard == "Marketplace"
                                ? ""
                                : "Marketplace",
                          ),
                          onButtonPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const StarMarketPlace(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget coverImage(String imagePath, String name) {
    return Stack(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage(imagePath),
          //     fit: BoxFit.cover,
          //   ),
          // ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: _coverImageFile != null
                  ? FileImage(_coverImageFile!)
                  : AssetImage(imagePath) as ImageProvider,
              fit: BoxFit.cover,
            ),
          ),

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                          Colors.black54,
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                      icon: Padding(
                        padding: const EdgeInsets.only(
                          left: 8.0,
                          right: 0.0,
                          top: 2.0,
                          bottom: 2.0,
                        ),
                        child: const Icon(Icons.arrow_back_ios),
                      ),
                      color: Colors.white,
                    ),
                    IconButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                          Colors.black54,
                        ),
                      ),

                      onPressed: () {
                        _scaffoldKey.currentState?.openEndDrawer();
                      },

                      icon: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(Icons.menu, color: kgoldColor),
                      ),
                      color: kgoldColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 4,
          right: 10,
          child: IconButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.black54),
            ),
            onPressed: _pickCoverImage,

            icon: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Icon(Icons.mode_edit_rounded, color: kgoldColor),
            ),
          ),
        ),
      ],
    );
  }

  Widget profileImage(String imagePath, String name) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      // height: 200,
      transform: Matrix4.translationValues(0.0, 170.0, 0.0),
      padding: const EdgeInsets.only(left: 14.0, right: 14),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                        colors: [kgoldColor, kgoldColor],
                      ),
                    ),
                    padding: const EdgeInsets.all(2),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: CupertinoColors.white,
                      ),
                      // padding: const EdgeInsets.all(2),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(imagePath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -6,
                    right: -6,
                    child: GestureDetector(
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: isDark ? kblackColor : kwhiteColor,
                          shape: BoxShape.circle,
                          border: Border.all(color: kgoldColor, width: 1.5),
                        ),
                        child: const Icon(
                          Icons.star,
                          color: kgoldColor,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? kwhiteColor
                            : kblackColor,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '@ $name',
                      style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? kwhiteColor
                            : kblackColor,
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),

              _editDropdownmenu(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _editDropdownmenu() {
    return Column(
      children: <Widget>[
        PopupMenuButton<Menu>(
          color: Theme.of(context).brightness == Brightness.dark
              ? kblackColor
              : kwhiteColor,

          popUpAnimationStyle: const AnimationStyle(
            curve: Easing.emphasizedDecelerate,
            duration: Duration(milliseconds: 300),
          ),

          icon: const Icon(Icons.more_vert, color: kgoldColor),

          onSelected: (Menu item) {
            switch (item) {
              case Menu.preview:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const EditProfileScreen()),
                );
                break;

              case Menu.share:
                SharePlus.instance.share(ShareParams(text: 'Check this out!'));
                break;

              case Menu.remove:
                showCupertinoDialog(
                  context: context,
                  builder: (_) => CupertinoTheme(
                    data: CupertinoThemeData(
                      // brightness: kblackColor,
                      primaryColor: kgoldColor,
                    ),
                    child: CupertinoAlertDialog(
                      title: const Text(
                        "Delete Account",
                        style: TextStyle(color: kgoldColor),
                      ),
                      content: Text(
                        "Are you sure you want to Delete?",
                        style: TextStyle(
                          // color: isDark ? Colors.white70 : Colors.black54,
                        ),
                      ),
                      actions: [
                        CupertinoDialogAction(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Cancel"),
                        ),
                        CupertinoDialogAction(
                          isDestructiveAction: true,
                          onPressed: () => Navigator.pop(context),
                          child: const Text(
                            "Delete",
                            style: TextStyle(color: kgoldColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
                break;
            }
          },

          itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
            PopupMenuItem<Menu>(
              value: Menu.preview,
              child: ListTile(
                leading: const Icon(Icons.edit, color: kgoldColor),
                title: Text(
                  'Edit Profile',
                  style: GoogleFonts.poppins(color: kgoldColor),
                ),
              ),
            ),

            PopupMenuItem<Menu>(
              value: Menu.share,
              child: ListTile(
                leading: const Icon(Icons.share_outlined, color: kgoldColor),
                title: Text(
                  'Share Profile',
                  style: GoogleFonts.poppins(color: kgoldColor),
                ),
              ),
            ),

            const PopupMenuDivider(),

            PopupMenuItem<Menu>(
              value: Menu.remove,
              child: ListTile(
                leading: const Icon(Icons.delete_outline, color: kgoldColor),
                title: Text(
                  'Delete account',
                  style: GoogleFonts.poppins(color: kgoldColor),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _optionCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
    required VoidCallback onButtonPressed,
  }) {
    const gold = kgoldColor;

    return GestureDetector(
      onTap: onTap,
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0, end: isSelected ? 3.14159 : 0),
        duration: const Duration(milliseconds: 800),
        builder: (context, angle, child) {
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(angle),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 800),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: isSelected
                      ? gold
                      : Theme.of(context).brightness == Brightness.dark
                      ? kwhiteColor
                      : kblackColor,
                  width: isSelected ? 2 : 1,
                ),
                color: Theme.of(context).brightness == Brightness.dark
                    ? kblackColor
                    : kwhiteColor,
              ),
              child: isSelected
                  ? // Back of card - Show button (counter-rotated to appear unflipped)
                    Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()..rotateY(3.14159),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            subtitle,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: gold,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            width: double.infinity,
                            height: 36,
                            child: OutlinedButton(
                              onPressed: onButtonPressed,
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: gold),
                                foregroundColor: gold,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text(
                                "Open",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : // Front of card - Show icon, title, subtitle
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// 🔘 Icon
                        Container(
                          height: 56,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isSelected
                                  ? gold
                                  : Theme.of(context).brightness ==
                                        Brightness.dark
                                  ? kwhiteColor
                                  : kblackColor,
                              width: 1.5,
                            ),
                          ),
                          child: Icon(
                            icon,
                            size: 26,
                            color: isSelected
                                ? gold
                                : Theme.of(context).brightness ==
                                      Brightness.dark
                                ? kwhiteColor
                                : kblackColor,
                          ),
                        ),

                        const SizedBox(height: 10),

                        /// 📝 Title
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: isSelected
                                ? gold
                                : Theme.of(context).brightness ==
                                      Brightness.dark
                                ? kwhiteColor
                                : kblackColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 2),

                        /// 📄 Subtitle
                        Text(
                          subtitle,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? kwhiteColor
                                : kblackColor,
                            fontSize: 12,
                          ),
                        ),

                        const SizedBox(height: 3),
                      ],
                    ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _pickCoverImage() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
    );

    if (image != null) {
      setState(() {
        _coverImageFile = File(image.path);
      });
    }
  }
}
