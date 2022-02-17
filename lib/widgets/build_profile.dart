import 'package:flutter/material.dart';
import 'package:social/models/user_model.dart';

class BuildProfile extends StatefulWidget {
  const BuildProfile({Key? key, required this.user, required this.onPressed})
      : super(key: key);
  final UserModel user;
  final VoidCallback onPressed;

  @override
  State<BuildProfile> createState() => _BuildProfileState();
}

class _BuildProfileState extends State<BuildProfile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildUser(widget.user),
              followButtom(widget.user),
            ],
          ),
        ],
      ),
    );
  }

  buildUser(UserModel user) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          user.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(user.location,
            style: TextStyle(
              fontSize: 16,
            )),
      ],
    );
  }

  followButtom(UserModel user) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeIn,
        width: user.isFollowing ? 50 : 60,
        child: user.isFollowing ? buildUnFollow() : buildFollow(),
      ),
    );
  }

  buildFollow() {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(width: 2.5, color: Colors.tealAccent)),
        child: FittedBox(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              'Follow',
              style: TextStyle(
                  color: Colors.tealAccent,
                  // fontWeight: FontWeight.bold,
                  fontSize: 12),
            ),
          ),
        ));
  }

  buildUnFollow() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.tealAccent,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Icon(
        Icons.people,
        color: Colors.white,
      ),
    );
  }
}
