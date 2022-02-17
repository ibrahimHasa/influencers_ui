class UserModel {
  final String name;
  final String urlImage;
  final String location;
  final String bio;
  final int countFollowers;
  final int countFollowing;
  final int countPosts;
  final List<String> urlPhotos;
  bool isFollowing;

  UserModel(
      {required this.name,
      required this.urlImage,
      required this.location,
      required this.bio,
      required this.countFollowers,
      required this.countFollowing,
      required this.countPosts,
      required this.urlPhotos,
      required this.isFollowing});
}

final users = <UserModel>[
  UserModel(
    name: 'Abo Treka',
    urlImage: 'assets/images/treka.jpg',
    location: 'Egypt',
    bio:
        'AbouTrika is an Egyptian retired professional footballer who played as an attacking midfielder and a forward.',
    countFollowers: 1400,
    countFollowing: 100,
    countPosts: 35,
    urlPhotos: [
      'assets/images/treka1.jpg',
      'assets/images/treka2.jpg',
      'assets/images/treka3.jpg',
      'assets/images/treka4.png',
      'assets/images/treka5.jpg',
    ],
    isFollowing: true,
  ),
  UserModel(
    name: 'El Sharawy',
    urlImage: 'assets/images/sharawy.jpg',
    location: 'Marseille, France',
    bio:
        'Travelling, adventures, extreme sports are also an integral part of me, but I like watching and admiring extreme sports rather than doing it ?',
    countFollowers: 1000000,
    countFollowing: 100,
    countPosts: 500,
    urlPhotos: [
      'assets/images/shekh1.jpg',
      'assets/images/shekh2.jpg',
      'assets/images/shekh4.jpg',
      'assets/images/shekh3.jpg',
      'assets/images/shekh5.jpg',
    ],
    isFollowing: false,
  ),
  UserModel(
    name: 'Magdy Yaqoup',
    urlImage: 'assets/images/yaqoup.jpg',
    location: 'Marseille, France',
    bio:
        'Travelling, adventures, extreme sports are also an integral part of me, but I like watching and admiring extreme sports rather than doing it ?',
    countFollowers: 888888,
    countFollowing: 50,
    countPosts: 100,
    urlPhotos: [
      'assets/images/yacop1.jpg',
      'assets/images/yacop2.jpg',
      'assets/images/yacop4.jpg',
      'assets/images/yacop5.jpg',
      'assets/images/yacop3.jpeg',
    ],
    isFollowing: false,
  ),
];
