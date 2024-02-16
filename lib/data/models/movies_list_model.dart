class MoviesListModel {
  MoviesListModel({
    required this.docs,
    required this.total,
    required this.limit,
    required this.page,
    required this.pages,
  });
  late final List<Docs> docs;
  late final int total;
  late final int limit;
  late final int page;
  late final int pages;

  MoviesListModel.fromJson(Map<String, dynamic> json){
    docs = List.from(json['docs']).map((e)=>Docs.fromJson(e)).toList();
    total = json['total'];
    limit = json['limit'];
    page = json['page'];
    pages = json['pages'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['docs'] = docs.map((e)=>e.toJson()).toList();
    _data['total'] = total;
    _data['limit'] = limit;
    _data['page'] = page;
    _data['pages'] = pages;
    return _data;
  }
}

class Docs {
  Docs({
    required this.id,
    required this.name,
    required this.alternativeName,
    required this.enName,
    required this.type,
    required this.year,
    required this.description,
    required this.shortDescription,
    required this.movieLength,
    required this.isSeries,
    required this.ticketsOnSale,
    this.totalSeriesLength,
    this.seriesLength,
    required this.ratingMpaa,
    required this.ageRating,
    this.top10,
    required this.top250,
    required this.typeNumber,
    this.status,
    required this.names,
    required this.externalId,
    required this.logo,
    required this.poster,
    required this.backdrop,
    required this.rating,
    required this.votes,
    required this.genres,
    required this.countries,
    required this.releaseYears,
  });
  late final int id;
  late final String name;
  late final String alternativeName;
  late final String enName;
  late final String type;
  late final int year;
  late final String description;
  late final String shortDescription;
  late final int movieLength;
  late final bool isSeries;
  late final bool ticketsOnSale;
  late final int? totalSeriesLength;
  late final int? seriesLength;
  late final String ratingMpaa;
  late final int ageRating;
  late final int? top10;
  late final int top250;
  late final int typeNumber;
  late final String? status;
  late final List<Names> names;
  late final ExternalId externalId;
  late final Logo logo;
  late final Poster poster;
  late final Backdrop backdrop;
  late final Rating rating;
  late final Votes votes;
  late final List<Genres> genres;
  late final List<Countries> countries;
  late final List<dynamic> releaseYears;

  Docs.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    alternativeName = json['alternativeName'];
    enName = json['enName'];
    type = json['type'];
    year = json['year'];
    description = json['description'];
    shortDescription = json['shortDescription'];
    movieLength = json['movieLength']?? 0;
    isSeries = json['isSeries']?? 0;
    ticketsOnSale = json['ticketsOnSale']?? 0;
    totalSeriesLength = json['totalSeriesLength']?? 0;
    seriesLength = json['seriesLength']?? 0;
    ratingMpaa = json['ratingMpaa']?? '';
    ageRating = json['ageRating']?? 0;
    top10 = json['top10']?? 0;
    top250 = json['top250']?? 0;
    typeNumber = json['typeNumber'];
    status = json['status']?? '';
    names = List.from(json['names']).map((e)=>Names.fromJson(e)).toList();
    externalId = ExternalId.fromJson(json['externalId']);
    logo = json['logo'] == null? Logo(url: ''): Logo.fromJson(json['logo']);
    poster = json['poster'] == null? Poster(url: '', previewUrl: ''): Poster.fromJson(json['poster']);
    backdrop = Backdrop.fromJson(json['backdrop']);
    rating = Rating.fromJson(json['rating']);
    votes = Votes.fromJson(json['votes']);
    genres = List.from(json['genres']).map((e)=>Genres.fromJson(e)).toList();
    countries = List.from(json['countries']).map((e)=>Countries.fromJson(e)).toList();
    releaseYears = List.castFrom<dynamic, dynamic>(json['releaseYears']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['alternativeName'] = alternativeName;
    _data['enName'] = enName;
    _data['type'] = type;
    _data['year'] = year;
    _data['description'] = description;
    _data['shortDescription'] = shortDescription;
    _data['movieLength'] = movieLength;
    _data['isSeries'] = isSeries;
    _data['ticketsOnSale'] = ticketsOnSale;
    _data['totalSeriesLength'] = totalSeriesLength;
    _data['seriesLength'] = seriesLength;
    _data['ratingMpaa'] = ratingMpaa;
    _data['ageRating'] = ageRating;
    _data['top10'] = top10;
    _data['top250'] = top250;
    _data['typeNumber'] = typeNumber;
    _data['status'] = status;
    _data['names'] = names.map((e)=>e.toJson()).toList();
    _data['externalId'] = externalId.toJson();
    _data['logo'] = logo.toJson();
    _data['poster'] = poster.toJson();
    _data['backdrop'] = backdrop.toJson();
    _data['rating'] = rating.toJson();
    _data['votes'] = votes.toJson();
    _data['genres'] = genres.map((e)=>e.toJson()).toList();
    _data['countries'] = countries.map((e)=>e.toJson()).toList();
    _data['releaseYears'] = releaseYears;
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

class ExternalId {
  ExternalId({
    required this.imdb,
    required this.tmdb,
    required this.kpHD,
  });
  late final String imdb;
  late final String tmdb;
  late final String kpHD;

  ExternalId.fromJson(Map<String, dynamic> json){
    imdb = json['imdb']?? '';
    tmdb = json['tmdb'].toString();
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

class Logo {
  Logo({
    required this.url,
  });
  late final String url;

  Logo.fromJson(Map<String, dynamic> json){
    url = json['url']?? '';
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['url'] = url;
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
    url = json['url']?? '';
    previewUrl = json['previewUrl']?? '';
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['url'] = url;
    _data['previewUrl'] = previewUrl;
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
    url = json['url']?? '';
    previewUrl = json['previewUrl']?? '';
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['url'] = url;
    _data['previewUrl'] = previewUrl;
    return _data;
  }
}

class Rating {
  Rating({
    required this.kp,
    required this.imdb,
    required this.filmCritics,
    required this.russianFilmCritics,
    this.await,
  });
  late final double kp;
  late final double imdb;
  late final double filmCritics;
  late final double russianFilmCritics;
  late final Null await;

  Rating.fromJson(Map<String, dynamic> json){
    kp = double.parse(json['kp'].toString());
    imdb = double.parse(json['imdb'].toString());
    filmCritics = double.parse(json['filmCritics'].toString());
    russianFilmCritics = double.parse(json['russianFilmCritics'].toString());
    await = null;
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

class Votes {
  Votes({
    required this.kp,
    required this.imdb,
    required this.filmCritics,
    required this.russianFilmCritics,
    required this.await,
  });
  late final int kp;
  late final int imdb;
  late final int filmCritics;
  late final int russianFilmCritics;
  late final int await;

  Votes.fromJson(Map<String, dynamic> json){
    kp = json['kp'];
    imdb = json['imdb'];
    filmCritics = json['filmCritics'];
    russianFilmCritics = json['russianFilmCritics'];
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