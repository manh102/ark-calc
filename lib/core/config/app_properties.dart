enum ModeBuildType { DEBUG, TESTING, PRODUCTION }

class AppProperties {
  /// An instance must be set only once in startup
  static late final AppProperties instance;
  // Appication URL
  final String apSrvURL;
  //Image URL
  final String imgSrvURL;
  //BUILD MODE STATUS
  final ModeBuildType modeBuild;

  const AppProperties({
    required this.apSrvURL,
    required this.imgSrvURL,
    this.modeBuild = ModeBuildType.PRODUCTION,
  });
}
