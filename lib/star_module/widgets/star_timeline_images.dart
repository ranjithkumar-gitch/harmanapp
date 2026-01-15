import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harmanapp/star_module/MyAccount/posts/star_post_model.dart';
import 'package:harmanapp/star_module/widgets/star_story_picture.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lottie/lottie.dart';

class StarTimelineImages extends StatefulWidget {
  const StarTimelineImages({super.key, required this.post});
  final StarPostModel post;
  @override
  State<StarTimelineImages> createState() => _StarTimelineImagesState();
}

class _StarTimelineImagesState extends State<StarTimelineImages>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  int _currentImage = 0;
  double _rating = 0.0;
  bool _showRatingBar = false;
  Color _ratingColor = CupertinoColors.white;
  double _starScale = 1.0;
  late final AnimationController _lottieController;
  bool isPlaying = false;

  bool _useLottieStar = false;
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
              children: [
                Text(
                  widget.post.name,
                  // style: const TextStyle(
                  //   fontSize: 16,
                  //   color: Color(0xFFF5D778),
                  //   fontWeight: FontWeight.bold,
                  //   fontFamily: "Gilroy",
                  // ),
                  style: GoogleFonts.greatVibes(
                    textStyle: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF5D778),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '1h',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFFF5D778),
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.circle_sharp, color: Colors.white38, size: 8),
                    SizedBox(width: 5),
                    Icon(Icons.public, color: Colors.white, size: 15),
                  ],
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
                      items: const [
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
                      // handle edit
                    } else if (value == 'delete') {
                      // handle delete
                    }
                  },
                );
              },
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Social media screens ',
            style: TextStyle(color: Colors.white),
          ),
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
                    color: CupertinoColors.white,
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
          child: Column(
            children: [
              if (widget.post.post.images!.length != 1)
                Center(
                  child: Container(
                    transform: Matrix4.translationValues(0.0, -20.0, 0.0),
                    child: DotsIndicator(
                      dotsCount: 2,
                      position: _currentImage.toDouble(),
                    ),
                  ),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                // Set controller duration to match Lottie file or override
                                _lottieController.duration = const Duration(
                                  seconds: 5,
                                );
                                // _controller.setSpeed(2.0);
                              },
                              delegates: LottieDelegates(
                                values: [
                                  ValueDelegate.color([
                                    '**',
                                  ], value: _ratingColor),
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
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    child: const Icon(
                      CupertinoIcons.text_bubble,
                      color: CupertinoColors.white,
                    ),
                  ),
                  CupertinoButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    child: const Icon(
                      CupertinoIcons.arrowshape_turn_up_right,
                      color: CupertinoColors.white,
                    ),
                  ),
                  // const Spacer(),

                  //const Spacer(flex: 3),
                  // CupertinoButton(
                  //   onPressed: () {
                  //     setState(() {
                  //       widget.post.post.saved = !widget.post.post.saved;
                  //     });
                  //   },
                  //   padding: EdgeInsets.zero,
                  //   child: Icon(
                  //     widget.post.post.saved
                  //         ? CupertinoIcons.bookmark_fill
                  //         : CupertinoIcons.bookmark,
                  //     color: CupertinoColors.white,
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
        if (_showRatingBar)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.amber, // gold color
                  width: 1,
                ),
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
                            color: _rating == 0.0 ? Colors.grey : Colors.amber,
                          ),
                          // onPressed: () {
                          //   setState(() {
                          //     _ratingColor = _getRatingColor(_rating);
                          //     _showRatingBar = false;
                          //   });
                          // },
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

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${widget.post.post.likes} Stars',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Gilroy",
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
                        fontFamily: "Gilroy",
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
                    fontFamily: "Gilroy",
                    color: CupertinoColors.white,
                    fontSize: 16,
                  ),
                ),
              ],
              const SizedBox(height: 5),
              Text(
                widget.post.post.date!,
                style: TextStyle(
                  fontFamily: "Gilroy",
                  color: CupertinoColors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
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
