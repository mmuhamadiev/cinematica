class MovieModel {
  MovieModel({
    required this.fees,
    required this.externalId,
    required this.rating,
    required this.votes,
    required this.backdrop,
    required this.movieLength,
    required this.images,
    required this.productionCompanies,
    required this.spokenLanguages,
    required this.id,
    required this.type,
    required this.name,
    required this.description,
    required this.distributors,
    required this.premiere,
    required this.slogan,
    required this.year,
    required this.budget,
    required this.poster,
    required this.facts,
    required this.genres,
    required this.countries,
    required this.seasonsInfo,
    required this.persons,
    required this.lists,
    required this.typeNumber,
    required this.alternativeName,
    required this.names,
    required this.similarMovies,
    required this.updatedAt,
    required this.imagesInfo,
    required this.sequelsAndPrequels,
    required this.ratingMpaa,
    required this.shortDescription,
    required this.technology,
    required this.ticketsOnSale,
    required this.ageRating,
    required this.logo,
    required this.watchability,
    required this.top10,
    required this.top250,
    required this.audience,
    required this.isSeries,
    required this.seriesLength,
    required this.totalSeriesLength,
    required this.videos,
  });
  late final Fees fees;
  late final ExternalId externalId;
  late final Rating rating;
  late final Votes votes;
  late final Backdrop backdrop;
  late final int movieLength;
  late final Images images;
  late final List<ProductionCompanies> productionCompanies;
  late final List<SpokenLanguages> spokenLanguages;
  late final int id;
  late final String type;
  late final String name;
  late final String description;
  late final Distributors distributors;
  late final Premiere premiere;
  late final String slogan;
  late final int year;
  late final Budget budget;
  late final Poster poster;
  late final List<Facts> facts;
  late final List<Genres> genres;
  late final List<Countries> countries;
  late final List<dynamic> seasonsInfo;
  late final List<Persons> persons;
  late final List<String> lists;
  late final int typeNumber;
  late final String alternativeName;
  late final List<Names> names;
  late final List<SimilarMovies> similarMovies;
  late final String updatedAt;
  late final ImagesInfo imagesInfo;
  late final List<dynamic> sequelsAndPrequels;
  late final String ratingMpaa;
  late final String shortDescription;
  late final Technology technology;
  late final bool ticketsOnSale;
  late final int ageRating;
  late final Logo logo;
  late final Watchability watchability;
  late final int top10;
  late final int top250;
  late final List<Audience> audience;
  late final bool isSeries;
  late final int seriesLength;
  late final int totalSeriesLength;
  late final Videos videos;

  MovieModel.fromJson(Map<String, dynamic> json){
    fees = Fees.fromJson(json['fees']);
    externalId = ExternalId.fromJson(json['externalId']);
    rating = Rating.fromJson(json['rating']);
    votes = Votes.fromJson(json['votes']);
    backdrop = Backdrop.fromJson(json['backdrop']);
    movieLength = json['movieLength'];
    images = Images.fromJson(json['images']);
    productionCompanies = List.from(json['productionCompanies']).map((e)=>ProductionCompanies.fromJson(e)).toList();
    spokenLanguages = List.from(json['spokenLanguages']).map((e)=>SpokenLanguages.fromJson(e)).toList();
    id = json['id'];
    type = json['type'];
    name = json['name'];
    description = json['description'];
    distributors = Distributors.fromJson(json['distributors']);
    premiere = Premiere.fromJson(json['premiere']);
    slogan = json['slogan'];
    year = json['year'];
    budget = Budget.fromJson(json['budget']);
    poster = Poster.fromJson(json['poster']);
    facts = List.from(json['facts']).map((e)=>Facts.fromJson(e)).toList();
    genres = List.from(json['genres']).map((e)=>Genres.fromJson(e)).toList();
    countries = List.from(json['countries']).map((e)=>Countries.fromJson(e)).toList();
    seasonsInfo = List.castFrom<dynamic, dynamic>(json['seasonsInfo']);
    persons = List.from(json['persons']).map((e)=>Persons.fromJson(e)).toList();
    lists = List.castFrom<dynamic, String>(json['lists']);
    typeNumber = json['typeNumber'];
    alternativeName = json['alternativeName'];
    names = List.from(json['names']).map((e)=>Names.fromJson(e)).toList();
    similarMovies = List.from(json['similarMovies']).map((e)=>SimilarMovies.fromJson(e)).toList();
    updatedAt = json['updatedAt'];
    imagesInfo = ImagesInfo.fromJson(json['imagesInfo']);
    sequelsAndPrequels = List.castFrom<dynamic, dynamic>(json['sequelsAndPrequels']);
    ratingMpaa = json['ratingMpaa'];
    shortDescription = json['shortDescription'];
    technology = Technology.fromJson(json['technology']);
    ticketsOnSale = json['ticketsOnSale'];
    ageRating = json['ageRating'] ?? 0 ;
    logo = json['logo'] == null? Logo(url: ''): Logo.fromJson(json['logo']);
    watchability = Watchability.fromJson(json['watchability']);
    top10 = json['top10'] ?? 0 ;
    top250 = json['top250'] ?? 0 ;
    audience = json['audience'] == null? []: List.from(json['audience']).map((e)=>Audience.fromJson(e)).toList();
    isSeries = json['isSeries'];
    seriesLength = json['seriesLength'] ?? 0 ;
    totalSeriesLength = json['totalSeriesLength'] ?? 0 ;
    videos = Videos.fromJson(json['videos']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['fees'] = fees.toJson();
    _data['externalId'] = externalId.toJson();
    _data['rating'] = rating.toJson();
    _data['votes'] = votes.toJson();
    _data['backdrop'] = backdrop.toJson();
    _data['movieLength'] = movieLength;
    _data['images'] = images.toJson();
    _data['productionCompanies'] = productionCompanies.map((e)=>e.toJson()).toList();
    _data['spokenLanguages'] = spokenLanguages.map((e)=>e.toJson()).toList();
    _data['id'] = id;
    _data['type'] = type;
    _data['name'] = name;
    _data['description'] = description;
    _data['distributors'] = distributors.toJson();
    _data['premiere'] = premiere.toJson();
    _data['slogan'] = slogan;
    _data['year'] = year;
    _data['budget'] = budget.toJson();
    _data['poster'] = poster.toJson();
    _data['facts'] = facts.map((e)=>e.toJson()).toList();
    _data['genres'] = genres.map((e)=>e.toJson()).toList();
    _data['countries'] = countries.map((e)=>e.toJson()).toList();
    _data['seasonsInfo'] = seasonsInfo;
    _data['persons'] = persons.map((e)=>e.toJson()).toList();
    _data['lists'] = lists;
    _data['typeNumber'] = typeNumber;
    _data['alternativeName'] = alternativeName;
    _data['names'] = names.map((e)=>e.toJson()).toList();
    _data['similarMovies'] = similarMovies.map((e)=>e.toJson()).toList();
    _data['updatedAt'] = updatedAt;
    _data['imagesInfo'] = imagesInfo.toJson();
    _data['sequelsAndPrequels'] = sequelsAndPrequels;
    _data['ratingMpaa'] = ratingMpaa;
    _data['shortDescription'] = shortDescription;
    _data['technology'] = technology.toJson();
    _data['ticketsOnSale'] = ticketsOnSale;
    _data['ageRating'] = ageRating;
    _data['logo'] = logo.toJson();
    _data['watchability'] = watchability.toJson();
    _data['top10'] = top10;
    _data['top250'] = top250;
    _data['audience'] = audience.map((e)=>e.toJson()).toList();
    _data['isSeries'] = isSeries;
    _data['seriesLength'] = seriesLength;
    _data['totalSeriesLength'] = totalSeriesLength;
    _data['videos'] = videos.toJson();
    return _data;
  }
}

class Fees {
  Fees({
    required this.world,
  });
  late final World world;

  Fees.fromJson(Map<String, dynamic> json){
    world = World.fromJson(json['world']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['world'] = world.toJson();
    return _data;
  }
}

class World {
  World({
    required this.value,
    required this.currency,
  });
  late final int value;
  late final String currency;

  World.fromJson(Map<String, dynamic> json){
    value = json['value'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['value'] = value;
    _data['currency'] = currency;
    return _data;
  }
}

class Russia {
  Russia({
    required this.value,
    required this.currency,
  });
  late final int value;
  late final String currency;

  Russia.fromJson(Map<String, dynamic> json){
    value = json['value'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['value'] = value;
    _data['currency'] = currency;
    return _data;
  }
}

class Usa {
  Usa({
    required this.value,
    required this.currency,
  });
  late final int value;
  late final String currency;

  Usa.fromJson(Map<String, dynamic> json){
    value = json['value'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['value'] = value;
    _data['currency'] = currency;
    return _data;
  }
}

class ExternalId {
  ExternalId({
    required this.imdb,
    required this.tmdb,
    required this.kpHD,
  });
  late final String imdb;
  late final int tmdb;
  late final String kpHD;

  ExternalId.fromJson(Map<String, dynamic> json){
    imdb = json['imdb']?? '';
    tmdb = json['tmdb']?? 0;
    kpHD = json['kpHD']?? '';
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['imdb'] = imdb;
    _data['tmdb'] = tmdb;
    _data['kpHD'] = kpHD;
    return _data;
  }
}

class Rating {
  Rating({
    required this.kp,
    required this.imdb,
    required this.filmCritics,
    required this.russianFilmCritics,
  });
  late final double kp;
  late final double imdb;
  late final double filmCritics;
  late final double russianFilmCritics;

  Rating.fromJson(Map<String, dynamic> json){
    kp = double.parse(json['kp'].toString());
    imdb = double.parse(json['imdb'].toString());
    filmCritics = double.parse(json['filmCritics'].toString());
    russianFilmCritics = double.parse(json['russianFilmCritics'].toString());
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['kp'] = kp;
    _data['imdb'] = imdb;
    _data['filmCritics'] = filmCritics;
    _data['russianFilmCritics'] = russianFilmCritics;
    return _data;
  }
}

class Votes {
  Votes({
    required this.kp,
    required this.imdb,
    required this.filmCritics,
    required this.russianFilmCritics,
    required this.await,
  });
  late final double kp;
  late final double imdb;
  late final double filmCritics;
  late final double russianFilmCritics;
  late final int await;

  Votes.fromJson(Map<String, dynamic> json){
    kp = double.parse(json['kp'].toString());
    imdb = double.parse(json['imdb'].toString());
    filmCritics = double.parse(json['filmCritics'].toString());
    russianFilmCritics = double.parse(json['russianFilmCritics'].toString());
    await = json['await'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['kp'] = kp;
    _data['imdb'] = imdb;
    _data['filmCritics'] = filmCritics;
    _data['russianFilmCritics'] = russianFilmCritics;
    _data['await'] = await;
    return _data;
  }
}

class Backdrop {
  Backdrop({
    required this.url,
    required this.previewUrl,
  });
  late final String url;
  late final String previewUrl;

  Backdrop.fromJson(Map<String, dynamic> json){
    url = json['url'];
    previewUrl = json['previewUrl'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['url'] = url;
    _data['previewUrl'] = previewUrl;
    return _data;
  }
}

class Images {
  Images({
    required this.postersCount,
    required this.backdropsCount,
    required this.framesCount,
  });
  late final int postersCount;
  late final int backdropsCount;
  late final int framesCount;

  Images.fromJson(Map<String, dynamic> json){
    postersCount = json['postersCount']?? 0;
    backdropsCount = json['backdropsCount']?? 0;
    framesCount = json['framesCount']?? 0;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['postersCount'] = postersCount;
    _data['backdropsCount'] = backdropsCount;
    _data['framesCount'] = framesCount;
    return _data;
  }
}

class ProductionCompanies {
  ProductionCompanies({
    required this.name,
    this.url,
    this.previewUrl,
  });
  late final String name;
  late final String? url;
  late final String? previewUrl;

  ProductionCompanies.fromJson(Map<String, dynamic> json){
    name = json['name'];
    url = null;
    previewUrl = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    _data['previewUrl'] = previewUrl;
    return _data;
  }
}

class SpokenLanguages {
  SpokenLanguages({
    required this.name,
    required this.nameEn,
  });
  late final String name;
  late final String nameEn;

  SpokenLanguages.fromJson(Map<String, dynamic> json){
    name = json['name'];
    nameEn = json['nameEn'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['nameEn'] = nameEn;
    return _data;
  }
}

class Distributors {
  Distributors({
    required this.distributor,
    required this.distributorRelease,
  });
  late final String distributor;
  late final String distributorRelease;

  Distributors.fromJson(Map<String, dynamic> json){
    distributor = json['distributor']?? '';
    distributorRelease = json['distributorRelease']?? '';
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['distributor'] = distributor;
    _data['distributorRelease'] = distributorRelease;
    return _data;
  }
}

class Premiere {
  Premiere({
    required this.world,
    required this.russia,
    required this.bluray,
    required this.dvd,
  });
  late final String world;
  late final String russia;
  late final String bluray;
  late final String dvd;

  Premiere.fromJson(Map<String, dynamic> json){
    world = json['world']?? '';
    russia = json['russia']?? '';
    bluray = json['bluray']?? '';
    dvd = json['dvd']?? '';
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['world'] = world;
    _data['russia'] = russia;
    _data['bluray'] = bluray;
    _data['dvd'] = dvd;
    return _data;
  }
}

class Budget {
  Budget({
    required this.value,
    required this.currency,
  });
  late final int value;
  late final String currency;

  Budget.fromJson(Map<String, dynamic> json){
    value = json['value'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['value'] = value;
    _data['currency'] = currency;
    return _data;
  }
}

class Poster {
  Poster({
    required this.url,
    required this.previewUrl,
  });
  late final String url;
  late final String previewUrl;

  Poster.fromJson(Map<String, dynamic> json){
    url = json['url'];
    previewUrl = json['previewUrl'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['url'] = url;
    _data['previewUrl'] = previewUrl;
    return _data;
  }
}

class Facts {
  Facts({
    required this.value,
    required this.type,
    required this.spoiler,
  });
  late final String value;
  late final String type;
  late final bool spoiler;

  Facts.fromJson(Map<String, dynamic> json){
    value = json['value'];
    type = json['type'];
    spoiler = json['spoiler'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['value'] = value;
    _data['type'] = type;
    _data['spoiler'] = spoiler;
    return _data;
  }
}

class Genres {
  Genres({
    required this.name,
  });
  late final String name;

  Genres.fromJson(Map<String, dynamic> json){
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    return _data;
  }
}

class Countries {
  Countries({
    required this.name,
  });
  late final String name;

  Countries.fromJson(Map<String, dynamic> json){
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    return _data;
  }
}

class Persons {
  Persons({
    required this.id,
    required this.photo,
    required this.name,
    this.enName,
    this.description,
    required this.profession,
    required this.enProfession,
  });
  late final int id;
  late final String photo;
  late final String name;
  late final String? enName;
  late final String? description;
  late final String profession;
  late final String enProfession;

  Persons.fromJson(Map<String, dynamic> json){
    id = json['id'];
    photo = json['photo'];
    name = json['name'];
    enName = null;
    description = null;
    profession = json['profession'];
    enProfession = json['enProfession'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['photo'] = photo;
    _data['name'] = name;
    _data['enName'] = enName;
    _data['description'] = description;
    _data['profession'] = profession;
    _data['enProfession'] = enProfession;
    return _data;
  }
}

class Names {
  Names({
    required this.name,
  });
  late final String name;

  Names.fromJson(Map<String, dynamic> json){
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    return _data;
  }
}

class SimilarMovies {
  SimilarMovies({
    required this.id,
    required this.name,
    this.enName,
    required this.type,
    required this.poster,
    required this.year,
    required this.rating,
  });
  late final int id;
  late final String name;
  late final Null enName;
  late final String type;
  late final Poster poster;
  late final int year;
  late final Rating rating;

  SimilarMovies.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    enName = null;
    type = json['type'];
    poster = Poster.fromJson(json['poster']);
    year = json['year'];
    rating = Rating.fromJson(json['rating']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['enName'] = enName;
    _data['type'] = type;
    _data['poster'] = poster.toJson();
    _data['year'] = year;
    _data['rating'] = rating.toJson();
    return _data;
  }
}

class ImagesInfo {
  ImagesInfo({
    required this.framesCount,
  });
  late final int framesCount;

  ImagesInfo.fromJson(Map<String, dynamic> json){
    framesCount = json['framesCount'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['framesCount'] = framesCount;
    return _data;
  }
}

class Technology {
  Technology({
    required this.hasImax,
    required this.has3D,
  });
  late final bool hasImax;
  late final bool has3D;

  Technology.fromJson(Map<String, dynamic> json){
    hasImax = json['hasImax'];
    has3D = json['has3D'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['hasImax'] = hasImax;
    _data['has3D'] = has3D;
    return _data;
  }
}

class Logo {
  Logo({
    required this.url,
  });
  late final String url;

  Logo.fromJson(Map<String, dynamic> json){
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['url'] = url;
    return _data;
  }
}

class Watchability {
  Watchability({
    required this.items,
  });
  late final List<Items> items;

  Watchability.fromJson(Map<String, dynamic> json){
    items = List.from(json['items']).map((e)=>Items.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['items'] = items.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Items {
  Items({
    required this.name,
    required this.logo,
    required this.url,
  });
  late final String name;
  late final Logo logo;
  late final String url;

  Items.fromJson(Map<String, dynamic> json){
    name = json['name'];
    logo = Logo.fromJson(json['logo']);
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['logo'] = logo.toJson();
    _data['url'] = url;
    return _data;
  }
}

class Audience {
  Audience({
    required this.count,
    required this.country,
  });
  late final int count;
  late final String country;

  Audience.fromJson(Map<String, dynamic> json){
    count = json['count'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['count'] = count;
    _data['country'] = country;
    return _data;
  }
}

class Videos {
  Videos({
    required this.trailers,
  });
  late final List<Trailers> trailers;

  Videos.fromJson(Map<String, dynamic> json){
    trailers = List.from(json['trailers']).map((e)=>Trailers.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['trailers'] = trailers.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Trailers {
  Trailers({
    required this.url,
    required this.name,
    required this.site,
    required this.type,
  });
  late final String url;
  late final String name;
  late final String site;
  late final String type;

  Trailers.fromJson(Map<String, dynamic> json){
    url = json['url'];
    name = json['name'];
    site = json['site'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['url'] = url;
    _data['name'] = name;
    _data['site'] = site;
    _data['type'] = type;
    return _data;
  }
}