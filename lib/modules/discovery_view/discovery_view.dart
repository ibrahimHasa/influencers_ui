import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:social/models/user_model.dart';
import 'package:social/widgets/build_profile.dart';
import 'package:social/widgets/item_widget.dart';

class DiscoveryView extends StatefulWidget {
  DiscoveryView({Key? key}) : super(key: key);

  @override
  State<DiscoveryView> createState() => _DiscoveryViewState();
}

class _DiscoveryViewState extends State<DiscoveryView> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final panelController = PanelController();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.close,
          ),
        ),
      ),
      body: SlidingUpPanel(
        maxHeight: 340,
        minHeight: 150,
        controller: panelController,
        color: Colors.transparent,
        parallaxEnabled: true,
        parallaxOffset: .5,
        body: PageView.builder(
          itemBuilder: (context, index) {
            return Image.asset(
              users[index].urlImage,
              fit: BoxFit.cover,
            );
          },
          itemCount: users.length,
          onPageChanged: (index) {
            setState(() {
              this.index = index;
            });
          },
        ),
        panelBuilder: (ScrollController scroll) {
          return Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ItemWidget(
                      title: "Followers",
                      count: users[index].countFollowers,
                    ),
                    ItemWidget(
                      title: "Following",
                      count: users[index].countFollowing,
                    ),
                    ItemWidget(
                      title: "Posts",
                      count: users[index].countPosts,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      BuildProfile(
                        user: users[index],
                        onPressed: () {
                          setState(() {
                            users[index].isFollowing =
                                !users[index].isFollowing;
                          });
                        },
                      ),
                      Expanded(
                        child: buildProfileDetails(users[index]),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.tealAccent,
          animationDuration: Duration(milliseconds: 300),
          index: 0,
          items: [
            Icon(
              Icons.map,
              size: 30,
            ),
            Icon(
              Icons.home,
              size: 30,
            ),
            Icon(
              Icons.people,
              size: 30,
            ),
          ]),
    );
  }

  buildProfileDetails(UserModel user) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user.bio,
            style: TextStyle(
              color: Colors.grey,
              fontStyle: FontStyle.italic,
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Photo',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: user.urlPhotos
                  .map(
                    (url) => Container(
                      height: 100,
                      width: 100,
                      padding: EdgeInsets.only(right: 10),
                      child: Image.asset(
                        url,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
