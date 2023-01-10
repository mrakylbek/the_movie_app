import 'package:flutter/material.dart';
import 'package:themoviedb/resources/app_images.dart';

import '../../resources/widget.dart';

class MovieDetailsInfo extends StatelessWidget {
  const MovieDetailsInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _TopPosterWidget(),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(child: _MovieNameWidget()),
        ),
        _ScoreWidget(),
        _SummeryWidget(),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: _OverviewWidget(),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: _DescriptionWidget(),
        ),
        SizedBox(height: 30),
        _PeopleWidgets(),
      ],
    );
  }

  Text _DescriptionWidget() {
    return Text(
      "An Interpol-issued Red Notice is a global alert to hunt and capture the world's most wanted. But when a daring heist brings together the FBI's top profiler and two rival criminals, there's no telling what will happen.",
      // maxLines: 3,
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Text _OverviewWidget() {
    return Text(
      'Overview',
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class _TopPosterWidget extends StatelessWidget {
  const _TopPosterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(image: AssetImage(AppImages.topHeader)),
        Positioned(
          top: 20,
          left: 20,
          bottom: 20,
          child: Image(
            image: AssetImage(AppImages.topHeaderSub),
          ),
        )
      ],
    );
  }
}

class _MovieNameWidget extends StatelessWidget {
  const _MovieNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 3,
      textAlign: TextAlign.center,
      text: TextSpan(children: [
        TextSpan(
          text: 'Tom Clancy\'s without Remorce',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextSpan(
          text: ' (2021)',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        )
      ]),
    );
  }
}

class _ScoreWidget extends StatelessWidget {
  const _ScoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(onPressed: () {}, child: Row(
          children: [
            SizedBox(
              width: 45,
              height: 45,
              // decoration: BoxDecoration(border: Border.all(color: Colors.red)),
              child: RadialPersentWidget(
                percent: 0.68,
                fillColor: Color.fromARGB(255, 10, 23, 25),
                lineColor: Color.fromARGB(255, 37, 203, 103),
                freeColor: Color.fromARGB(255, 25, 54, 31),
                lineWidth: 3,
                childW: Text(
                  '68%',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
            SizedBox(width: 5),
            Text('User Score'),
            SizedBox(width: 10),
          ],
        )),
        Container(width: 1, height: 15, color: Colors.grey),
        TextButton(onPressed: () {}, child: Row(
          children: [
            Icon(Icons.play_arrow),
            SizedBox(width: 5),
            Text('Play Trailer'),
          ],
        )),
      ],
    );
  }
}

class _SummeryWidget extends StatelessWidget {
  const _SummeryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Color.fromRGBO(43, 40, 40, 1.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 65),
        child: Text(
          'PG-13, 11/05/2021 (US), Action, Comedy, Crime, Thriller, 1h 58m',
          textAlign: TextAlign.center,
          maxLines: 3,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

class _PeopleWidgets extends StatelessWidget {
  const _PeopleWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameStyle = TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    );
    final jobTitleStyle = TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    );

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rawson Marshall Thurber',
                  style: nameStyle,
                ),
                Text(
                  "Director, Screenplay",
                  style: jobTitleStyle,
                ),
              ],
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rawson Marshall Thurber',
                  style: nameStyle,
                ),
                Text(
                  "Director, Screenplay",
                  style: jobTitleStyle,
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rawson Marshall Thurber',
                  style: nameStyle,
                ),
                Text(
                  "Director, Screenplay",
                  style: jobTitleStyle,
                ),
              ],
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rawson Marshall Thurber',
                  style: nameStyle,
                ),
                Text(
                  "Director, Screenplay",
                  style: jobTitleStyle,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
