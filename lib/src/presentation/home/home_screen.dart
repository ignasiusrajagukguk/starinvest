import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:starinvest/src/common/colors.dart';
import 'package:starinvest/src/common/fonts_family.dart';
import 'package:starinvest/src/common/icon_paths.dart';
import 'package:starinvest/src/common/image_paths.dart';
import 'package:starinvest/src/common/widgets/text_form_field.dart';
import 'package:starinvest/src/presentation/detail/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var trendingPlayerJson = [
    {
      'name': 'Antony Santos',
      'club': 'Real Betis',
      'price': '€75,000.00',
      'image': ImagePaths.home.image1,
      'clubImage': ImagePaths.home.realBetis,
    },
    {
      'name': 'Kylian Mbappe',
      'club': 'Real Madrid',
      'price': '€99,999.99',
      'image': ImagePaths.home.image2,
      'clubImage': ImagePaths.home.realMadrid,
    },
    {
      'name': 'Erling Haaland',
      'club': 'Man. City',
      'price': '€99,999.99',
      'image': ImagePaths.home.image3,
      'clubImage': ImagePaths.home.manCity,
    },
  ];

  var recentTransferJson = [
    {
      'name': 'Trent Alexander Arnold',
      'price': '€99,999.99',
      'club': 'Liverpool',
      'image': ImagePaths.home.image6,
    },
    {
      'name': 'Kylian Mbappe',
      'price': '€75,000.00',
      'club': 'Real Madrid',
      'image': ImagePaths.home.image2,
    },
    {
      'name': 'Viktor Gyökeres',
      'price': '€75,000.00',
      'club': 'Suporting CP',
      'image': ImagePaths.home.image5,
    },
    {
      'name': 'Julian Alvarez',
      'price': '€75,000.00',
      'club': 'Atletico Madrid',
      'image': ImagePaths.home.image7,
    },
  ];

  String choosenMenu = 'Very Rare';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: ConstColors.baseColorDark,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset(
          ImagePaths.general.logo,
          height: 30,
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
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            transform: GradientRotation(-0.6),
                            colors: [
                              ConstColors.baseColorDark2,
                              ConstColors.baseColorDark2,
                              ConstColors.baseColorDark2,
                              ConstColors.lightgreen
                            ]),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Portfolio Value',
                              style: TextStyle(
                                  color: ConstColors.white,
                                  fontFamily: poppinsRegular,
                                  fontSize: 12),
                            ),
                            const Gap(10),
                            const Text(
                              '€48.341,77',
                              style: TextStyle(
                                  color: ConstColors.white,
                                  fontFamily: poppinsSemiBold,
                                  fontSize: 24),
                            ),
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: ConstColors.orange.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.arrow_drop_up_sharp,
                                    color: ConstColors.lightgreen,
                                  ),
                                  Text(
                                    '0.73 (-0.73%) Today',
                                    style: TextStyle(
                                        color: ConstColors.lightgreen,
                                        fontFamily: poppinsSemiBold,
                                        fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Gap(10),
                        Expanded(
                            child: Image.asset(ImagePaths.home.chartOutlined))
                      ],
                    ),
                  ),
                  const Gap(15),
                  Row(
                    children: [
                      Expanded(
                          child: IconButton(
                              onPressed: () {},
                              icon: const Column(
                                children: [
                                  Icon(
                                    Icons.add_circle_outline_outlined,
                                    color: ConstColors.light,
                                  ),
                                  Text(
                                    'Explore',
                                    style: TextStyle(
                                        color: ConstColors.light,
                                        fontFamily: poppinsLight,
                                        fontSize: 12),
                                  ),
                                ],
                              ))),
                      const Gap(10),
                      Expanded(
                          child: IconButton(
                              onPressed: () {},
                              icon: Column(
                                children: [
                                  Transform.rotate(
                                    angle: -0.5,
                                    child: const Icon(
                                      Icons.arrow_circle_right_outlined,
                                      color: ConstColors.light,
                                    ),
                                  ),
                                  const Text(
                                    'Trade',
                                    style: TextStyle(
                                        color: ConstColors.light,
                                        fontFamily: poppinsLight,
                                        fontSize: 12),
                                  ),
                                ],
                              ))),
                      Expanded(
                          child: IconButton(
                              onPressed: () {},
                              icon: Column(
                                children: [
                                  Image.asset(
                                    IconPaths.home.explore,
                                    height: 24,
                                  ),
                                  const Text(
                                    'Trade',
                                    style: TextStyle(
                                        color: ConstColors.light,
                                        fontFamily: poppinsLight,
                                        fontSize: 12),
                                  ),
                                ],
                              ))),
                    ],
                  ),
                  const Gap(15),
                  const Text(
                    'Trending Players',
                    style: TextStyle(
                        color: ConstColors.white,
                        fontFamily: poppinsSemiBold,
                        fontSize: 12),
                  ),
                  const Gap(10),
                  SizedBox(
                    height: 220,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: trendingPlayerJson.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
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
                                    trendingPlayerJson[index]['clubImage'] ??
                                        '',
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
                                        trendingPlayerJson[index]['image'] ??
                                            '',
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
                                                      BorderRadius.circular(
                                                          100)),
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
                      ),
                    ),
                  ),
                  const Gap(15),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            choosenMenu = 'Very Rare';
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: choosenMenu == 'Very Rare'
                                      ? ConstColors.lightgreen
                                      : Colors.transparent),
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                            child: Text(
                              'Very Rare',
                              style: TextStyle(
                                  color: choosenMenu == 'Very Rare'
                                      ? ConstColors.lightgreen
                                      : ConstColors.gray,
                                  fontFamily: poppinsLight,
                                  fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            choosenMenu = 'Rare';
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: choosenMenu == 'Rare'
                                      ? ConstColors.lightgreen
                                      : Colors.transparent),
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                            child: Text(
                              'Rare',
                              style: TextStyle(
                                  color: choosenMenu == 'Rare'
                                      ? ConstColors.lightgreen
                                      : ConstColors.gray,
                                  fontFamily: poppinsLight,
                                  fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            choosenMenu = 'SS+ Class';
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: choosenMenu == 'SS+ Class'
                                      ? ConstColors.lightgreen
                                      : Colors.transparent),
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                            child: Text(
                              'SS+ Class',
                              style: TextStyle(
                                  color: choosenMenu == 'SS+ Class'
                                      ? ConstColors.lightgreen
                                      : ConstColors.gray,
                                  fontFamily: poppinsLight,
                                  fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            choosenMenu = 'S Class';
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: choosenMenu == 'S Class'
                                      ? ConstColors.lightgreen
                                      : Colors.transparent),
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                            child: Text(
                              'S Class',
                              style: TextStyle(
                                  color: choosenMenu == 'S Class'
                                      ? ConstColors.lightgreen
                                      : ConstColors.gray,
                                  fontFamily: poppinsLight,
                                  fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            choosenMenu = 'A Class';
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: choosenMenu == 'A Class'
                                      ? ConstColors.lightgreen
                                      : Colors.transparent),
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                            child: Text(
                              'A Class',
                              style: TextStyle(
                                  color: choosenMenu == 'A Class'
                                      ? ConstColors.lightgreen
                                      : ConstColors.gray,
                                  fontFamily: poppinsLight,
                                  fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(15),
                  MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: recentTransferJson.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: const BoxDecoration(
                              color: ConstColors.baseColorDark2),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Row(
                                children: [
                                  Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: ConstColors.white,
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: Image.asset(
                                            recentTransferJson[index]
                                                    ['image'] ??
                                                '',
                                            height: 50,
                                          ))),
                                  const Gap(10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        recentTransferJson[index]['name'] ?? '',
                                        style: const TextStyle(
                                            color: ConstColors.light,
                                            fontFamily: poppinsRegular,
                                            fontSize: 12),
                                      ),
                                      Text(
                                        recentTransferJson[index]['club'] ?? '',
                                        style: const TextStyle(
                                            color: ConstColors.gray10,
                                            fontFamily: poppinsLight,
                                            fontSize: 10),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                              const Gap(10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    recentTransferJson[index]['price'] ?? '',
                                    style: const TextStyle(
                                        color: ConstColors.light,
                                        fontFamily: poppinsRegular,
                                        fontSize: 12),
                                  ),
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.arrow_drop_up_sharp,
                                        color: ConstColors.lightgreen,
                                      ),
                                      Text(
                                        '35.61%',
                                        style: TextStyle(
                                            color: ConstColors.lightgreen,
                                            fontFamily: poppinsSemiBold,
                                            fontSize: 10),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
