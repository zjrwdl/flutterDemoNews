import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
                width: 20,
              ),
              Text(
                "Sign in",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.white, width: 1),
                  shape:  BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);//临时用一下作为返回功能
                  },
                  child: const Text(
                    "Sign up",
                    style: TextStyle(color: Colors.white),
                  ),
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
    return Container(
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(color: Colors.white, width: 1),
                shape:  BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: MaterialButton(
                onPressed: () {},
                child: const Text(
                  "Sign up",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            left: 10,
          ),
          SizedBox(
            width: 10,
          ),
          Image.asset(
            'web/icons/github_icon.png',
            width: 50,
            height: 50,
          ),
          SizedBox(
            width: 10,
          ),
          Positioned(
            child: SvgPicture.asset(
              "web/svg/more_icon.svg",
              width: 30,
              height: 30,
            ),
            right: 10,
          ),
        ],
      ),
    );
  }
}
