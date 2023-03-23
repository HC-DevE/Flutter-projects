import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/icon_text_widget.dart';

import '../widgets/big_text.dart';
import '../widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  final PageController _controller = PageController(
    viewportFraction: 0.8, // show 80% of each page
    initialPage: 0,
  );
  var _currentPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = 220;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentPageValue = _controller.page!;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var pageLength = 5;
    return Column(
      children: [
        Container(
          height: 320,
          child: PageView.builder(
              controller: _controller,
              itemCount: 5,
              itemBuilder: (context, position) {
                Matrix4 matrix = Matrix4.identity();
                if (position == _currentPageValue.floor()) {
                  var currScale =
                      1 - (_currentPageValue - position) * (1 - _scaleFactor);
                  var currTrans = _height * (1 - currScale) / 2;
                  matrix = Matrix4.diagonal3Values(1, currScale, 1)
                    ..setTranslationRaw(0, currTrans, 0);
                } else if (position == _currentPageValue.floor() - 1) {
                  var currScale =
                      1 - (_currentPageValue - position) * (1 - _scaleFactor);
                  var currTrans = _height * (1 - currScale) / 2;
                  matrix = Matrix4.diagonal3Values(1, currScale, 1);
                  matrix = Matrix4.diagonal3Values(1, currScale, 1)
                    ..setTranslationRaw(1, currTrans, 0);
                } else {
                  matrix = Matrix4.diagonal3Values(1, _scaleFactor, 1)
                    ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
                }

                return Transform(
                  transform: matrix,
                  child: _buildPageItem(position),
                );
              }),
        ),
        DotsIndicator(
          dotsCount: pageLength,
          position: _currentPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        )
      ],
    );
  }
}

Widget _buildPageItem(int index) {
  return Stack(
    children: [
      Container(
        height: 220,
        margin: const EdgeInsets.symmetric(horizontal: 10,vertical:10),
        decoration: BoxDecoration(
          color: index.isEven ? Colors.black12 : AppColors.mainColor,
          borderRadius: BorderRadius.circular(30),
          image: const DecorationImage(
            image: AssetImage('lib/assets/images/pancakes.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 130,
          margin: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                offset: Offset(0, 5),
              ),
              BoxShadow(
                color: Colors.white,
                offset: Offset(-5, 0),
              ),
              BoxShadow(
                color: Colors.white,
                offset: Offset(5, 0),
              ),
            ],
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(
                    text: 'Pancake With Honey',
                    size: 20,
                    color: AppColors.mainBlackColor,
                    fontWeight: FontWeight.w500),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Wrap(
                        children: List.generate(
                            5,
                            (index) => const Icon(Icons.star,
                                color: AppColors.mainColor, size: 15))),
                    const SizedBox(width: 10),
                    SmallText(
                      text: '4.5',
                      color: AppColors.mainBlackColor,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(width: 10),
                    SmallText(
                      text: '1257',
                      color: Colors.black54,
                    ),
                    const SizedBox(width: 10),
                    SmallText(
                      text: 'comments',
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    IconAndTextWidget(
                        text: 'Normal',
                        icon: Icons.circle_sharp,
                        iconColor: AppColors.iconColor1),
                    IconAndTextWidget(
                        text: '1.7km',
                        icon: Icons.location_pin,
                        iconColor: AppColors.mainColor),
                    IconAndTextWidget(
                        text: '32min',
                        icon: Icons.watch_later_outlined,
                        iconColor: AppColors.iconcolor2),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
