import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harmanapp/models/user_post_model.dart';
import 'package:harmanapp/widgets/story_picture.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lottie/lottie.dart';

class ImagePost extends StatefulWidget {
  const ImagePost({super.key, required this.post});
  final UserPostModel post;
  @override
  State<ImagePost> createState() => _ImagePostState();
}

class _ImagePostState extends State<ImagePost> {
  late PageController _pageController;
  int _currentImage = 0;
  double _rating = 0.0;
  bool _showRatingBar = false;
  Color _ratingColor = CupertinoColors.white;
  double _starScale = 1.0;

  bool _useLottieStar = false;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0)
      ..addListener(() {
        setState(() {
          _currentImage = _pageController.page?.toInt() ?? 0;
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
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
                        const PopupMenuItem(
                          value: 'Restrict',
                          child: Text(
                            'Restrict',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Gilroy",
                            ),
                          ),
                        ),
                        const PopupMenuItem(
                          value: 'Report',
                          child: Text(
                            'Report',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Gilroy",
                            ),
                          ),
                        ),
                        const PopupMenuItem(
                          value: 'Block',
                          child: Text(
                            'Block',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Gilroy",
                            ),
                          ),
                        ),
                        const PopupMenuItem(
                          value: 'Cancel',
                          child: Text(
                            'Cancel',
                            style: const TextStyle(
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
              const Spacer(),
              if (widget.post.post.images!.length != 1)
                DotsIndicator(dotsCount: 2, position: _currentImage.toDouble()),
              const Spacer(flex: 3),
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
                  color: CupertinoColors.white,
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RatingBar.builder(
                      initialRating: _rating,
                      minRating: 1,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 28,
                      unratedColor: Colors.grey,
                      itemBuilder: (context, _) =>
                          const Icon(Icons.star, color: Colors.amber),
                      onRatingUpdate: (rating) {
                        _rating = rating;
                      },
                    ),
                  ),
                  const SizedBox(height: 6),
                  Align(
                    alignment: Alignment.centerRight,
                    child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      child: const Text(
                        "OK",
                        style: TextStyle(color: Colors.white),
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

                          // bounce start
                          _starScale = 1.4;
                        });

                        Future.delayed(const Duration(milliseconds: 300), () {
                          if (!mounted) return;
                          setState(() {
                            _starScale = 1.0;
                          });
                        });
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
