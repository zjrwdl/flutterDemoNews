import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      if (constraint.maxWidth > 1200) {
        return DesktopNavBar();
      } else if (constraint.maxWidth > 800 && constraint.maxWidth < 1200) {
        return DesktopNavBar();
      } else {
        return MobileNavBar();
      }
    });
  }
}

class DesktopNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'web/icons/github_icon.png',
                width: 30,
                height: 30,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Product",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Solutions",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Open Source",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Pricing",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: 200,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search github",
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Sign in",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              MaterialButton(
                onPressed: () {},
                color: Colors.black,
                child: const Text(
                  "Sign up",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MobileNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Image.asset(
          'web/icons/github_icon.png',
          width: 30,
          height: 30,
        ),
        MaterialButton(
          onPressed: () {},
          color: Colors.red,
          child: const Text(
            "Tools",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
