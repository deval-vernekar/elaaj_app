class Doctors {
  int? _offset;
  int? _typeId;
  int? _totalSize;
  late List<DoctorModel>? _data;
  List<DoctorModel>? get doctors => _data;

  Doctors({
    required totalSize,
    required typeId,
    required offset,
    required data,
  }) {
    this._totalSize = totalSize;
    this._typeId = typeId;
    this._offset = offset;
    this._data = data;
  }

  Doctors.fromJson(Map<String, dynamic> json) {
    _offset = json['offset'];
    _typeId = json['type_id'];
    _totalSize = json['total_size'];
    if (json['data'] != null) {
      _data = <DoctorModel>[];
      json['data'].forEach((v) {
        _data!.add(DoctorModel.fromJson(v));
      });
    }
  }
}

class DoctorModel {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  DoctorModel(
      {this.id, this.email, this.firstName, this.lastName, this.avatar});

  DoctorModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }
}
















// class Doctors {
//   int? _page;
//   int? _perPage;
//   int? _total;
//   int? _totalPages;
//   Support? _support;
//   late List<DoctorModel>? _data;
//   List<DoctorModel>? get doctors => _data;

//   Doctors(
//       {required totalSize,
//       required typeId,
//       required offset,
//       required data,
//       required support});

//   Doctors.fromJson(Map<String, dynamic> json) {
//     _page = json['page'];
//     _perPage = json['per_page'];
//     _total = json['total'];
//     _totalPages = json['total_pages'];
//     if (json['data'] != null) {
//       _data = <DoctorModel>[];
//       json['data'].forEach((v) {
//         _data!.add(new DoctorModel.fromJson(v));
//       });
//     }
//     _support =
//         json['support'] != null ? new Support.fromJson(json['support']) : null;
//   }
// }

// class DoctorModel {
//   int? id;
//   String? email;
//   String? firstName;
//   String? lastName;
//   String? avatar;

//   DoctorModel(
//       {this.id, this.email, this.firstName, this.lastName, this.avatar});

//   DoctorModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     email = json['email'];
//     firstName = json['first_name'];
//     lastName = json['last_name'];
//     avatar = json['avatar'];
//   }
// }

// class Support {
//   String? url;
//   String? text;

//   Support({this.url, this.text});

//   Support.fromJson(Map<String, dynamic> json) {
//     url = json['url'];
//     text = json['text'];
//   }
// }













































// class Doctors {
//   // late List<DoctorsModel>? _doctors;
//   int? _total;
//   late List<DoctorsModel> _doctors = [];
//   List<DoctorsModel> get doctors => _doctors;

//   Doctors({required doctors, required total}) {
//     this._doctors = doctors;
//     this._total = total;
//   }

//   Doctors.fromJson(Map<String, dynamic> json) {
//     _total = json['total'];
//     _doctors = json['doctors'];
//     if (json['doctors'] != null) {
//       _doctors = <DoctorsModel>[];
//       json['doctors'].forEach((v) {
//         _doctors.add(DoctorsModel.fromJson(v));
//       });
//     }
//   }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this._doctors != null) {
  //     data['doctors'] = this._doctors!.map((v) => v.toJson()).toList();
  //   }
  //   data['total'] = this._total;
  //   return data;
  // }
// }

// 
// class Doctors {
//   int? id;
//   String? name;
//   String? username;
//   String? email;
//   Address? address;
//   String? phone;
//   String? website;
//   Company? company;

//   Doctors(
//       {this.id,
//       this.name,
//       this.username,
//       this.email,
//       this.address,
//       this.phone,
//       this.website,
//       this.company});

//   Doctors.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     username = json['username'];
//     email = json['email'];
//     address =
//         json['address'] != null ? new Address.fromJson(json['address']) : null;
//     phone = json['phone'];
//     website = json['website'];
//     company =
//         json['company'] != null ? new Company.fromJson(json['company']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['username'] = this.username;
//     data['email'] = this.email;
//     if (this.address != null) {
//       data['address'] = this.address!.toJson();
//     }
//     data['phone'] = this.phone;
//     data['website'] = this.website;
//     if (this.company != null) {
//       data['company'] = this.company!.toJson();
//     }
//     return data;
//   }
// }

// class Address {
//   String? street;
//   String? suite;
//   String? city;
//   String? zipcode;
//   Geo? geo;

//   Address({this.street, this.suite, this.city, this.zipcode, this.geo});

//   Address.fromJson(Map<String, dynamic> json) {
//     street = json['street'];
//     suite = json['suite'];
//     city = json['city'];
//     zipcode = json['zipcode'];
//     geo = json['geo'] != null ? new Geo.fromJson(json['geo']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['street'] = this.street;
//     data['suite'] = this.suite;
//     data['city'] = this.city;
//     data['zipcode'] = this.zipcode;
//     if (this.geo != null) {
//       data['geo'] = this.geo!.toJson();
//     }
//     return data;
//   }
// }

// class Geo {
//   String? lat;
//   String? lng;

//   Geo({this.lat, this.lng});

//   Geo.fromJson(Map<String, dynamic> json) {
//     lat = json['lat'];
//     lng = json['lng'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['lat'] = this.lat;
//     data['lng'] = this.lng;
//     return data;
//   }
// }

// class Company {
//   String? name;
//   String? catchPhrase;
//   String? bs;

//   Company({this.name, this.catchPhrase, this.bs});

//   Company.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     catchPhrase = json['catchPhrase'];
//     bs = json['bs'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['catchPhrase'] = this.catchPhrase;
//     data['bs'] = this.bs;
//     return data;
//   }
// }