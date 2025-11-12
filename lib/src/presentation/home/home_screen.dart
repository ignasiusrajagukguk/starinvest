import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:starinvest/src/common/colors.dart';
import 'package:starinvest/src/common/fonts_family.dart';
import 'package:starinvest/src/common/icon_paths.dart';
import 'package:starinvest/src/common/image_paths.dart';
import 'package:starinvest/src/data/models/player_model.dart';
import 'package:starinvest/src/presentation/detail/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback? onTapTrending;
  const HomeScreen({
    super.key,
    this.onTapTrending,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String choosenMenu = 'Very Rare';

  late List<PlayerModel> players;
  Timer? _timer;
  final _rnd = Random();

  @override
  void initState() {
    super.initState();
    players = generateDummyPlayers();
    // update pertama kali agar tidak kosong (opsional)
    updatePlayerTrends(players, random: _rnd, maxChangePercent: 3);

    _timer = Timer.periodic(const Duration(seconds: 5), (_) {
      setState(() {
        // setiap tick, random change kecil
        updatePlayerTrends(players, random: _rnd, maxChangePercent: 3);
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Porfolio Value Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    color: ConstColors.baseColorDark2,
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        transform: const GradientRotation(-0.5),
                        colors: [
                          ConstColors.lightgreen.withValues(alpha: 0.1),
                          ConstColors.baseColorDark2,
                          ConstColors.baseColorDark2,
                          ConstColors.baseColorDark2,
                        ]),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Portfolio Value',
                              style: TextStyle(
                                  color: ConstColors.gray10,
                                  fontFamily: poppinsRegular,
                                  fontSize: 12),
                            ),
                            Gap(10),
                            Text(
                              '€48.341,77',
                              style: TextStyle(
                                  color: ConstColors.white,
                                  fontFamily: poppinsSemiBold,
                                  fontSize: 24),
                            ),
                            Row(
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
                          ],
                        ),
                        const Gap(40),
                        Expanded(
                            child: Image.asset(ImagePaths.home.chartOutlined))
                      ],
                    ),
                    const Gap(24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                            onTap: () {},
                            child: const Column(
                              children: [
                                Icon(
                                  Icons.add_circle_outline_outlined,
                                  color: ConstColors.light,
                                ),
                                Text(
                                  'Deposit',
                                  style: TextStyle(
                                      color: ConstColors.light,
                                      fontFamily: poppinsLight,
                                      fontSize: 12),
                                ),
                              ],
                            )),
                        Container(
                          height: 40,
                          width: 1,
                          color: const Color(0xff333333),
                        ),
                        GestureDetector(
                            onTap: () {},
                            child: Column(
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
                            )),
                        Container(
                          height: 40,
                          width: 1,
                          color: const Color(0xff333333),
                        ),
                        GestureDetector(
                            onTap: () {},
                            child: Column(
                              children: [
                                Image.asset(
                                  IconPaths.home.explore,
                                  height: 24,
                                ),
                                const Text(
                                  'Explore',
                                  style: TextStyle(
                                      color: ConstColors.light,
                                      fontFamily: poppinsLight,
                                      fontSize: 12),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              const Gap(24),

              // Trending Players
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Trending Players',
                      style: TextStyle(
                          color: ConstColors.white,
                          fontFamily: poppinsSemiBold,
                          fontSize: 12),
                    ),
                    InkWell(
                      onTap: widget.onTapTrending,
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ConstColors.lightgreen.withValues(alpha: 0.1),
                        ),
                        child: Center(
                          child: Image.asset(
                            IconPaths.home.arrowRight2,
                            width: 14,
                            height: 14,
                            color: ConstColors.lightgreen,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(12),
              SizedBox(
                height: 230,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  padding: const EdgeInsets.only(left: 16),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const DetailScreen())),
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: const Color(0xFF0C0C0C),
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            players[index].name,
                            style: const TextStyle(
                                color: ConstColors.light,
                                fontFamily: poppinsRegular,
                                fontSize: 12),
                          ),
                          Row(
                            children: [
                              Image.asset(
                                players[index].clubImage,
                                height: 16,
                              ),
                              const Gap(5),
                              Text(
                                players[index].club,
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
                                    players[index].image,
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
                                                    color:
                                                        const Color(0xFFF7EF8A)
                                                            .withValues(
                                                                alpha: 1),
                                                    offset: const Offset(-1, 0),
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
                                          TweenAnimationBuilder<double>(
                                            tween: Tween<double>(
                                              begin: players[index].price,
                                              end: players[index].price,
                                            ),
                                            duration: const Duration(
                                                milliseconds: 800),
                                            builder: (context, value, child) {
                                              return Text(
                                                "€${value.toStringAsFixed(2)}",
                                                style: const TextStyle(
                                                  color: ConstColors.light,
                                                  fontFamily: poppinsMedium,
                                                  fontSize: 16,
                                                ),
                                              );
                                            },
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

              // Hot Players
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
                      Tab(text: "Very Rare"),
                      Tab(text: "Rare"),
                      Tab(text: "SS+ Class"),
                      Tab(text: "S Class"),
                      Tab(text: "A Class"),
                    ]),
              ),
              const Gap(12),
              SizedBox(
                height: 400,
                child: TabBarView(
                  children: [
                    ListPlayers(players: players.sublist(0, 4)),
                    ListPlayers(players: players.sublist(5, 9)),
                    ListPlayers(players: players.sublist(10, 14)),
                    ListPlayers(players: players.sublist(15, 19)),
                    ListPlayers(players: players.sublist(20, 24)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ListPlayers extends StatelessWidget {
  const ListPlayers({
    super.key,
    required this.players,
  });

  final List<PlayerModel> players;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: players.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: ConstColors.baseColorDark2,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(10),
            leading: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: ConstColors.white,
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(players[index].image),
                ),
              ),
            ),
            title: Text(
              players[index].name,
              style: const TextStyle(
                  color: ConstColors.light,
                  fontFamily: poppinsRegular,
                  fontSize: 12),
            ),
            subtitle: Text(
              players[index].club,
              style: const TextStyle(
                  color: ConstColors.gray10,
                  fontFamily: poppinsLight,
                  fontSize: 10),
            ),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // 🎯 Animasi nilai harga
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  decoration: BoxDecoration(
                    color: players[index].isUp
                        ? ConstColors.lightgreen.withValues(alpha: .1)
                        : ConstColors.orange.withValues(alpha: .1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  child: Text(
                    "€${players[index].price.toStringAsFixed(2)}",
                    style: const TextStyle(
                      color: ConstColors.light,
                      fontFamily: poppinsMedium,
                      fontSize: 12,
                    ),
                  ),
                ),

                const SizedBox(height: 2),

                // 🎯 Animasi tren naik/turun
                TweenAnimationBuilder<double>(
                  tween: Tween<double>(
                    begin: players[index].trend,
                    end: players[index].trend,
                  ),
                  duration: const Duration(milliseconds: 800),
                  builder: (context, value, child) {
                    final isUp = players[index].isUp;
                    final color =
                        isUp ? ConstColors.lightgreen : ConstColors.orange;
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          transitionBuilder: (child, animation) =>
                              ScaleTransition(
                            scale: animation,
                            child: child,
                          ),
                          child: Icon(
                            isUp
                                ? Icons.arrow_drop_up_sharp
                                : Icons.arrow_drop_down_sharp,
                            key: ValueKey(isUp),
                            color: color,
                          ),
                        ),
                        Text(
                          value.toStringAsFixed(2),
                          style: TextStyle(
                            color: color,
                            fontFamily: poppinsSemiBold,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
