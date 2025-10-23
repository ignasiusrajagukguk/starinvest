import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:starinvest/src/common/colors.dart';
import 'package:starinvest/src/common/fonts_family.dart';
import 'package:starinvest/src/common/icon_paths.dart';
import 'package:starinvest/src/common/image_paths.dart';
import 'package:starinvest/src/presentation/detail/detail_screen.dart';

class MarketScreen extends StatefulWidget {
  final int initialTab;
  const MarketScreen({
    super.key,
    this.initialTab = 0,
  });

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List trendingPlayerJson = [
    {
      'name': 'Antony Santos',
      'club': 'Real Betis',
      'image': ImagePaths.home.image1,
      'clubImage': ImagePaths.home.realBetis,
      'isHot': true,
      'price': '€99.000',
      'increasement': '+09.9%'
    },
    {
      'name': 'Kylian Mbappe',
      'club': 'Real Madrid',
      'image': ImagePaths.home.image2,
      'clubImage': ImagePaths.home.realMadrid,
      'isHot': true,
      'price': '€99.000',
      'increasement': '+09.9%'
    },
    {
      'name': 'Erling Haaland',
      'club': 'Man. City',
      'image': ImagePaths.home.image3,
      'clubImage': ImagePaths.home.manCity,
      'isHot': false,
      'price': '€99.000',
      'increasement': '+09.9%'
    },
    {
      'name': 'Mohamed Salah',
      'club': 'Liverpool F.C',
      'image': ImagePaths.home.image4,
      'clubImage': ImagePaths.home.manCity,
      'isHot': false,
      'price': '€74.000',
      'increasement': '+09.9%'
    },
    {
      'name': 'Viktor Gyökeres',
      'club': 'Sporting CP',
      'image': ImagePaths.home.image5,
      'clubImage': ImagePaths.home.scp,
      'isHot': false,
      'price': '€62.000',
      'increasement': '+09.9%'
    },
    {
      'name': 'Trent Alexander Arnold',
      'club': 'Liverpool F.C',
      'image': ImagePaths.home.image6,
      'clubImage': ImagePaths.home.liverpool,
      'isHot': false,
      'price': '€55.000',
      'increasement': '+09.9%'
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 4,
      vsync: this,
      initialIndex: widget.initialTab,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TabBar(
                  controller: _tabController,
                  dividerColor: Colors.transparent,
                  isScrollable: true,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: ConstColors.lightgreen),
                  ),
                  indicatorPadding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 2,
                  ),
                  indicatorColor: Colors.transparent,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorAnimation: TabIndicatorAnimation.linear,
                  indicatorWeight: 1,
                  tabAlignment: TabAlignment.start,
                  padding: EdgeInsets.zero,
                  labelStyle: const TextStyle(
                    fontFamily: poppinsRegular,
                    color: ConstColors.lightgreen,
                    fontSize: 12,
                  ),
                  unselectedLabelStyle: const TextStyle(
                    fontFamily: poppinsRegular,
                    color: ConstColors.gray10,
                    fontSize: 12,
                  ),
                  tabs: const [
                    Tab(text: "All"),
                    Tab(text: "Trending"),
                    Tab(text: "Popular"),
                    Tab(text: "Initial Offering"),
                  ]),
            ),
            const Gap(15),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListPlayers(trendingPlayerJson: trendingPlayerJson),
                  ListPlayers(trendingPlayerJson: trendingPlayerJson),
                  ListPlayers(trendingPlayerJson: trendingPlayerJson),
                  ListPlayers(trendingPlayerJson: trendingPlayerJson),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

class ListPlayers extends StatelessWidget {
  const ListPlayers({
    super.key,
    required this.trendingPlayerJson,
  });

  final List trendingPlayerJson;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: trendingPlayerJson.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.85, mainAxisSpacing: 10, crossAxisCount: 2),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const DetailScreen())),
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                  color: const Color(0xFF0C0C0C),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    trendingPlayerJson[index]['name'] ?? '',
                    style: const TextStyle(
                        color: ConstColors.light,
                        fontFamily: poppinsRegular,
                        fontSize: 12),
                  ),
                  Row(
                    children: [
                      Image.asset(
                        trendingPlayerJson[index]['clubImage'] ?? '',
                        height: 16,
                      ),
                      const Gap(5),
                      Text(
                        trendingPlayerJson[index]['club'] ?? '',
                        style: const TextStyle(
                            color: ConstColors.light,
                            fontFamily: poppinsLight,
                            fontSize: 10),
                      )
                    ],
                  ),
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Image.asset(
                            index % 2 == 1
                                ? ImagePaths.home.chartUp
                                : ImagePaths.home.chartDown,
                            width: 180,
                            height: 170,
                            fit: BoxFit.fitWidth,
                          ),
                          Image.asset(
                            trendingPlayerJson[index]['image'] ?? '',
                            height: 170,
                          ),
                        ],
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.transparent,
                                ConstColors.baseColorDark
                              ]),
                        ),
                        height: 70,
                        width: 180,
                      ),
                      SizedBox(
                        width: 180,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                        color: const Color(0xFFF7EF8A)
                                            .withValues(alpha: 1),
                                        offset: const Offset(-1, 0),
                                        blurRadius: 10,
                                        spreadRadius: 2),
                                  ], borderRadius: BorderRadius.circular(100)),
                                  child: Image.asset(
                                    IconPaths.home.ss,
                                    height: 40,
                                  )),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Text(
                                    'Value',
                                    style: TextStyle(
                                        color: ConstColors.light,
                                        fontFamily: poppinsRegular,
                                        fontSize: 10),
                                  ),
                                  Text(
                                    trendingPlayerJson[index]['price'] ?? '',
                                    style: const TextStyle(
                                        color: ConstColors.light,
                                        fontFamily: poppinsMedium,
                                        fontSize: 16),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
