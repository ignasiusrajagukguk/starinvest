const String _basePath = 'assets/icons';

class IconPaths {
  static General general = const General();
  static Home home = const Home();
}


class General {
  const General();

  String get home => '$_basePath/home_active.png';
  String get market => '$_basePath/market_active.png';
  String get news => '$_basePath/news_active.png';
  String get portfolio => '$_basePath/portfolio_active.png';
  String get profile => '$_basePath/profile_active.png';
  String get homeInnactive => '$_basePath/home_innactive.png';
  String get marketInnactive => '$_basePath/market_innactive.png';
  String get newsInnactive => '$_basePath/news_innactive.png';
  String get portfolioInnactive => '$_basePath/portfolio_innactive.png';
  String get profileInnactive => '$_basePath/profile_innactive.png';

}
class Home {
  const Home();

  String get hot => '$_basePath/hot.png';
  String get message => '$_basePath/message.png';
  String get notifications => '$_basePath/notifications.png';
  String get arrowRight => '$_basePath/arrow_right.png';
  String get explore => '$_basePath/explore.png';
  String get ss => '$_basePath/ss.png';

}

