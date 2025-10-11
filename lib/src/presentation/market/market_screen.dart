import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:starinvest/src/common/colors.dart';
import 'package:starinvest/src/common/fonts_family.dart';
import 'package:starinvest/src/common/icon_paths.dart';
import 'package:starinvest/src/common/image_paths.dart';
import 'package:starinvest/src/common/widgets/text_form_field.dart';
import 'package:starinvest/src/presentation/detail/detail_screen.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key});

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
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
  String choosenMenu = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.baseColorDark,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Market',
          style: TextStyle(
              color: ConstColors.light,
              fontFamily: poppinsSemiBold,
              fontSize: 15),
        ),
        actions: [
          Image.asset(
            IconPaths.home.message,
            height: 30,
          ),
          const Gap(10),
          Image.asset(
            IconPaths.home.notifications,
            height: 30,
          ),
          const Gap(15),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: RadialGradient(radius: 1.4, colors: [
              ConstColors.lightgreen.withOpacity(.8),
              ConstColors.baseColorDark,
            ])),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 100, 15, 10),
              child: TextFormFieldWidget.height50('Search',
                  textAlign: TextAlign.start,
                  prefixIcon: const Icon(
                    Icons.search,
                    color: ConstColors.white,
                  ),
                  fillColor: ConstColors.white.withOpacity(0.2),
                  textColor: ConstColors.gray20,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.transparent)),
                  suffixIcon: SizedBox(
                    width: 50,
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          width: 1,
                          height: 20,
                          color: ConstColors.white.withOpacity(0.2),
                        ),
                        const Icon(
                          Icons.tune,
                          color: ConstColors.white,
                        ),
                      ],
                    ),
                  )),
            ),
          ),
          const Gap(15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      choosenMenu = 'All';
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: choosenMenu == 'All'
                                ? ConstColors.lightgreen
                                : const Color.fromRGBO(0, 0, 0, 0)),
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Text(
                        'All',
                        style: TextStyle(
                            color: choosenMenu == 'All'
                                ? ConstColors.lightgreen
                                : ConstColors.gray,
                            fontFamily: poppinsSemiBold,
                            fontSize: 12),
                      ),
                    ),
                  ),
                ),
                const Gap(5),
                InkWell(
                  onTap: () {
                    setState(() {
                      choosenMenu = 'Trending';
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: choosenMenu == 'Trending'
                                ? ConstColors.lightgreen
                                : Colors.transparent),
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Text(
                        'Trending',
                        style: TextStyle(
                            color: choosenMenu == 'Trending'
                                ? ConstColors.lightgreen
                                : ConstColors.gray,
                            fontFamily: poppinsSemiBold,
                            fontSize: 12),
                      ),
                    ),
                  ),
                ),
                const Gap(5),
                InkWell(
                  onTap: () {
                    setState(() {
                      choosenMenu = 'Popular';
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: choosenMenu == 'Popular'
                                ? ConstColors.lightgreen
                                : Colors.transparent),
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Text(
                        'Popular',
                        style: TextStyle(
                            color: choosenMenu == 'Popular'
                                ? ConstColors.lightgreen
                                : ConstColors.gray,
                            fontFamily: poppinsSemiBold,
                            fontSize: 12),
                      ),
                    ),
                  ),
                ),
                const Gap(5),
                InkWell(
                  onTap: () {
                    setState(() {
                      choosenMenu = 'Initial Offering';
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: choosenMenu == 'Initial Offering'
                                ? ConstColors.lightgreen
                                : Colors.transparent),
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Text(
                        'Initial Offering',
                        style: TextStyle(
                            color: choosenMenu == 'Initial Offering'
                                ? ConstColors.lightgreen
                                : ConstColors.gray,
                            fontFamily: poppinsSemiBold,
                            fontSize: 12),
                      ),
                    ),
                  ),
                ),
                const Gap(5),
              ],
            ),
          ),
          const Gap(15),
          Expanded(
              child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  itemCount: trendingPlayerJson.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.85,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const DetailScreen())),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: const Color(
                                                              0xFFF7EF8A)
                                                          .withOpacity(1),
                                                      offset:
                                                          const Offset(-1, 0),
                                                      blurRadius: 10,
                                                      spreadRadius: 2),
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(100)),
                                            child: Image.asset(
                                              IconPaths.home.ss,
                                              height: 40,
                                            )),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            const Text(
                                              'Value',
                                              style: TextStyle(
                                                  color: ConstColors.light,
                                                  fontFamily: poppinsRegular,
                                                  fontSize: 10),
                                            ),
                                            Text(
                                              trendingPlayerJson[index]
                                                      ['price'] ??
                                                  '',
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
                  }))
        ],
      ),
    );
  }
}
