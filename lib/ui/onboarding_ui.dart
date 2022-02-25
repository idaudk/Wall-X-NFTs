import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nft_app/animations/animations.dart';
import 'package:nft_app/constants/app_themes.dart';

class OnBoardingUI extends StatelessWidget {
  const OnBoardingUI({Key? key}) : super(key: key);

  final double _padding = 40.0;
  final _headingStyle = const TextStyle(
    fontWeight: FontWeight.w200,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _padding),
              child: const AppBar(),
            ),
            SizedBox(height: 40.h),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: _padding),
                child: FadeAnimation(
                    child: Row(
                  children: [
                    SvgPicture.asset('assets/images/flash.svg'),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      'Started',
                      style: TextStyle(fontSize: 12.r),
                    )
                  ],
                ))),
            SizedBox(
              height: 16.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _padding),
              child: SlideAnimation(
                  intervalEnd: 0.6,
                  child: FadeAnimation(
                      intervalEnd: 0.6,
                      child: RichText(
                          text: TextSpan(
                              style: TextStyle(
                                  fontSize: 40.r,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Dsignes',
                                  color: Colors.black,
                                  height: 1.3),
                              children: [
                            TextSpan(
                              text: 'Discover ',
                              style: _headingStyle,
                            ),
                            const TextSpan(text: 'Rare \nCollections '),
                            TextSpan(
                              text: 'Of ',
                              style: _headingStyle,
                            )
                          ])))),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _padding),
              child: SlideAnimation(
                intervalEnd: 0.6,
                begin: const Offset(0, 30),
                child: FadeAnimation(
                  intervalEnd: 0.6,
                  child: Row(
                    children: [
                      Text(
                        'Art &',
                        style: TextStyle(
                            fontSize: 40.r,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Dsignes',
                            height: 1.3),
                      ),
                      ColoredText(text: 'NFTs')
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _padding),
              child: FadeAnimation(
                child: Text(
                  'Digital marketplace for crypto collectibles and non-fungible tokens',
                  style: bodyTextStyle,
                ),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Container(
              height: 200.h,
              padding: EdgeInsets.only(left: _padding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SlideAnimation(
                    intervalStart: 0.4,
                    begin: const Offset(0, 20),
                    child: FadeAnimation(
                      intervalStart: 0.4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          EventState(
                            title: '12.1K+',
                            subtitle: 'Art Work',
                          ),
                          EventState(
                            title: '1.7M+',
                            subtitle: 'Artist',
                          ),
                          EventState(
                            title: '54K+',
                            subtitle: 'Action',
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 60.w,
                  ),
                  Expanded(
                    child: SlideAnimation(
                      intervalEnd: 0.2,
                      child: FadeAnimation(
                        intervalEnd: 0.2,
                        child: Container(
                          padding: EdgeInsets.all(24.r),
                          decoration:
                              const BoxDecoration(color: Color(0xffe6d9fe)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed("/home");
                                },
                                child: Container(
                                  width: 40.r,
                                  height: 40.r,
                                  decoration: const BoxDecoration(
                                      //borderRadius: BorderRadius.circular(8),
                                      color: Color(0xffcab2ff)),
                                  child: const Icon(Iconsax.arrow_right_1),
                                ),
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              Text(
                                'Discover \nArtwork',
                                style: TextStyle(
                                  fontSize: 24.r,
                                  height: 1.3,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 9,
                                ),
                              ),
                              SizedBox(
                                height: 12.h,
                              ),
                              Divider(
                                thickness: 2,
                                endIndent: 120.w,
                                color: Colors.black,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: _padding),
                child: SlideAnimation(
                    intervalStart: 0.6,
                    begin: const Offset(0, 20),
                    child: FadeAnimation(
                        intervalStart: 0.6,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Supported By',
                              style: bodyTextStyle,
                            ),
                            SvgPicture.asset(
                              'assets/images/binance.svg',
                              width: 24.r,
                            ),
                            SvgPicture.asset(
                              'assets/images/huobi.svg',
                              width: 22.r,
                            ),
                            SvgPicture.asset(
                              'assets/images/xrp.svg',
                              width: 22.r,
                            ),
                          ],
                        ))))
          ],
        ),
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const _AppLogo(),
        Container(
          width: 40.r,
          height: 40.r,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.black),
          child: const Center(
            child: Icon(
              Icons.account_balance_wallet_outlined,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}

class _AppLogo extends StatelessWidget {
  const _AppLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Wall X.',
      style: TextStyle(
        fontSize: 26.r,
      ),
    );
  }
}

class ColoredText extends StatelessWidget {
  const ColoredText({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      child: Stack(
        fit: StackFit.loose,
        children: [
          Positioned(
            bottom: 0,
            left: 10.w,
            child: Container(
              width: 85.w,
              height: 30.r,
              color: const Color(0xffaafaff),
            ),
          ),
          Text(
            text,
            style: TextStyle(
                fontSize: 40.r,
                fontWeight: FontWeight.bold,
                fontFamily: 'Dsignes',
                //color: Colors.black,
                height: 1.3),
          )
        ],
      ),
    );
  }
}

class EventState extends StatelessWidget {
  const EventState({Key? key, required this.title, required this.subtitle})
      : super(key: key);

  final String title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(fontSize: 16.r, fontWeight: FontWeight.bold)),
        SizedBox(height: 8.h,),    
        Text(subtitle,
            style: TextStyle(
              fontSize: 14.r,
            )),
      ],
    );
  }
}
