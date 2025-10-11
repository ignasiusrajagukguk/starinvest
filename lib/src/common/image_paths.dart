const String _basePath = 'assets/images';

class ImagePaths {
  static General general = const General();
  static Home home = const Home();
  static Portfolio portfolio = const Portfolio();
}


class General {
  const General();

  String get splash => '$_basePath/starinvest_splash.png';
  String get logo => '$_basePath/starinvest_logo.png';

}

class Home {
  const Home();

  String get image1 => '$_basePath/image1.png';
  String get image2 => '$_basePath/image2.png';
  String get image3 => '$_basePath/image3.png';
  String get image4 => '$_basePath/image4.png';
  String get image5 => '$_basePath/image5.png';
  String get image6 => '$_basePath/image6.png';
  String get image7 => '$_basePath/image7.png';
  String get image8 => '$_basePath/image8.png';

  String get realMadrid => '$_basePath/real_madrid.png';
  String get realBetis => '$_basePath/real_betis.png';
  String get manCity => '$_basePath/man_city.png';
  String get liverpool => '$_basePath/liverpool.png';
  String get scp => '$_basePath/scp.png';
  String get manunited => '$_basePath/manunited.png';
  String get fcb => '$_basePath/fcb.png';
  String get club1 => '$_basePath/club1.png';
  String get rbl => '$_basePath/rbl.png';

  String get chart => '$_basePath/chart.png';
  String get detailDummy => '$_basePath/detailDummy.png';
  String get chartDummy => '$_basePath/chartDummy.png';
  String get listDummy => '$_basePath/listDummy.png';
  String get chartUp => '$_basePath/chart_up.png';
  String get chartDown => '$_basePath/chart_down.png';
  String get chartOutlined => '$_basePath/chart_outlined.png';
  String get mbapeStatistic => '$_basePath/mbape_statistic.png';
  String get mbapeOverview => '$_basePath/mbape_overview.png';
  String get mbapeHistory => '$_basePath/mbape_history.png';
  String get mbapeDetailImg => '$_basePath/mbape_detail_img.png';
}


class Portfolio {
  const Portfolio();

  String get chart => '$_basePath/portfolio_chart.png';

}