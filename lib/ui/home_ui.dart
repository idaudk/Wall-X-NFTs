import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nft_app/animations/animations.dart';
import 'package:nft_app/constants/constants.dart';
import 'package:nft_app/controllers/controllers.dart';
import 'package:nft_app/ui/ui.dart';

class HomeUI extends StatelessWidget {
  const HomeUI({Key? key}) : super(key: key);

  final double _padding = 24;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 35.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: _padding),
                    child: const _AppBar(),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: _padding),
                    child: const _Header(),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: _padding),
                    child: const SlideAnimation(child: _CategoryList()),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  SlideAnimation(
                    begin: Offset(500.w, 0),
                    child: SizedBox(
                        height: 500,
                        child: PageView.builder(
                            physics: const BouncingScrollPhysics(),
                            controller: controller.pageController,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: (){
                                  Get.toNamed("/nft");
                                },
                                child: 
                                  Container(
                                    margin: EdgeInsets.only(right: 20.w),
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: Colors.black26)),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 12.h),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'X .',
                                                  style: TextStyle(
                                                      fontSize: 20.r,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  width: 12.w,
                                                ),
                                                Text(
                                                  'DAY 74',
                                                  style: TextStyle(
                                                    fontSize: 14.r,
                                                  ),
                                                ),
                                                const Spacer(),
                                                Text(
                                                  '@Daud K',
                                                  style: TextStyle(
                                                      fontSize: 14.r,
                                                      color: Colors.black54),
                                                )
                                              ]),
                                        ),
                                        Expanded(
                                            child: Hero(
                                          tag: '$index',
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color:
                                                    Theme.of(context).primaryColor,
                                                image: DecorationImage(
                                                    image: AssetImage(index % 2 == 0
                                                        ? 'assets/images/image-0.jpg'
                                                        : 'assets/images/image-1.jpeg'),
                                                    fit: BoxFit.cover)),
                                          ),
                                        )),
                                        SizedBox(
                                          height: 12.h,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 12.h),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: const [
                                              EventState(
                                                  title: '20h; 25m: 08s',
                                                  subtitle: 'Remaining Time'),
                                              EventState(
                                                  title: '15.19 ETH',
                                                  subtitle: 'Highest Bid'),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                
                              );
                            })),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
                iconSize: 22.r,
                showUnselectedLabels: false,
                showSelectedLabels: false,
                selectedItemColor: Colors.black,
                unselectedItemColor: Colors.black,
                type: BottomNavigationBarType.fixed,
                elevation: 0,
                items: const [
                  BottomNavigationBarItem(
                    icon: BottomIcon(
                      icon: Iconsax.home_15,
                      isActive: true,
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: BottomIcon(
                      icon: Iconsax.discover_1,
                      isActive: false,
                    ),
                    label: 'Discover',
                  ),
                  BottomNavigationBarItem(
                    icon: BottomIcon(
                      icon: Iconsax.add_square,
                      isActive: false,
                    ),
                    label: 'Add',
                  ),
                  BottomNavigationBarItem(
                    icon: BottomIcon(
                      icon: Iconsax.shop,
                      isActive: false,
                    ),
                    label: 'Shop',
                  ),
                  BottomNavigationBarItem(
                    icon: BottomIcon(
                      icon: Iconsax.wallet_3,
                      isActive: false,
                    ),
                    label: 'Wallet',
                  )
                ]),
          );
        });
  }
}

class BottomIcon extends StatelessWidget {
  const BottomIcon({Key? key, required this.icon, this.isActive = false})
      : super(key: key);
  final IconData icon;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon),
        Divider(
          thickness: 2,
          indent: 25.w,
          endIndent: 25.w,
          color: isActive ? Colors.black : Colors.transparent,
        )
      ],
    );
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList({Key? key}) : super(key: key);

  final List<String> _options = const [
    'Treading',
    'Digital Arts',
    '3D Videos',
    'Games',
    'Collections',
    'Real Estate',
    'lands',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 28.h,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: _options.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: index == 0 ? Colors.black : null,
                ),
                padding:
                    EdgeInsets.only(left: 22.w, right: index == 0 ? 22.w : 0),
                child: Center(
                    child: Text(
                  _options[index],
                  style: TextStyle(
                      fontSize: 14.r,
                      color: index == 0 ? Colors.white : Colors.black54,
                      fontWeight:
                          index == 0 ? FontWeight.bold : FontWeight.normal),
                )),
              );
            }));
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Live',
              style: bodyTextStyle,
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              'Auctions',
              style: TextStyle(fontSize: 26.r, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              'Enjoy! The latest hot auctions',
              style: bodyTextStyle,
            )
          ],
        ),
        const Icon(Iconsax.setting_4)
      ],
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const AppLogo(),
        Container(
          width: 40.r,
          height: 40.r,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/profile.jpg')),
              shape: BoxShape.circle,
              color: Colors.black),
        )
      ],
    );
  }
}

class AppLogo extends StatelessWidget {
  const AppLogo({Key? key}) : super(key: key);

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
