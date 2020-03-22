// To parse this JSON data, do
//
//     final dest = destFromJson(jsonString);

import 'dart:convert';

Dest destFromJson(String str) => Dest.fromJson(json.decode(str));

String destToJson(Dest data) => json.encode(data.toJson());
class Dest {
  List<Datum> data;
  Dictionaries dictionaries;
  Meta meta;

  Dest({
    this.data,
    this.dictionaries,
    this.meta,
  });

  factory Dest.fromJson(Map<String, dynamic> json) => Dest(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    dictionaries: Dictionaries.fromJson(json["dictionaries"]),
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "dictionaries": dictionaries.toJson(),
    "meta": meta.toJson(),
  };
}

class Datum {
  String type;
  String origin;
  String destination;
  DateTime departureDate;
  DateTime returnDate;
  Price price;
  DatumLinks links;

  Datum({
    this.type,
    this.origin,
    this.destination,
    this.departureDate,
    this.returnDate,
    this.price,
    this.links,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    type: json["type"],
    origin: json["origin"],
    destination: json["destination"],
    departureDate: DateTime.parse(json["departureDate"]),
    returnDate: DateTime.parse(json["returnDate"]),
    price: Price.fromJson(json["price"]),
    links: DatumLinks.fromJson(json["links"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "origin": origin,
    "destination": destination,
    "departureDate": "${departureDate.year.toString().padLeft(4, '0')}-${departureDate.month.toString().padLeft(2, '0')}-${departureDate.day.toString().padLeft(2, '0')}",
    "returnDate": "${returnDate.year.toString().padLeft(4, '0')}-${returnDate.month.toString().padLeft(2, '0')}-${returnDate.day.toString().padLeft(2, '0')}",
    "price": price.toJson(),
    "links": links.toJson(),
  };
}

class DatumLinks {
  String flightDates;
  String flightOffers;

  DatumLinks({
    this.flightDates,
    this.flightOffers,
  });

  factory DatumLinks.fromJson(Map<String, dynamic> json) => DatumLinks(
    flightDates: json["flightDates"],
    flightOffers: json["flightOffers"],
  );

  Map<String, dynamic> toJson() => {
    "flightDates": flightDates,
    "flightOffers": flightOffers,
  };
}

class Price {
  String total;

  Price({
    this.total,
  });

  factory Price.fromJson(Map<String, dynamic> json) => Price(
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "total": total,
  };
}

class Dictionaries {
  Currencies currencies;
  Map<String, Location> locations;

  Dictionaries({
    this.currencies,
    this.locations,
  });

  factory Dictionaries.fromJson(Map<String, dynamic> json) => Dictionaries(
    currencies: Currencies.fromJson(json["currencies"]),
    locations: Map.from(json["locations"]).map((k, v) => MapEntry<String, Location>(k, Location.fromJson(v))),
  );

  Map<String, dynamic> toJson() => {
    "currencies": currencies.toJson(),
    "locations": Map.from(locations).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
  };
}

class Currencies {
  String aed;

  Currencies({
    this.aed,
  });

  factory Currencies.fromJson(Map<String, dynamic> json) => Currencies(
    aed: json["AED"],
  );

  Map<String, dynamic> toJson() => {
    "AED": aed,
  };
}

class Location {
  String subType;
  String detailedName;

  Location({
    this.subType,
    this.detailedName,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    subType: json["subType"],
    detailedName: json["detailedName"],
  );

  Map<String, dynamic> toJson() => {
    "subType": subType,
    "detailedName": detailedName,
  };
}

class Meta {
  String currency;
  MetaLinks links;
  Defaults defaults;

  Meta({
    this.currency,
    this.links,
    this.defaults,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    currency: json["currency"],
    links: MetaLinks.fromJson(json["links"]),
    defaults: Defaults.fromJson(json["defaults"]),
  );

  Map<String, dynamic> toJson() => {
    "currency": currency,
    "links": links.toJson(),
    "defaults": defaults.toJson(),
  };
}

class Defaults {
  String departureDate;
  bool oneWay;
  String duration;
  bool nonStop;
  String viewBy;

  Defaults({
    this.departureDate,
    this.oneWay,
    this.duration,
    this.nonStop,
    this.viewBy,
  });

  factory Defaults.fromJson(Map<String, dynamic> json) => Defaults(
    departureDate: json["departureDate"],
    oneWay: json["oneWay"],
    duration: json["duration"],
    nonStop: json["nonStop"],
    viewBy: json["viewBy"],
  );

  Map<String, dynamic> toJson() => {
    "departureDate": departureDate,
    "oneWay": oneWay,
    "duration": duration,
    "nonStop": nonStop,
    "viewBy": viewBy,
  };
}

class MetaLinks {
  String self;

  MetaLinks({
    this.self,
  });

  factory MetaLinks.fromJson(Map<String, dynamic> json) => MetaLinks(
    self: json["self"],
  );

  Map<String, dynamic> toJson() => {
    "self": self,
  };
}



Img imgFromJson(String str) => Img.fromJson(json.decode(str));

String imgToJson(Img data) => json.encode(data.toJson());

class Img {
  Links links;
  List<Photo> photos;

  Img({
    this.links,
    this.photos,
  });

  factory Img.fromJson(Map<String, dynamic> json) => Img(
    links: Links.fromJson(json["_links"]),
    photos: List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "_links": links.toJson(),
    "photos": List<dynamic>.from(photos.map((x) => x.toJson())),
  };
}

class Links {
  List<Cury> curies;
  Self self;

  Links({
    this.curies,
    this.self,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    curies: List<Cury>.from(json["curies"].map((x) => Cury.fromJson(x))),
    self: Self.fromJson(json["self"]),
  );

  Map<String, dynamic> toJson() => {
    "curies": List<dynamic>.from(curies.map((x) => x.toJson())),
    "self": self.toJson(),
  };
}

class Cury {
  String href;
  String name;
  bool templated;

  Cury({
    this.href,
    this.name,
    this.templated,
  });

  factory Cury.fromJson(Map<String, dynamic> json) => Cury(
    href: json["href"],
    name: json["name"],
    templated: json["templated"],
  );

  Map<String, dynamic> toJson() => {
    "href": href,
    "name": name,
    "templated": templated,
  };
}

class Self {
  String href;

  Self({
    this.href,
  });

  factory Self.fromJson(Map<String, dynamic> json) => Self(
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "href": href,
  };
}

class Photo {
  Attribution attribution;
  Imagez image;

  Photo({
    this.attribution,
    this.image,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
    attribution: Attribution.fromJson(json["attribution"]),
    image: Imagez.fromJson(json["image"]),
  );

  Map<String, dynamic> toJson() => {
    "attribution": attribution.toJson(),
    "image": image.toJson(),
  };
}

class Attribution {
  String license;
  String photographer;
  String site;
  String source;

  Attribution({
    this.license,
    this.photographer,
    this.site,
    this.source,
  });

  factory Attribution.fromJson(Map<String, dynamic> json) => Attribution(
    license: json["license"],
    photographer: json["photographer"],
    site: json["site"],
    source: json["source"],
  );

  Map<String, dynamic> toJson() => {
    "license": license,
    "photographer": photographer,
    "site": site,
    "source": source,
  };
}

class Imagez {
  String mobile;
  String web;

  Imagez({
    this.mobile,
    this.web,
  });

  factory Imagez.fromJson(Map<String, dynamic> json) => Imagez(
    mobile: json["mobile"],
    web: json["web"],
  );

  Map<String, dynamic> toJson() => {
    "mobile": mobile,
    "web": web,
  };
}
