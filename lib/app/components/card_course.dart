import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_course/app/utils/style.dart';

class CardCourse extends StatelessWidget {
  final String cover;
  final double? coverHeight;
  final double? coverWidth;
  final String title;
  final String author;
  final int fileCount;
  final int timeCount;
  final double? sizeTitle;
  final double? sizeDescription;
  final double? sizeAuthor;
  final double? aspectRatio;
  final double? widthHeightIcon;
  final double? sizeTextIcon;
  final double? radius;
  final Function? onTap;
  const CardCourse({
    super.key,
    required this.cover,
    required this.title,
    required this.author,
    required this.fileCount,
    required this.timeCount,
    this.coverHeight,
    this.coverWidth,
    this.sizeTitle,
    this.sizeDescription,
    this.sizeAuthor,
    this.aspectRatio,
    this.widthHeightIcon,
    this.sizeTextIcon,
    this.radius,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio ?? .78,
      child: GestureDetector(
        onTap: () {
          if (onTap != null) onTap!();
        },
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius ?? 30),
            color: Theme.of(context).primaryColor,
          ),
          height: coverHeight ?? 100,
          width: coverWidth ?? 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                cover,
              ),
              SizedBox(height: 20),
              Text(
                title,
                style: textTitle(color: Colors.white, size: sizeTitle ?? 18),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 10),
              Text(
                'Created by $author',
                style: textSubtitle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    size: sizeAuthor ?? 14),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        width: widthHeightIcon ?? 30,
                        height: widthHeightIcon ?? 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: SvgPicture.asset(
                          'assets/images/svg/google-docs.svg',
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        '$fileCount Files',
                        style: textSubtitle(
                            color: Colors.white, size: sizeTextIcon ?? 14),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        width: widthHeightIcon ?? 30,
                        height: widthHeightIcon ?? 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: SvgPicture.asset(
                          'assets/images/svg/clock.svg',
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        '$timeCount min',
                        style: textSubtitle(
                            color: Colors.white, size: sizeTextIcon ?? 14),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
