// import 'package:harmanapp/models/post_model.dart';

// class StarUserPostModel {
//   String name;
//   String sname;
//   String tier;
//   String profileImage;
//   String category;
//   PostModel post;
//   double? rating; // 4.0, 4.5, 5.0
//   String? badge;
//   bool hasStory;
//   StarUserPostModel({
//     required this.name,
//     required this.sname,
//     required this.tier,
//     required this.profileImage,
//     required this.category,
//     required this.post,
//     this.hasStory = false,

//     this.rating,
//     this.badge,
//   });
// }

// List<StarUserPostModel> posts = [
//   StarUserPostModel(
//     name: 'Virat Kohli',
//     sname: '@ViratKohli',
//     profileImage: 'Virat_Kohli.jpg',
//     category: 'Cricketer & youth icon',
//     tier: 'gold',
//     post: PostModel(
//       postType: Post.reel,
//       video: 'virat.mp4',
//       description: 'Funny Moment',
//       likes: '6',
//       date: 'December 03',
//     ),
//     hasStory: true,
//   ),
//   StarUserPostModel(
//     name: 'Ratan Tata',
//     sname: '@ratantata',
//     tier: 'gold',
//     profileImage: 'Ratan_Tata.jpg',
//     category: 'Business icon & philanthropist',

//     post: PostModel(
//       postType: Post.picture,
//       images: ['tata-jaguar.webp', 'jaguar.webp'],
//       description: 'Tata - jaguar',
//       likes: '26',
//       comments: '5',
//       date: '2 hours ago',
//     ),
//     hasStory: true,
//   ),
//   StarUserPostModel(
//     name: 'Deepika Padukone',
//     sname: '@deepikapadukone',
//     tier: 'bronze',
//     profileImage: 'deepika.jpg',
//     category: 'Actress & mental health advocate',

//     post: PostModel(
//       postType: Post.reel,
//       video: 'deepika.mp4',
//       description:
//           'Pregnant Deepika Padukone plays ‘Dandiya’ with Ranveer Singh at Anant-Radhika’s pre-wedding ',
//       likes: '1,279',
//       comments: '97',
//       date: '3 hours ago',
//     ),
//     hasStory: true,
//   ),
//   StarUserPostModel(
//     name: 'Narayana Murthy',
//     sname: '@narayanamurthy',
//     tier: 'gold',
//     profileImage: 'murthy.jpg',
//     category: 'Infosys founder',

//     post: PostModel(
//       postType: Post.picture,
//       images: ['infosys.jpg'],
//       description: 'Infosys',
//       likes: '22',
//       comments: '9',
//       date: '2 days ago',
//     ),
//   ),
//   StarUserPostModel(
//     name: 'Falguni Nayar',
//     sname: '@falguni_nayar',
//     tier: 'silver',
//     profileImage: 'nayar.jpeg',
//     category: 'Nykaa founder',

//     post: PostModel(
//       postType: Post.picture,
//       images: ['falguni1.webp', 'falguni2.jpeg'],
//       description: 'NYKAA',
//       likes: '50',
//       comments: '15',
//       date: '1 day ago',
//     ),
//     hasStory: true,
//   ),
//   StarUserPostModel(
//     name: 'Oprah Winfrey',
//     sname: '@oprah',
//     tier: 'bronze',
//     profileImage: 'oprah.jpg',
//     category: 'Media mogul',

//     post: PostModel(
//       postType: Post.reel,
//       video: 'oprah.mp4',
//       description: 'Devices are stealing kids childhood',
//       likes: '14',
//       comments: '4',
//       date: 'November 21',
//     ),
//   ),
//   StarUserPostModel(
//     name: 'Elon Musk',
//     sname: '@elonmusk',
//     tier: 'bronze',
//     profileImage: 'elon.jpeg',
//     category: 'Tesla & SpaceX founder',

//     post: PostModel(
//       postType: Post.picture,
//       images: ['tesla.jpg'],
//       description: 'Tesla',
//       likes: '100',
//       comments: '9',
//       date: '1 day ago',
//     ),
//     hasStory: true,
//   ),
//   StarUserPostModel(
//     name: 'Barack Obama',
//     sname: '@barackobama',
//     tier: 'gold',
//     profileImage: 'obama.jpg',
//     category: 'Former U.S. President',

//     post: PostModel(
//       postType: Post.reel,
//       video: 'obama.mp4',
//       description: 'Barack Obama Worst Day As President  ',
//       likes: '1,396',
//       comments: '122',
//       date: '2 days ago',
//     ),
//     hasStory: true,
//   ),
// ];
import 'package:harmanapp/models/post_model.dart';

class StarUserPostModel {
  String name;
  String sname;
  String tier;
  String profileImage;
  String category;
  PostModel post;
  double? rating;
  String? badge;
  bool hasStory;

  StarUserPostModel({
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

List<StarUserPostModel> posts = [
  StarUserPostModel(
    name: 'Virat Kohli',
    sname: '@ViratKohli',
    tier: 'gold',
    profileImage: 'Virat_Kohli.jpg',
    category: 'Cricketer & youth icon',
    post: PostModel(
      postType: Post.reel,
      video: 'virat1.mp4',
      description: 'Match winning celebration 🔥',
      likes: '120',
      comments: '18',
      date: 'Today',
    ),
    hasStory: true,
  ),

  StarUserPostModel(
    name: 'Virat Kohli',
    sname: '@ViratKohli',
    tier: 'gold',
    profileImage: 'Virat_Kohli.jpg',
    category: 'Cricketer & youth icon',
    post: PostModel(
      postType: Post.picture,
      images: ['virat_training.jpg'],
      description: 'Training hard 💪',
      likes: '98',
      comments: '12',
      date: '1 day ago',
    ),
  ),

  StarUserPostModel(
    name: 'Virat Kohli',
    sname: '@ViratKohli',
    tier: 'gold',
    profileImage: 'Virat_Kohli.jpg',
    category: 'Cricketer & youth icon',
    post: PostModel(
      postType: Post.picture,
      images: ['virat_family.jpg'],
      description: 'Family time ❤️',
      likes: '210',
      comments: '45',
      date: '2 days ago',
    ),
    hasStory: true,
  ),

  StarUserPostModel(
    name: 'Virat Kohli',
    sname: '@ViratKohli',
    tier: 'gold',
    profileImage: 'Virat_Kohli.jpg',
    category: 'Cricketer & youth icon',
    post: PostModel(
      postType: Post.reel,
      video: 'virat_gym.mp4',
      description: 'Fitness is a lifestyle 🏋️‍♂️',
      likes: '175',
      comments: '29',
      date: '3 days ago',
    ),
  ),

  StarUserPostModel(
    name: 'Virat Kohli',
    sname: '@ViratKohli',
    tier: 'gold',
    profileImage: 'Virat_Kohli.jpg',
    category: 'Cricketer & youth icon',
    post: PostModel(
      postType: Post.picture,
      images: ['virat_match.jpg'],
      description: 'Focus & discipline 🏏',
      likes: '260',
      comments: '63',
      date: '5 days ago',
    ),
    hasStory: true,
  ),
];
