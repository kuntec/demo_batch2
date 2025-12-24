/// status : true
/// message : "Services found"
/// services : [{"id":1,"name_en":"Ceramic Wash","name_ar":"Ceramic Wash","description":"This is ceramic Wash","price":"200.00","duration":60,"active":1,"photo":"services/3WMGnC6zDGuWDAWhfKxLae1CpBd0cMmuwlCOLnre.jpg","created_at":"2025-10-29T14:22:39.000000Z","updated_at":"2025-10-29T14:22:39.000000Z"}]

class GetAllServicesData {
  GetAllServicesData({
    dynamic status,
    dynamic message,
    List<Services>? services,
  }) {
    _status = status;
    _message = message;
    _services = services;
  }

  GetAllServicesData.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['services'] != null) {
      _services = [];
      json['services'].forEach((v) {
        _services?.add(Services.fromJson(v));
      });
    }
  }
  dynamic _status;
  dynamic _message;
  List<Services>? _services;
  GetAllServicesData copyWith({
    dynamic status,
    dynamic message,
    List<Services>? services,
  }) =>
      GetAllServicesData(
        status: status ?? _status,
        message: message ?? _message,
        services: services ?? _services,
      );
  dynamic get status => _status;
  dynamic get message => _message;
  List<Services>? get services => _services;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_services != null) {
      map['services'] = _services?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 1
/// name_en : "Ceramic Wash"
/// name_ar : "Ceramic Wash"
/// description : "This is ceramic Wash"
/// price : "200.00"
/// duration : 60
/// active : 1
/// photo : "services/3WMGnC6zDGuWDAWhfKxLae1CpBd0cMmuwlCOLnre.jpg"
/// created_at : "2025-10-29T14:22:39.000000Z"
/// updated_at : "2025-10-29T14:22:39.000000Z"

class Services {
  Services({
    dynamic id,
    dynamic nameEn,
    dynamic nameAr,
    dynamic description,
    dynamic price,
    dynamic duration,
    dynamic active,
    dynamic photo,
    dynamic createdAt,
    dynamic updatedAt,
  }) {
    _id = id;
    _nameEn = nameEn;
    _nameAr = nameAr;
    _description = description;
    _price = price;
    _duration = duration;
    _active = active;
    _photo = photo;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Services.fromJson(dynamic json) {
    _id = json['id'];
    _nameEn = json['name_en'];
    _nameAr = json['name_ar'];
    _description = json['description'];
    _price = json['price'];
    _duration = json['duration'];
    _active = json['active'];
    _photo = json['photo'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  dynamic _id;
  dynamic _nameEn;
  dynamic _nameAr;
  dynamic _description;
  dynamic _price;
  dynamic _duration;
  dynamic _active;
  dynamic _photo;
  dynamic _createdAt;
  dynamic _updatedAt;
  Services copyWith({
    dynamic id,
    dynamic nameEn,
    dynamic nameAr,
    dynamic description,
    dynamic price,
    dynamic duration,
    dynamic active,
    dynamic photo,
    dynamic createdAt,
    dynamic updatedAt,
  }) =>
      Services(
        id: id ?? _id,
        nameEn: nameEn ?? _nameEn,
        nameAr: nameAr ?? _nameAr,
        description: description ?? _description,
        price: price ?? _price,
        duration: duration ?? _duration,
        active: active ?? _active,
        photo: photo ?? _photo,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );
  dynamic get id => _id;
  dynamic get nameEn => _nameEn;
  dynamic get nameAr => _nameAr;
  dynamic get description => _description;
  dynamic get price => _price;
  dynamic get duration => _duration;
  dynamic get active => _active;
  dynamic get photo => _photo;
  dynamic get createdAt => _createdAt;
  dynamic get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name_en'] = _nameEn;
    map['name_ar'] = _nameAr;
    map['description'] = _description;
    map['price'] = _price;
    map['duration'] = _duration;
    map['active'] = _active;
    map['photo'] = _photo;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
