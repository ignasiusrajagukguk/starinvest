import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:starinvest/src/common/colors.dart';
import 'package:starinvest/src/common/fonts_family.dart';
import 'package:starinvest/src/common/image_paths.dart';
import 'package:starinvest/src/presentation/portfolio_detail/portfolio_detail_screen.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<PortfolioScreen> {
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
  String choosenMenu = 'Last 7 Days';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TabBar(
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
                      Tab(text: "Last 7 Days"),
                      Tab(text: "Weekly"),
                      Tab(text: "Monthly"),
                      Tab(text: "Yearly"),
                    ]),
              ),
              SizedBox(
                height: 320,
                child: TabBarView(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: ConstColors.baseColorDark2,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Total Portfolio",
                                    style: TextStyle(
                                      fontFamily: poppinsRegular,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    "12 May - 17 May 2025",
                                    style: TextStyle(
                                      fontFamily: poppinsLight,
                                      fontSize: 10,
                                      color: ConstColors.lightGray,
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.more_horiz,
                                color: ConstColors.lightgreen,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const Center(
                      child: Text(
                        "Weekly",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const Center(
                      child: Text(
                        "Monthly",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const Center(
                      child: Text(
                        "Yearly",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(16),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total Balance',
                          style: TextStyle(
                              color: ConstColors.white,
                              fontFamily: poppinsRegular,
                              fontSize: 12),
                        ),
                        InkWell(
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const PortfolioDetailsScreen())),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'View Details',
                                style: TextStyle(
                                    color: ConstColors.white,
                                    fontFamily: poppinsRegular,
                                    fontSize: 12),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: ConstColors.white,
                                size: 14,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const Gap(16),
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
                          color: ConstColors.orange.withValues(alpha: 0.1),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 9),
                      child: Image.asset(
                        ImagePaths.portfolio.chart,
                      ),
                    )
                  ],
                ),
              ),
              const Gap(10),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: ConstColors.baseColorDark2,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'My Player Cards',
                          style: TextStyle(
                              color: ConstColors.light,
                              fontFamily: poppinsRegular,
                              fontSize: 12),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: ConstColors.darkblue,
                              borderRadius: BorderRadius.circular(4)),
                          child: const Text(
                            'Show Cards',
                            style: TextStyle(
                                color: ConstColors.white,
                                fontFamily: poppinsRegular,
                                fontSize: 12),
                          ),
                        )
                      ],
                    ),
                    const Gap(10),
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
                                          recentTransferJson[index]['name'] ??
                                              '',
                                          style: const TextStyle(
                                              color: ConstColors.light,
                                              fontFamily: poppinsRegular,
                                              fontSize: 12),
                                        ),
                                        Text(
                                          recentTransferJson[index]['club'] ??
                                              '',
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
              const Gap(10),
            ],
          ),
        ),
      ),
    );
  }
}
