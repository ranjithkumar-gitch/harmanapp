import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harmanapp/models/user_post_model.dart';
import 'package:harmanapp/widgets/story_picture.dart';
import 'package:lottie/lottie.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReelPost extends StatefulWidget {
  const ReelPost({super.key, required this.post});
  final UserPostModel post;
  @override
  State<ReelPost> createState() => _ReelPostState(post);
}

class _ReelPostState extends State<ReelPost>
    with SingleTickerProviderStateMixin {
  late VideoPlayerController _playerController;
  late UserPostModel post;
  double _rating = 0.0;
  bool _showRatingBar = false;
  Color _ratingColor = CupertinoColors.white;
  _ReelPostState(this.post);
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
              'assets/sources/videos/${post.post.video}',
            )
            ..addListener(() {})
            ..setLooping(true)
            ..initialize().then((value) => setState(() {}));
    } catch (error) {
      print(error);
    }

    _lottieController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5), // play for 5 seconds
    );

    // Listen for completion
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
              child: StoryPicture(user: widget.post, hideName: true, size: 60),
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
                      color: Color(0xFFF5D778),
                    ),
                  ),
                ),
                Text(
                  widget.post.sname.toString(),

                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const Spacer(),

            Builder(
              builder: (context) {
                return CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: const Icon(
                    CupertinoIcons.ellipsis,
                    color: Color(0xFFF5D778),
                  ),
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
                      color: Colors.black,
                      context: context,
                      position: position,
                      items: [
                        PopupMenuItem(
                          value: 'Restrict',
                          child: Text(
                            'Restrict',
                            style: TextStyle(
                              color: Colors.white,
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
                              color: Colors.white,
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
                              color: Colors.white,
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
                              color: Colors.white,
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
                      color: CupertinoColors.white.withOpacity(1),
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
                      : const Icon(
                          CupertinoIcons.star_fill,
                          color: CupertinoColors.white,
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
                      ? const Color(0xFFD4AF37)
                      : CupertinoColors.white,
                ),
              ),
              // CupertinoButton(
              //   onPressed: () {
              //     Share.share(
              //       'Check out this post!',
              //       subject: 'Shared from app',
              //     );
              //   },
              //   padding: EdgeInsets.zero,
              //   child: const Icon(
              //     CupertinoIcons.arrowshape_turn_up_right,
              //     color: CupertinoColors.white,
              //   ),
              // ),
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () async {
                  setState(() {
                    _isSharing = true;
                  });

                  await Share.share(
                    'Check out this post!',
                    subject: 'Shared from app',
                  );

                  if (!mounted) return;

                  setState(() {
                    _isSharing = false;
                  });
                },
                child: Icon(
                  CupertinoIcons.arrowshape_turn_up_right,
                  color: _isSharing
                      ? const Color(0xFFD4AF37)
                      : CupertinoColors.white,
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
                  color: Color(0xFFD4AF37),
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
                border: Border.all(color: Colors.amber, width: 1),
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
                            color: _rating == 0.0 ? Colors.grey : Colors.amber,
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

                  //const SizedBox(height: 6),
                ],
              ),
            ),
          ),
        if (_showCommentBox)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFD4AF37), width: 1),
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
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Write a comment...",
                      hintStyle: const TextStyle(color: Colors.white54),
                      filled: true,
                      fillColor: Colors.black,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  /// 📤 Post button
                  Align(
                    alignment: Alignment.centerRight,
                    child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      child: const Icon(
                        CupertinoIcons.paperplane_fill,
                        color: Color(0xFFD4AF37),
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
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              RichText(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: widget.post.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: CupertinoColors.white,
                        fontSize: 16,
                      ),
                    ),
                    const TextSpan(text: '  '),
                    TextSpan(
                      text: widget.post.post.description ?? '',
                      style: const TextStyle(
                        color: CupertinoColors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              if (widget.post.post.comments != null) ...[
                const SizedBox(height: 5),
                Text(
                  'View all ${widget.post.post.comments} comments',
                  style: TextStyle(
                    color: CupertinoColors.black.withOpacity(.8),
                    fontSize: 16,
                  ),
                ),
              ],
              const SizedBox(height: 5),
              Text(
                widget.post.post.date!,
                style: TextStyle(
                  color: CupertinoColors.white.withOpacity(.8),
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
      return const Color(0xFFFFD700); // Gold
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

  const RatingCard({Key? key, required this.onRatingSelected})
    : super(key: key);

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
                  color: CupertinoColors.systemOrange,
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
