import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class customScrollView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new customScrollViewState();
  }
}

class customScrollViewState extends State {
  @override
  Widget build(BuildContext context) {
    return new CustomScrollView(
      shrinkWrap: true,
      slivers: <Widget>[
        SliverPadding(
            padding: const EdgeInsets.all(15.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  Image.asset("assets/images/icon.png",width: 50,height: 50,color: Colors.deepOrange),
                  Text(
                    'One I\'m dedicating every day to you',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange),
                  ),
                  Text(
                    'Two Domestic life was never quite my style',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.cyanAccent,
                        fontWeight: FontWeight.normal),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Text(
                    'Three When you smile, you knock me out, I fall apart.I fall apart.I fall apart.I fall apart',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        wordSpacing: 3,
                        color: Colors.red),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Text('Fore And I thought I was so smart'),
//                  new AssetImage("images/icon.png")

                ],
              ),
            ))
      ],
    );
  }
}
