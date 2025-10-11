import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:starinvest/src/common/colors.dart';
import 'package:starinvest/src/common/fonts_family.dart';
import 'package:starinvest/src/common/icon_paths.dart';
import 'package:starinvest/src/common/image_paths.dart';
class PortfolioDetailsScreen extends StatefulWidget {
  const PortfolioDetailsScreen({super.key});

  @override
  State<PortfolioDetailsScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<PortfolioDetailsScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: ConstColors.baseColorDark,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Player Portfolio',
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
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
                gradient: RadialGradient(radius: 1.4, colors: [
              ConstColors.lightgreen.withOpacity(.8),
              ConstColors.baseColorDark,
            ])),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
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
                              onTap: () {
                                
                              },
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text('View Details',
                                    style: TextStyle(
                                        color: ConstColors.white,
                                        fontFamily: poppinsRegular,
                                        fontSize: 12),),Icon(Icons.arrow_forward_ios_rounded, color: ConstColors.white, size: 14,)
                                ],
                              ),
                            )
                          ],
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
                        Image.asset(ImagePaths.portfolio.chart, )
                        
                      ],
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
