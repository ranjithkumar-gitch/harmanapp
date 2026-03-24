import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harmanapp/star_module/MyAccount/posts/star_post_model.dart';
import 'package:harmanapp/star_module/widgets/star_story_picture.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:harmanapp/widgets/theme_notifier.dart';
import 'package:share_plus/share_plus.dart';

class StarImagePost extends StatefulWidget {
  const StarImagePost({super.key, required this.post});
  final StarPostModel post;
  @override
  State<StarImagePost> createState() => _StarImagePostState();
}

class _StarImagePostState extends State<StarImagePost>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  int _currentImage = 0;
  double _rating = 0.0;
  bool _showRatingBar = false;
  late final AnimationController _lottieController;
  bool isPlaying = false;
  bool _showCommentBox = false;
  bool _commentsEnabled = true;
  final TextEditingController _commentController = TextEditingController();
  bool showComments = false;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0)
      ..addListener(() {
        setState(() {
          _currentImage = _pageController.page?.toInt() ?? 0;
        });
      });
    _lottieController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    _lottieController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isPlaying = false;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _lottieController.dispose();
    super.dispose();
  }

  void _playAnimation() {
    setState(() {
      isPlaying = true;
    });
    _lottieController.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: StarStoryPicture(
                user: widget.post,
                hideName: true,
                size: 60,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  widget.post.name,

                  style: GoogleFonts.greatVibes(
                    textStyle: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: kgoldColor,
                    ),
                  ),
                ),
                Text(
                  widget.post.sname,
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 12,
                    color: Brightness.dark == Theme.of(context).brightness
                        ? kwhiteColor
                        : kblackColor,
                  ),
                ),
              ],
            ),
            const Spacer(),

            Builder(
              builder: (context) {
                return CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: const Icon(CupertinoIcons.ellipsis, color: kgoldColor),
                  onPressed: () async {
                    final RenderBox button =
                        context.findRenderObject() as RenderBox;
                    final RenderBox overlay =
                        Overlay.of(context).context.findRenderObject()
                            as RenderBox;

                    final RelativeRect position = RelativeRect.fromRect(
                      Rect.fromPoints(
                        button.localToGlobal(Offset.zero, ancestor: overlay),
                        button.localToGlobal(
                          button.size.bottomRight(Offset.zero),
                          ancestor: overlay,
                        ),
                      ),
                      Offset.zero & overlay.size,
                    );

                    final value = await showMenu(
                      color: Brightness.dark == Theme.of(context).brightness
                          ? kblackColor
                          : kwhiteColor,
                      context: context,
                      position: position,
                      items: [
                        PopupMenuItem(
                          value: 'Hide',
                          child: Text(
                            'Hide',
                            style: TextStyle(
                              color:
                                  Brightness.dark ==
                                      Theme.of(context).brightness
                                  ? kwhiteColor
                                  : kblackColor,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Gilroy",
                            ),
                          ),
                        ),

                        PopupMenuItem(
                          value: 'Block',
                          child: Text(
                            'Block',
                            style: TextStyle(
                              color:
                                  Brightness.dark ==
                                      Theme.of(context).brightness
                                  ? kwhiteColor
                                  : kblackColor,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Gilroy",
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          value: 'Delete',
                          child: Text(
                            'Delete',
                            style: TextStyle(
                              color:
                                  Brightness.dark ==
                                      Theme.of(context).brightness
                                  ? kwhiteColor
                                  : kblackColor,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Gilroy",
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          value: 'toggleComments',
                          child: Text(
                            _commentsEnabled
                                ? 'Disable Comment Box'
                                : 'Enable Comment Box',
                            style: TextStyle(
                              color:
                                  Brightness.dark ==
                                      Theme.of(context).brightness
                                  ? kwhiteColor
                                  : kblackColor,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Gilroy",
                            ),
                          ),
                        ),
                      ],
                    );

                    if (value == 'Hide') {
                      final isDark =
                          Theme.of(context).brightness == Brightness.dark;
                      showCupertinoDialog(
                        context: context,
                        builder: (_) => CupertinoTheme(
                          data: CupertinoThemeData(
                            brightness: isDark
                                ? Brightness.dark
                                : Brightness.light,
                            primaryColor: kgoldColor,
                          ),
                          child: CupertinoAlertDialog(
                            title: Text(
                              "Hide Publication",
                              style: TextStyle(
                                color: kgoldColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            content: Text(
                              "Are you sure you want to Hide this Publication?",
                              style: TextStyle(
                                color: isDark ? Colors.white70 : Colors.black54,
                              ),
                            ),
                            actions: [
                              CupertinoDialogAction(
                                onPressed: () => Navigator.pop(context),
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(
                                    color: isDark ? Colors.white : Colors.black,
                                  ),
                                ),
                              ),
                              CupertinoDialogAction(
                                isDestructiveAction: true,
                                onPressed: () => Navigator.pop(context),
                                child: const Text(
                                  "Hide",
                                  style: TextStyle(color: kgoldColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                      // handle edit
                    } else if (value == 'toggleComments') {
                      setState(() {
                        _commentsEnabled = !_commentsEnabled;
                        if (!_commentsEnabled) {
                          _showCommentBox = false;
                          _commentController.clear();
                        }
                      });
                    } else if (value == 'Block') {
                      final isDark =
                          Theme.of(context).brightness == Brightness.dark;
                      showCupertinoDialog(
                        context: context,
                        builder: (_) => CupertinoTheme(
                          data: CupertinoThemeData(
                            brightness: isDark
                                ? Brightness.dark
                                : Brightness.light,
                            primaryColor: kgoldColor,
                          ),
                          child: CupertinoAlertDialog(
                            title: Text(
                              "Block Publication",
                              style: TextStyle(
                                color: kgoldColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            content: Text(
                              "Are you sure you want to Block this Publication?",
                              style: TextStyle(
                                color: isDark ? Colors.white70 : Colors.black54,
                              ),
                            ),
                            actions: [
                              CupertinoDialogAction(
                                onPressed: () => Navigator.pop(context),
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(
                                    color: isDark ? Colors.white : Colors.black,
                                  ),
                                ),
                              ),
                              CupertinoDialogAction(
                                isDestructiveAction: true,
                                onPressed: () => Navigator.pop(context),
                                child: const Text(
                                  "Block",
                                  style: TextStyle(color: kgoldColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                      // handle block
                    } else if (value == 'Delete') {
                      final isDark =
                          Theme.of(context).brightness == Brightness.dark;
                      showCupertinoDialog(
                        context: context,
                        builder: (_) => CupertinoTheme(
                          data: CupertinoThemeData(
                            brightness: isDark
                                ? Brightness.dark
                                : Brightness.light,
                            primaryColor: kgoldColor,
                          ),
                          child: CupertinoAlertDialog(
                            title: Text(
                              "Delete Publication",
                              style: TextStyle(
                                color: kgoldColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            content: Text(
                              "Are you sure you want to Delete this Publication?",
                              style: TextStyle(
                                color: isDark ? Colors.white70 : Colors.black54,
                              ),
                            ),
                            actions: [
                              CupertinoDialogAction(
                                onPressed: () => Navigator.pop(context),
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(
                                    color: isDark ? Colors.white : Colors.black,
                                  ),
                                ),
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
                      // handle delete
                    }
                  },
                );
              },
            ),
          ],
        ),
        SizedBox(
          height: 450,
          child: PageView(
            controller: _pageController,
            children: [
              ...widget.post.post.images!.map(
                (image) => Container(
                  height: 450,
                  decoration: BoxDecoration(
                    color: Brightness.dark == Theme.of(context).brightness
                        ? kwhiteColor
                        : kblackColor,
                    image: DecorationImage(
                      image: AssetImage('assets/sources/images/$image'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // CupertinoButton(
              //   padding: EdgeInsets.zero,
              //   onPressed: () {
              //     setState(() {
              //       _showRatingBar = !_showRatingBar;
              //     });
              //   },
              //   child: AnimatedScale(
              //     scale: _starScale,
              //     duration: const Duration(milliseconds: 300),
              //     curve: Curves.elasticOut,
              //     child: _useLottieStar
              //         ? Lottie.asset(
              //             'assets/Star.json',
              //             width: 40,
              //             height: 40,
              //             repeat: false,
              //             controller: _lottieController,
              //             onLoaded: (composition) {
              //               // Set controller duration to match Lottie file or override
              //               _lottieController.duration = const Duration(
              //                 seconds: 5,
              //               );
              //               // _controller.setSpeed(2.0);
              //             },
              //             delegates: LottieDelegates(
              //               values: [
              //                 ValueDelegate.color(['**'], value: _ratingColor),
              //               ],
              //             ),
              //           )
              //         : Icon(
              //             CupertinoIcons.star_fill,
              //             color: Brightness.dark == Theme.of(context).brightness
              //                 ? kwhiteColor
              //                 : kblackColor,
              //             size: 18,
              //           ),
              //   ),
              // ),

              // CupertinoButton(
              //   onPressed: () {
              //     setState(() {
              //       _showCommentBox = !_showCommentBox;
              //       _showRatingBar = false;
              //     });
              //   },
              //   padding: EdgeInsets.zero,
              //   child: Icon(
              //     CupertinoIcons.text_bubble,
              //     color: _showCommentBox
              //         ? kgoldColor
              //         : Brightness.dark == Theme.of(context).brightness
              //         ? kwhiteColor
              //         : kblackColor,
              //   ),
              // ),
              CupertinoButton(
                onPressed: () {
                  SharePlus.instance.share(
                    ShareParams(text: 'Check this out!'),
                  );
                },
                padding: EdgeInsets.zero,
                child: Icon(
                  CupertinoIcons.arrowshape_turn_up_right,
                  color: Brightness.dark == Theme.of(context).brightness
                      ? kwhiteColor
                      : kblackColor,
                ),
              ),
              // const Spacer(),
              if (widget.post.post.images!.length != 1)
                DotsIndicator(
                  dotsCount: 2,
                  position: _currentImage.toDouble(),
                  decorator: DotsDecorator(
                    color: Brightness.dark == Theme.of(context).brightness
                        ? kwhiteColor
                        : kblackColor,
                    activeColor: kgoldColor,
                  ),
                ),
              // const Spacer(flex: 3),
              CupertinoButton(
                onPressed: () {
                  setState(() {
                    widget.post.post.saved = !widget.post.post.saved;
                  });
                },
                padding: EdgeInsets.zero,
                child: Icon(
                  widget.post.post.saved
                      ? CupertinoIcons.bookmark_fill
                      : CupertinoIcons.bookmark,
                  color: kgoldColor,
                ),
              ),
            ],
          ),
        ),
        if (_showRatingBar)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: kgoldColor, width: 1),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RatingBar.builder(
                          initialRating: _rating,
                          minRating: 0,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 28,
                          unratedColor: Colors.grey,
                          itemBuilder: (context, _) =>
                              const Icon(Icons.star, color: Colors.amber),
                          onRatingUpdate: (rating) {
                            setState(() {
                              _rating = rating;
                            });
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: CupertinoButton(
                          padding: EdgeInsets.all(5),
                          child: Icon(
                            size: 24,
                            Icons.check_circle_outline,
                            color: _rating == 0.0 ? Colors.grey : kgoldColor,
                          ),

                          onPressed: () {
                            setState(() {
                              _showRatingBar = false;
                              _playAnimation();
                            });
                          },
                        ),
                      ),
                    ],
                  ),

                  //const SizedBox(height: 6),
                ],
              ),
            ),
          ),
        if (_showCommentBox && _commentsEnabled)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: kgoldColor, width: 1),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// 📝 Comment field
                  TextField(
                    controller: _commentController,
                    maxLines: 2,
                    style: TextStyle(
                      color: Brightness.dark == Theme.of(context).brightness
                          ? kwhiteColor
                          : kblackColor,
                    ),
                    decoration: InputDecoration(
                      hintText: "Write a comment...",
                      hintStyle: TextStyle(
                        color: Brightness.dark == Theme.of(context).brightness
                            ? Colors.white54
                            : Colors.black54,
                      ),
                      filled: true,
                      fillColor: Brightness.dark == Theme.of(context).brightness
                          ? kblackColor
                          : kwhiteColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  Align(
                    alignment: Alignment.centerRight,
                    child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      child: const Icon(
                        CupertinoIcons.paperplane_fill,
                        color: kgoldColor,
                      ),
                      onPressed: () {
                        final comment = _commentController.text.trim();
                        if (comment.isNotEmpty) {
                          _commentController.clear();
                          setState(() {
                            _showCommentBox = false;
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Text(
        //         '${widget.post.post.likes} Stars',
        //         style: TextStyle(
        //           color: Brightness.dark == Theme.of(context).brightness
        //               ? kwhiteColor
        //               : kblackColor,
        //           fontWeight: FontWeight.w600,
        //           fontFamily: "Gilroy",
        //         ),
        //       ),
        //       RichText(
        //         maxLines: 1,
        //         overflow: TextOverflow.ellipsis,
        //         text: TextSpan(
        //           children: [
        //             TextSpan(
        //               text: widget.post.name,
        //               style: TextStyle(
        //                 fontWeight: FontWeight.w600,
        //                 color: Brightness.dark == Theme.of(context).brightness
        //                     ? kwhiteColor
        //                     : kblackColor,
        //                 fontSize: 16,
        //                 fontFamily: "Gilroy",
        //               ),
        //             ),
        //             const TextSpan(text: '  '),
        //             TextSpan(
        //               text: widget.post.post.description ?? '',
        //               style: TextStyle(
        //                 color: Brightness.dark == Theme.of(context).brightness
        //                     ? kwhiteColor
        //                     : kblackColor,
        //                 fontSize: 16,
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //       if (widget.post.post.comments != null) ...[
        //         GestureDetector(
        //           onTap: () {
        //             showModalBottomSheet(
        //               context: context,
        //               isScrollControlled: true,
        //               backgroundColor: Colors.transparent,
        //               builder: (_) => CommentBottomSheet(post: widget.post),
        //             );
        //           },

        //           child: Text(
        //             'View all ${widget.post.post.comments} comments',
        //             style: TextStyle(
        //               fontFamily: "Gilroy",
        //               color: kgoldColor,
        //               fontSize: 14,
        //             ),
        //           ),
        //         ),
        //         if (showComments) ...[
        //           const SizedBox(height: 6),

        //           _comment("john_doe", "This looks amazing 🔥"),
        //           _comment("alex_99", "Pure elegance ✨"),
        //           _comment("maria_k", "Luxury vibes only 💫"),
        //           _comment("rohit.dev", "Nice shot 📸"),
        //           _comment("sophia_l", "Absolutely stunning ❤️"),
        //         ],
        //       ],

        //       Text(
        //         widget.post.post.date!,
        //         style: TextStyle(
        //           fontFamily: "Gilroy",
        //           color: Brightness.dark == Theme.of(context).brightness
        //               ? kwhiteColor
        //               : kblackColor,
        //           fontSize: 14,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}

final List<CommentModel> comments = [
  CommentModel(
    username: "john_doe",
    image: "assets/sources/profiles/aiony-haust.jpg",
    message: "This looks amazing 🔥🔥",
    time: "2d",
  ),
  CommentModel(
    username: "alex_99",
    image: "assets/sources/profiles/deco-dev.png",
    message: "Pure elegance ✨",
    time: "1d",
  ),
  CommentModel(
    username: "maria_k",
    image: "assets/sources/profiles/aiony-haust.jpg",
    message: "Luxury vibes only 💫",
    time: "5h",
  ),
  CommentModel(
    username: "rohit.dev",
    image: "assets/sources/profiles/azamat-zhanisov-.jpg",
    message: "Nice shot 📸",
    time: "3h",
  ),
  CommentModel(
    username: "sophia_l",
    image: "assets/sources/profiles/foto-sushi.jpg",
    message: "Absolutely stunning ❤️",
    time: "1h",
  ),
];

class CommentModel {
  final String username;
  final String image;
  final String message;
  final String time;

  CommentModel({
    required this.username,
    required this.image,
    required this.message,
    required this.time,
  });
}

class CommentBottomSheet extends StatefulWidget {
  final StarPostModel post;
  final bool commentsEnabled;

  const CommentBottomSheet({
    super.key,
    required this.post,
    this.commentsEnabled = true,
  });

  @override
  State<CommentBottomSheet> createState() => _CommentBottomSheetState();
}

class _CommentBottomSheetState extends State<CommentBottomSheet> {
  final TextEditingController _controller = TextEditingController();
  late final List<CommentModel> _comments;
  final Set<String> _blockedUsers = <String>{};
  static const String _currentUsername = 'stargazer.you';
  static const String _currentUserImage =
      'assets/sources/profiles/averie-woodard.jpg';

  int _myCommentIndex() {
    return _comments.indexWhere((item) => item.username == _currentUsername);
  }

  @override
  void initState() {
    super.initState();
    _comments = List<CommentModel>.from(comments);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _showCommentActions(CommentModel comment) async {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    await showCupertinoModalPopup<void>(
      context: context,
      builder: (sheetContext) => CupertinoTheme(
        data: CupertinoThemeData(
          brightness: isDark ? Brightness.dark : Brightness.light,
          primaryColor: kgoldColor,
        ),
        child: CupertinoActionSheet(
          title: Text(comment.username),
          message: const Text('Choose an action for this comment'),
          actions: [
            CupertinoActionSheetAction(
              isDestructiveAction: true,
              onPressed: () {
                Navigator.pop(sheetContext);
                _confirmDeleteComment(comment);
              },
              child: const Text('Delete'),
            ),
            CupertinoActionSheetAction(
              isDestructiveAction: true,
              onPressed: () {
                Navigator.pop(sheetContext);
                _confirmBlockAndDeleteComment(comment);
              },
              child: const Text('Block and Delete'),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: () => Navigator.pop(sheetContext),
            child: const Text('Cancel'),
          ),
        ),
      ),
    );
  }

  Future<void> _confirmDeleteComment(CommentModel comment) async {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    await showCupertinoDialog<void>(
      context: context,
      builder: (_) => CupertinoTheme(
        data: CupertinoThemeData(
          brightness: isDark ? Brightness.dark : Brightness.light,
          primaryColor: kgoldColor,
        ),
        child: CupertinoAlertDialog(
          title: const Text(
            'Delete',
            style: TextStyle(color: kgoldColor, fontWeight: FontWeight.bold),
          ),
          content: Text(
            'Are you sure want delete this from time line?',
            style: TextStyle(color: isDark ? Colors.white70 : Colors.black54),
          ),
          actions: [
            CupertinoDialogAction(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Cancel',
                style: TextStyle(color: isDark ? Colors.white : Colors.black),
              ),
            ),
            CupertinoDialogAction(
              isDestructiveAction: true,
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  _comments.remove(comment);
                });
              },
              child: const Text('Delete', style: TextStyle(color: kgoldColor)),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _confirmBlockAndDeleteComment(CommentModel comment) async {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    await showCupertinoDialog<void>(
      context: context,
      builder: (_) => CupertinoTheme(
        data: CupertinoThemeData(
          brightness: isDark ? Brightness.dark : Brightness.light,
          primaryColor: kgoldColor,
        ),
        child: CupertinoAlertDialog(
          title: const Text(
            'Block and Delete',
            style: TextStyle(color: kgoldColor, fontWeight: FontWeight.bold),
          ),
          content: Text(
            'Are you sure u want block this user from this time line and delete this comment?',
            style: TextStyle(color: isDark ? Colors.white70 : Colors.black54),
          ),
          actions: [
            CupertinoDialogAction(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Cancel',
                style: TextStyle(color: isDark ? Colors.white : Colors.black),
              ),
            ),
            CupertinoDialogAction(
              isDestructiveAction: true,
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  _blockedUsers.add(comment.username);
                  _comments.removeWhere(
                    (item) => item.username == comment.username,
                  );
                });
              },
              child: const Text(
                'Block and Delete',
                style: TextStyle(color: kgoldColor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.4,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          decoration: BoxDecoration(
            color: Brightness.dark == Theme.of(context).brightness
                ? kblackColor
                : kwhiteColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
          ),
          child: Column(
            children: [
              /// drag handle
              const SizedBox(height: 8),
              Container(
                height: 4,
                width: 40,
                decoration: BoxDecoration(
                  color: Brightness.dark == Theme.of(context).brightness
                      ? Colors.white24
                      : Colors.black26,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(height: 12),

              /// title
              Text(
                "Comments",
                style: TextStyle(
                  color: Brightness.dark == Theme.of(context).brightness
                      ? kwhiteColor
                      : kblackColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const Divider(color: Colors.white12),

              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: _comments.length,
                  itemBuilder: (_, index) {
                    final comment = _comments[index];

                    return _CommentItem(
                      image: comment.image,
                      name: comment.username,
                      date: comment.time,
                      comment: comment.message,
                      onMorePressed: () => _showCommentActions(comment),
                    );
                  },
                ),
              ),

              /// input field
              widget.commentsEnabled
                  ? _commentInput()
                  : _commentsDisabledNote(),
            ],
          ),
        );
      },
    );
  }

  Widget _commentsDisabledNote() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Brightness.dark == Theme.of(context).brightness
                ? Colors.white12
                : Colors.black12,
          ),
        ),
      ),
      child: Text(
        'Comment box is disabled for this post',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Brightness.dark == Theme.of(context).brightness
              ? Colors.white54
              : Colors.black54,
          fontSize: 13,
          fontFamily: "Gilroy",
        ),
      ),
    );
  }

  Widget _commentInput() {
    final myIndex = _myCommentIndex();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Brightness.dark == Theme.of(context).brightness
                ? Colors.white12
                : Colors.black12,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(
                image: AssetImage(_currentUserImage),
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: TextField(
              controller: _controller,
              style: TextStyle(
                color: Brightness.dark == Theme.of(context).brightness
                    ? kwhiteColor
                    : kblackColor,
              ),
              decoration: InputDecoration(
                hintText: myIndex == -1
                    ? "Add a comment..."
                    : "Edit your comment...",
                hintStyle: TextStyle(
                  color: Brightness.dark == Theme.of(context).brightness
                      ? Colors.white54
                      : Colors.black54,
                ),
                border: InputBorder.none,
              ),
            ),
          ),

          if (myIndex != -1)
            CupertinoButton(
              padding: const EdgeInsets.only(right: 6),
              minimumSize: const Size(0, 0),
              onPressed: () {
                setState(() {
                  _comments.removeAt(myIndex);
                  _controller.clear();
                });
              },
              child: const Icon(
                CupertinoIcons.delete,
                color: CupertinoColors.systemRed,
                size: 20,
              ),
            ),

          CupertinoButton(
            padding: EdgeInsets.zero,
            child: const Icon(
              CupertinoIcons.paperplane_fill,
              color: kgoldColor,
            ),

            onPressed: () {
              final text = _controller.text.trim();
              if (text.isEmpty) return;

              setState(() {
                final updatedComment = CommentModel(
                  username: _currentUsername,
                  image: _currentUserImage,
                  message: text,
                  time: 'now',
                );

                if (myIndex == -1) {
                  _comments.insert(0, updatedComment);
                } else {
                  _comments[myIndex] = updatedComment;
                }

                _controller.clear();
              });
            },
          ),
        ],
      ),
    );
  }
}

class _CommentItem extends StatelessWidget {
  final String image;
  final String name;
  final String date;
  final String comment;
  final VoidCallback onMorePressed;

  const _CommentItem({
    required this.image,
    required this.name,
    required this.date,
    required this.comment,
    required this.onMorePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// avatar
          Container(
            height: 38,
            width: 38,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(width: 12),

          /// text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Brightness.dark == Theme.of(context).brightness
                              ? kwhiteColor
                              : kblackColor,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      date,
                      style: TextStyle(
                        color: Brightness.dark == Theme.of(context).brightness
                            ? Colors.white54
                            : Colors.black54,
                        fontSize: 12,
                      ),
                    ),
                    CupertinoButton(
                      padding: const EdgeInsets.only(left: 8),
                      onPressed: onMorePressed,
                      child: const Icon(
                        CupertinoIcons.ellipsis,
                        color: kgoldColor,
                        size: 18,
                      ),
                      minimumSize: Size(0, 0),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  comment,
                  style: TextStyle(
                    color: Brightness.dark == Theme.of(context).brightness
                        ? kwhiteColor
                        : kblackColor,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
