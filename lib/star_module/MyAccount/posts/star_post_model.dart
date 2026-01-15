import 'package:harmanapp/models/post_model.dart';

class StarPostModel {
  String name;
  String sname;
  String tier;
  String profileImage;
  String category;
  PostModel post;
  double? rating; // 4.0, 4.5, 5.0
  String? badge;
  bool hasStory;
  StarPostModel({
    required this.name,
    required this.sname,
    required this.tier,
    required this.profileImage,
    required this.category,
    required this.post,
    this.hasStory = false,

    this.rating,
    this.badge,
  });
}

List<StarPostModel> posts = [
  StarPostModel(
    name: 'Virat Kohli',
    sname: '@ViratKohli',
    profileImage: 'Virat_Kohli.jpg',
    category: 'Cricketer & youth icon',
    tier: 'gold',
    post: PostModel(
      postType: Post.reel,
      video: 'virat.mp4',
      description: 'Funny Moment',
      likes: '6',
      date: 'December 03',
    ),
    hasStory: true,
  ),
  StarPostModel(
    name: 'Virat Kohli',
    sname: '@ViratKohli',
    profileImage: 'Virat_Kohli.jpg',
    category: 'Cricketer & youth icon',
    tier: 'gold',

    post: PostModel(
      postType: Post.picture,
      images: ['tata-jaguar.webp', 'jaguar.webp'],
      description: 'Tata - jaguar',
      likes: '26',
      comments: '5',
      date: '2 hours ago',
    ),
    hasStory: true,
  ),
  StarPostModel(
    name: 'Virat Kohli',
    sname: '@ViratKohli',
    profileImage: 'Virat_Kohli.jpg',
    category: 'Cricketer & youth icon',
    tier: 'gold',

    post: PostModel(
      postType: Post.reel,
      video: 'deepika.mp4',
      description:
          'Pregnant Deepika Padukone plays ‘Dandiya’ with Ranveer Singh at Anant-Radhika’s pre-wedding ',
      likes: '1,279',
      comments: '97',
      date: '3 hours ago',
    ),
    hasStory: true,
  ),
  StarPostModel(
    name: 'Virat Kohli',
    sname: '@ViratKohli',
    profileImage: 'Virat_Kohli.jpg',
    category: 'Cricketer & youth icon',
    tier: 'gold',

    post: PostModel(
      postType: Post.picture,
      images: ['infosys.jpg'],
      description: 'Infosys',
      likes: '22',
      comments: '9',
      date: '2 days ago',
    ),
  ),
  StarPostModel(
    name: 'Virat Kohli',
    sname: '@ViratKohli',
    profileImage: 'Virat_Kohli.jpg',
    category: 'Cricketer & youth icon',
    tier: 'gold',

    post: PostModel(
      postType: Post.picture,
      images: ['falguni1.webp', 'falguni2.jpeg'],
      description: 'NYKAA',
      likes: '50',
      comments: '15',
      date: '1 day ago',
    ),
    hasStory: true,
  ),
  StarPostModel(
    name: 'Virat Kohli',
    sname: '@ViratKohli',
    profileImage: 'Virat_Kohli.jpg',
    category: 'Cricketer & youth icon',
    tier: 'gold',

    post: PostModel(
      postType: Post.reel,
      video: 'oprah.mp4',
      description: 'Devices are stealing kids childhood',
      likes: '14',
      comments: '4',
      date: 'November 21',
    ),
  ),
  StarPostModel(
    name: 'Virat Kohli',
    sname: '@ViratKohli',
    profileImage: 'Virat_Kohli.jpg',
    category: 'Cricketer & youth icon',
    tier: 'gold',

    post: PostModel(
      postType: Post.picture,
      images: ['tesla.jpg'],
      description: 'Tesla',
      likes: '100',
      comments: '9',
      date: '1 day ago',
    ),
    hasStory: true,
  ),
  StarPostModel(
    name: 'Virat Kohli',
    sname: '@ViratKohli',
    profileImage: 'Virat_Kohli.jpg',
    category: 'Cricketer & youth icon',
    tier: 'gold',

    post: PostModel(
      postType: Post.reel,
      video: 'obama.mp4',
      description: 'Barack Obama Worst Day As President  ',
      likes: '1,396',
      comments: '122',
      date: '2 days ago',
    ),
    hasStory: true,
  ),
];
