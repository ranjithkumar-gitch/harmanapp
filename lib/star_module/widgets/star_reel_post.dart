import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harmanapp/star_module/MyAccount/posts/star_post_model.dart';
import 'package:harmanapp/star_module/widgets/star_story_picture.dart';
import 'package:harmanapp/widgets/theme_notifier.dart';
import 'package:lottie/lottie.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class StarReelPost extends StatefulWidget {
  const StarReelPost({super.key, required this.post});
  final StarPostModel post;
  @override
  State<StarReelPost> createState() => _StarReelPostState();
}

class _StarReelPostState extends State<StarReelPost>
    with SingleTickerProviderStateMixin {
  static const String _currentUsername = 'ranjith';
  static const String _currentUserImage =
      'assets/sources/profiles/averie-woodard.jpg';

  late VideoPlayerController _playerController;
  // late UserPostModel post;
  double _rating = 0.0;
  bool _showRatingBar = false;
  Color _ratingColor = CupertinoColors.white;
  // _ReelPostState(this.post);
  double _starScale = 1.0;
  bool _useLottieStar = false;
  late final AnimationController _lottieController;
  bool isPlaying = false;
  bool _showCommentBox = false;
  bool _commentsEnabled = true;
  bool _isSharing = false;
  String? _myComment;

  final TextEditingController _commentController = TextEditingController();

  @override
  void initState() {
    try {
      _playerController =
          VideoPlayerController.asset(
              'assets/sources/videos/${widget.post.post.video}',
            )
            ..addListener(() {})
            ..setLooping(true)
            ..initialize().then((value) => setState(() {}));
    } catch (error, stackTrace) {
      debugPrint('VideoPlayer initialization failed: $error');
      debugPrintStack(stackTrace: stackTrace);
    }

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
    _commentController.dispose();
    _lottieController.dispose();
    _playerController.dispose();
    super.dispose();
  }

  void _playAnimation() {
    setState(() {
      isPlaying = true;
    });
    _lottieController.forward(from: 0);
  }

  int get _displayCommentCount {
    final baseCount =
        int.tryParse(widget.post.post.comments?.toString() ?? '') ?? 0;
    return baseCount + (_myComment == null ? 0 : 1);
  }

  void _toggleCommentComposer() {
    setState(() {
      _showCommentBox = !_showCommentBox;
      _showRatingBar = false;
      if (_showCommentBox && _myComment != null) {
        _commentController.text = _myComment!;
        _commentController.selection = TextSelection.fromPosition(
          TextPosition(offset: _commentController.text.length),
        );
      }
      if (!_showCommentBox && _myComment == null) {
        _commentController.clear();
      }
    });
  }

  void _saveComment() {
    final comment = _commentController.text.trim();
    if (comment.isEmpty) return;

    setState(() {
      _myComment = comment;
      _showCommentBox = false;
      _commentController.clear();
    });
  }

  void _editMyComment() {
    setState(() {
      _showCommentBox = true;
      _showRatingBar = false;
      _commentController.text = _myComment ?? '';
      _commentController.selection = TextSelection.fromPosition(
        TextPosition(offset: _commentController.text.length),
      );
    });
  }

  void _deleteMyComment() {
    setState(() {
      _myComment = null;
      _commentController.clear();
      _showCommentBox = false;
    });
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
                  widget.post.sname.toString(),

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
                          value: 'Restrict',
                          child: Text(
                            'Restrict',
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
                          value: 'Report',
                          child: Text(
                            'Report',
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

                    if (value == 'Restrict') {
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
                              "Restrict Publication",
                              style: TextStyle(
                                color: kgoldColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            content: Text(
                              "Are you sure you want to Restrict this Publication?",
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
                                  "Restrict",
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
                    } else if (value == 'Report') {
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
                              "Report Publication",
                              style: TextStyle(
                                color: kgoldColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            content: Text(
                              "Are you sure you want to Report this Publication?",
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
                                  "Report",
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
        GestureDetector(
          onTap: () {
            if (_playerController.value.isPlaying) {
              _playerController.pause();
            } else {
              _playerController.play();
            }
          },
          onLongPressStart: (event) {
            _playerController.pause();
          },
          onLongPressEnd: (event) {
            _playerController.play();
          },
          child: ClipRect(
            clipBehavior: Clip.hardEdge,
            child: Stack(
              children: [
                Container(
                  height: 450,
                  alignment: Alignment.center,
                  child: Transform.scale(
                    scale: 1.5,
                    child: AspectRatio(
                      aspectRatio: _playerController.value.aspectRatio,
                      child: VideoPlayer(_playerController),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CupertinoButton(
                    child: Icon(
                      _playerController.value.volume == 1
                          ? CupertinoIcons.speaker_2_fill
                          : CupertinoIcons.volume_off,
                      color: CupertinoColors.white.withValues(alpha: 1),
                    ),
                    onPressed: () {
                      if (_playerController.value.volume == 0) {
                        _playerController.setVolume(1);
                        setState(() {});
                      } else {
                        setState(() {});
                        _playerController.setVolume(0);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  setState(() {
                    _showRatingBar = !_showRatingBar;
                  });
                },
                child: AnimatedScale(
                  scale: _starScale,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.elasticOut,
                  child: _useLottieStar
                      ? Lottie.asset(
                          'assets/Star.json',
                          width: 40,
                          height: 40,
                          repeat: false,
                          controller: _lottieController,
                          onLoaded: (composition) {
                            _lottieController.duration = const Duration(
                              seconds: 5,
                            );
                          },
                          delegates: LottieDelegates(
                            values: [
                              ValueDelegate.color(['**'], value: _ratingColor),
                            ],
                          ),
                        )
                      : Icon(
                          CupertinoIcons.star_fill,
                          color: Brightness.dark == Theme.of(context).brightness
                              ? kwhiteColor
                              : kblackColor,
                          size: 18,
                        ),
                ),
              ),

              CupertinoButton(
                onPressed: _commentsEnabled ? _toggleCommentComposer : null,
                padding: EdgeInsets.zero,
                child: Icon(
                  CupertinoIcons.text_bubble,
                  color: !_commentsEnabled
                      ? CupertinoColors.systemGrey
                      : _showCommentBox
                      ? kgoldColor
                      : Brightness.dark == Theme.of(context).brightness
                      ? kwhiteColor
                      : kblackColor,
                ),
              ),

              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () async {
                  setState(() {
                    _isSharing = true;
                  });

                  SharePlus.instance.share(
                    ShareParams(text: 'Check this out!'),
                  );

                  if (!mounted) return;

                  setState(() {
                    _isSharing = false;
                  });
                },
                child: Icon(
                  CupertinoIcons.arrowshape_turn_up_right,
                  color: _isSharing
                      ? kgoldColor
                      : Brightness.dark == Theme.of(context).brightness
                      ? kwhiteColor
                      : kblackColor,
                ),
              ),

              const Spacer(),
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
                              const Icon(Icons.star, color: kgoldColor),
                          onRatingUpdate: (rating) {
                            _rating = rating;
                            setState(() {
                              _rating = rating;
                            });
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: CupertinoButton(
                          padding: EdgeInsets.zero,
                          child: Icon(
                            size: 24,
                            Icons.check_circle_outline,
                            color: _rating == 0.0 ? Colors.grey : kgoldColor,
                          ),

                          onPressed: () {
                            setState(() {
                              _ratingColor = _getRatingColor(_rating);
                              _showRatingBar = false;
                              _useLottieStar = true;
                              _playAnimation();
                              _starScale = 1.4;
                            });

                            Future.delayed(
                              const Duration(milliseconds: 300),
                              () {
                                if (!mounted) return;
                                setState(() {
                                  _starScale = 1.0;
                                });
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
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
                  TextField(
                    controller: _commentController,
                    maxLines: 2,
                    style: TextStyle(
                      color: Brightness.dark == Theme.of(context).brightness
                          ? Colors.white
                          : Colors.black,
                    ),
                    decoration: InputDecoration(
                      hintText: _myComment == null
                          ? "Write a comment..."
                          : "Edit your comment...",
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
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (_myComment != null)
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: _deleteMyComment,
                            child: const Icon(
                              CupertinoIcons.delete,
                              color: CupertinoColors.systemRed,
                            ),
                          ),
                        CupertinoButton(
                          padding: EdgeInsets.zero,
                          child: const Icon(
                            CupertinoIcons.paperplane_fill,
                            color: kgoldColor,
                          ),
                          onPressed: _saveComment,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${widget.post.post.likes} Stars',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Brightness.dark == Theme.of(context).brightness
                      ? kwhiteColor
                      : kblackColor,
                ),
              ),
              RichText(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: widget.post.name,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Brightness.dark == Theme.of(context).brightness
                            ? kwhiteColor
                            : kblackColor,
                        fontSize: 16,
                      ),
                    ),
                    const TextSpan(text: '  '),
                    TextSpan(
                      text: widget.post.post.description ?? '',
                      style: TextStyle(
                        color: Brightness.dark == Theme.of(context).brightness
                            ? kwhiteColor
                            : kblackColor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              if (widget.post.post.comments != null) ...[
                const SizedBox(height: 5),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (_) => StarReelCommentBottomSheet(
                        post: widget.post,
                        commentsEnabled: _commentsEnabled,
                      ),
                    );
                  },

                  child: Text(
                    'View all $_displayCommentCount comments',
                    style: TextStyle(
                      fontFamily: "Gilroy",
                      color: kgoldColor,
                      fontSize: 14,
                    ),
                  ),
                ),
                if (!_commentsEnabled)
                  const Padding(
                    padding: EdgeInsets.only(top: 6),
                    child: Text(
                      'Comment box disabled for this post',
                      style: TextStyle(
                        fontFamily: "Gilroy",
                        color: kgreyColor,
                        fontSize: 12,
                      ),
                    ),
                  ),
              ],
              if (_myComment != null)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: GestureDetector(
                    onTap: _editMyComment,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 34,
                          width: 34,
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      _currentUsername,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color:
                                            Brightness.dark ==
                                                Theme.of(context).brightness
                                            ? kwhiteColor
                                            : kblackColor,
                                      ),
                                    ),
                                  ),
                                  CupertinoButton(
                                    padding: EdgeInsets.zero,
                                    minimumSize: const Size(0, 0),
                                    onPressed: _editMyComment,
                                    child: const Icon(
                                      CupertinoIcons.pencil,
                                      size: 18,
                                      color: kgoldColor,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  CupertinoButton(
                                    padding: EdgeInsets.zero,
                                    minimumSize: const Size(0, 0),
                                    onPressed: _deleteMyComment,
                                    child: const Icon(
                                      CupertinoIcons.delete,
                                      size: 18,
                                      color: CupertinoColors.systemRed,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                _myComment!,
                                style: TextStyle(
                                  color:
                                      Brightness.dark ==
                                          Theme.of(context).brightness
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
                  ),
                ),
              const SizedBox(height: 5),
              Text(
                widget.post.post.date!,
                style: TextStyle(
                  color: Brightness.dark == Theme.of(context).brightness
                      ? kwhiteColor
                      : kblackColor,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String getRatingLevel(double rating) {
    if (rating == 5.0) return "Gold";
    if (rating >= 4.5) return "Silver";
    if (rating >= 4.0) return "Bronze";
    return "None";
  }

  Color _getRatingColor(double rating) {
    if (rating == 5.0) {
      return kgoldColor; // Gold
    } else if (rating >= 4.5) {
      return const Color(0xFFC0C0C0); // Silver
    } else if (rating >= 0.0) {
      return const Color(0xFFCD7F32); // Bronze
    }
    return CupertinoColors.white;
  }
}

class RatingCard extends StatefulWidget {
  final Function(double) onRatingSelected;

  const RatingCard({super.key, required this.onRatingSelected});

  @override
  State<RatingCard> createState() => _RatingCardState();
}

class _RatingCardState extends State<RatingCard> {
  double _rating = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoPopupSurface(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(5, (index) {
            final starIndex = index + 1;
            return GestureDetector(
              onTap: () {
                setState(() => _rating = starIndex.toDouble());
                widget.onRatingSelected(_rating);
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Icon(
                  starIndex <= _rating
                      ? CupertinoIcons.star_fill
                      : CupertinoIcons.star,
                  color: kgoldColor,
                  size: 28,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

final List<StarReelCommentModel> _starReelCommentsSeed = [
  StarReelCommentModel(
    username: 'john_doe',
    image: 'assets/sources/profiles/aiony-haust.jpg',
    message: 'This looks amazing',
    time: '2d',
  ),
  StarReelCommentModel(
    username: 'alex_99',
    image: 'assets/sources/profiles/deco-dev.png',
    message: 'Pure elegance',
    time: '1d',
  ),
  StarReelCommentModel(
    username: 'maria_k',
    image: 'assets/sources/profiles/aiony-haust.jpg',
    message: 'Luxury vibes only',
    time: '5h',
  ),
  StarReelCommentModel(
    username: 'rohit.dev',
    image: 'assets/sources/profiles/azamat-zhanisov-.jpg',
    message: 'Nice shot',
    time: '3h',
  ),
];

class StarReelCommentModel {
  final String username;
  final String image;
  final String message;
  final String time;

  const StarReelCommentModel({
    required this.username,
    required this.image,
    required this.message,
    required this.time,
  });
}

class StarReelCommentBottomSheet extends StatefulWidget {
  final StarPostModel post;
  final bool commentsEnabled;

  const StarReelCommentBottomSheet({
    super.key,
    required this.post,
    required this.commentsEnabled,
  });

  @override
  State<StarReelCommentBottomSheet> createState() =>
      _StarReelCommentBottomSheetState();
}

class _StarReelCommentBottomSheetState
    extends State<StarReelCommentBottomSheet> {
  final TextEditingController _controller = TextEditingController();
  late final List<StarReelCommentModel> _comments;
  final Set<String> _blockedUsers = <String>{};
  static const String _currentUsername = 'stargazer.you';
  static const String _currentUserImage =
      'assets/sources/profiles/averie-woodard.jpg';

  @override
  void initState() {
    super.initState();
    _comments = List<StarReelCommentModel>.from(_starReelCommentsSeed);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _showCommentActions(StarReelCommentModel comment) async {
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

  Future<void> _confirmDeleteComment(StarReelCommentModel comment) async {
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

  Future<void> _confirmBlockAndDeleteComment(
    StarReelCommentModel comment,
  ) async {
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
            'Are you sure you want block this user from this time line and delete this comment?',
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
    final visibleComments = _comments
        .where((comment) => !_blockedUsers.contains(comment.username))
        .toList();

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
              Text(
                'Comments',
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
                  itemCount: visibleComments.length,
                  itemBuilder: (_, index) {
                    final comment = visibleComments[index];
                    return _StarReelCommentItem(
                      image: comment.image,
                      name: comment.username,
                      date: comment.time,
                      comment: comment.message,
                      onMorePressed: () => _showCommentActions(comment),
                    );
                  },
                ),
              ),
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
          fontFamily: 'Gilroy',
        ),
      ),
    );
  }

  Widget _commentInput() {
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
                hintText: 'Add a comment...',
                hintStyle: TextStyle(
                  color: Brightness.dark == Theme.of(context).brightness
                      ? Colors.white54
                      : Colors.black54,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              final text = _controller.text.trim();
              if (text.isEmpty) return;

              setState(() {
                _comments.insert(
                  0,
                  StarReelCommentModel(
                    username: _currentUsername,
                    image: _currentUserImage,
                    message: text,
                    time: 'now',
                  ),
                );
                _controller.clear();
              });
            },
            child: const Icon(
              CupertinoIcons.paperplane_fill,
              color: kgoldColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _StarReelCommentItem extends StatelessWidget {
  final String image;
  final String name;
  final String date;
  final String comment;
  final VoidCallback onMorePressed;

  const _StarReelCommentItem({
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
                      minimumSize: const Size(0, 0),
                      child: const Icon(
                        CupertinoIcons.ellipsis,
                        color: kgoldColor,
                        size: 18,
                      ),
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
