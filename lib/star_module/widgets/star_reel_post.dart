import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harmanapp/models/user_post_model.dart';
import 'package:harmanapp/star_module/widgets/star_story_picture.dart';
import 'package:harmanapp/widgets/image_post.dart';
import 'package:harmanapp/widgets/story_picture.dart';
import 'package:harmanapp/widgets/theme_notifier.dart';
import 'package:lottie/lottie.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class StarReelPost extends StatefulWidget {
  const StarReelPost({super.key, required this.post});
  final UserPostModel post;
  @override
  State<StarReelPost> createState() => _StarReelPostState();
}

class _StarReelPostState extends State<StarReelPost>
    with SingleTickerProviderStateMixin {
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
  bool _isSharing = false;

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
                          value: 'Cancel',
                          child: Text(
                            'Cancel',
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

                    if (value == 'edit') {
                    } else if (value == 'delete') {}
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
                onPressed: () {
                  setState(() {
                    _showCommentBox = !_showCommentBox;
                    _showRatingBar = false;
                  });
                },
                padding: EdgeInsets.zero,
                child: Icon(
                  CupertinoIcons.text_bubble,
                  color: _showCommentBox
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
        if (_showCommentBox)
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
                    style: const TextStyle(color: Colors.white),
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
                      builder: (_) => CommentBottomSheet(post: widget.post),
                    );
                  },

                  child: Text(
                    'View all ${widget.post.post.comments} comments',
                    style: TextStyle(
                      fontFamily: "Gilroy",
                      color: kgoldColor,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
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
