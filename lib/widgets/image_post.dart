import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harmanapp/models/user_post_model.dart';
import 'package:harmanapp/widgets/story_picture.dart';

class ImagePost extends StatefulWidget {
  const ImagePost({super.key, required this.post});
  final UserPostModel post;
  @override
  State<ImagePost> createState() => _ImagePostState();
}

class _ImagePostState extends State<ImagePost> {
  late PageController _pageController;
  int _currentImage = 0;
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
            StoryPicture(user: widget.post, hideName: true, size: 60),
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
            CupertinoButton(
              child: const Icon(
                CupertinoIcons.ellipsis,
                color: Color(0xFFF5D778),
              ),
              onPressed: () {},
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
                onPressed: () {
                  setState(() {
                    widget.post.post.liked = !widget.post.post.liked;
                  });
                },
                padding: EdgeInsets.zero,
                child: Icon(
                  widget.post.post.liked
                      ? CupertinoIcons.heart_fill
                      : CupertinoIcons.heart,
                  color: widget.post.post.liked
                      ? CupertinoColors.systemRed
                      : CupertinoColors.white,
                ),
              ),
              CupertinoButton(
                onPressed: () {},
                padding: EdgeInsets.zero,
                child: const Icon(
                  CupertinoIcons.conversation_bubble,
                  color: CupertinoColors.white,
                ),
              ),
              CupertinoButton(
                onPressed: () {},
                padding: EdgeInsets.zero,
                child: const Icon(
                  CupertinoIcons.paperplane,
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${widget.post.post.likes} likes',
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
}
