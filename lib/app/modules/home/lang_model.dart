class Lang {
  List<Countries> countries;
  List<Languages> languages;

  Lang({this.countries, this.languages});

  Lang.fromJson(Map<String, dynamic> json) {
    if (json['countries'] != null) {
      countries = List<Countries>();
      json['countries'].forEach((v) {
        countries.add(Countries.fromJson(v));
      });
    }
    if (json['languages'] != null) {
      languages = List<Languages>();
      json['languages'].forEach((v) {
        languages.add(Languages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.countries != null) {
      data['countries'] = this.countries.map((v) => v.toJson()).toList();
    }
    if (this.languages != null) {
      data['languages'] = this.languages.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Countries {
  String countryId;
  String name;
  String isoCode2;
  String isoCode3;
  String addressFormat;
  String postcodeRequired;
  String status;

  Countries(
      {this.countryId,
      this.name,
      this.isoCode2,
      this.isoCode3,
      this.addressFormat,
      this.postcodeRequired,
      this.status});

  Countries.fromJson(Map<String, dynamic> json) {
    countryId = json['country_id'];
    name = json['name'];
    isoCode2 = json['iso_code_2'];
    isoCode3 = json['iso_code_3'];
    addressFormat = json['address_format'];
    postcodeRequired = json['postcode_required'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['country_id'] = this.countryId;
    data['name'] = this.name;
    data['iso_code_2'] = this.isoCode2;
    data['iso_code_3'] = this.isoCode3;
    data['address_format'] = this.addressFormat;
    data['postcode_required'] = this.postcodeRequired;
    data['status'] = this.status;
    return data;
  }
}

class Languages {
  String languageId;
  String name;
  String code;

  Languages({this.languageId, this.name, this.code});

  Languages.fromJson(Map<String, dynamic> json) {
    languageId = json['language_id'];
    name = json['name'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['language_id'] = this.languageId;
    data['name'] = this.name;
    data['code'] = this.code;
    return data;
  }
}
