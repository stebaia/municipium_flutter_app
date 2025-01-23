class LissiPresentationTemplateResponse {
  int? totalPages;
  int? totalElements;
  bool? first;
  bool? last;
  int? size;
  List<PrestenationLissiTemplateContent>? content;
  int? number;
  Sort? sort;
  int? numberOfElements;
  Pageable? pageable;
  bool? empty;

  LissiPresentationTemplateResponse(
      {this.totalPages,
      this.totalElements,
      this.first,
      this.last,
      this.size,
      this.content,
      this.number,
      this.sort,
      this.numberOfElements,
      this.pageable,
      this.empty});

  LissiPresentationTemplateResponse.fromJson(Map<String, dynamic> json) {
    totalPages = json['totalPages'];
    totalElements = json['totalElements'];
    first = json['first'];
    last = json['last'];
    size = json['size'];
    if (json['content'] != null) {
      content = <PrestenationLissiTemplateContent>[];
      json['content'].forEach((v) {
        content!.add(new PrestenationLissiTemplateContent.fromJson(v));
      });
    }
    number = json['number'];
    sort = json['sort'] != null ? new Sort.fromJson(json['sort']) : null;
    numberOfElements = json['numberOfElements'];
    pageable = json['pageable'] != null
        ? new Pageable.fromJson(json['pageable'])
        : null;
    empty = json['empty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalPages'] = this.totalPages;
    data['totalElements'] = this.totalElements;
    data['first'] = this.first;
    data['last'] = this.last;
    data['size'] = this.size;
    if (this.content != null) {
      data['content'] = this.content!.map((v) => v.toJson()).toList();
    }
    data['number'] = this.number;
    if (this.sort != null) {
      data['sort'] = this.sort!.toJson();
    }
    data['numberOfElements'] = this.numberOfElements;
    if (this.pageable != null) {
      data['pageable'] = this.pageable!.toJson();
    }
    data['empty'] = this.empty;
    return data;
  }
}

class PrestenationLissiTemplateContent {
  String? presentationTemplateId;
  String? presentationTemplateName;
  String? callBackUrl;
  PresentationRequirements? presentationRequirements;
  Query? query;
  Extractor? extractor;
  String? purpose;

  PrestenationLissiTemplateContent(
      {this.presentationTemplateId,
      this.presentationTemplateName,
      this.callBackUrl,
      this.presentationRequirements,
      this.query,
      this.extractor,
      this.purpose});

  PrestenationLissiTemplateContent.fromJson(Map<String, dynamic> json) {
    presentationTemplateId = json['presentationTemplateId'];
    presentationTemplateName = json['presentationTemplateName'];
    callBackUrl = json['callBackUrl'];
    presentationRequirements = json['presentationRequirements'] != null
        ? new PresentationRequirements.fromJson(
            json['presentationRequirements'])
        : null;
    query = json['query'] != null ? new Query.fromJson(json['query']) : null;
    extractor = json['extractor'] != null
        ? new Extractor.fromJson(json['extractor'])
        : null;
    purpose = json['purpose'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['presentationTemplateId'] = this.presentationTemplateId;
    data['presentationTemplateName'] = this.presentationTemplateName;
    data['callBackUrl'] = this.callBackUrl;
    if (this.presentationRequirements != null) {
      data['presentationRequirements'] =
          this.presentationRequirements!.toJson();
    }
    if (this.query != null) {
      data['query'] = this.query!.toJson();
    }
    if (this.extractor != null) {
      data['extractor'] = this.extractor!.toJson();
    }
    data['purpose'] = this.purpose;
    return data;
  }
}

class PresentationRequirements {
  List<CredentialCriteria>? credentialCriteria;

  PresentationRequirements({this.credentialCriteria});

  PresentationRequirements.fromJson(Map<String, dynamic> json) {
    if (json['credentialCriteria'] != null) {
      credentialCriteria = <CredentialCriteria>[];
      json['credentialCriteria'].forEach((v) {
        credentialCriteria!.add(new CredentialCriteria.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.credentialCriteria != null) {
      data['credentialCriteria'] =
          this.credentialCriteria!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CredentialCriteria {
  String? id;
  String? requiredType;
  List<Null>? allowedIssuers;
  List<RequiredClaims>? requiredClaims;

  CredentialCriteria(
      {this.id, this.requiredType, this.allowedIssuers, this.requiredClaims});

  CredentialCriteria.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    requiredType = json['requiredType'];
    if (json['allowedIssuers'] != null) {
      allowedIssuers = <Null>[];
      json['allowedIssuers'].forEach((v) {
        //allowedIssuers!.add(new Null.fromJson(v));
      });
    }
    if (json['requiredClaims'] != null) {
      requiredClaims = <RequiredClaims>[];
      json['requiredClaims'].forEach((v) {
        requiredClaims!.add(new RequiredClaims.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['requiredType'] = this.requiredType;
    if (this.allowedIssuers != null) {
      /*data['allowedIssuers'] =
          this.allowedIssuers!.map((v) => v.toJson()).toList();
          */
    }
    if (this.requiredClaims != null) {
      data['requiredClaims'] =
          this.requiredClaims!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RequiredClaims {
  String? claimName;
  String? value;

  RequiredClaims({this.claimName, this.value});

  RequiredClaims.fromJson(Map<String, dynamic> json) {
    claimName = json['claimName'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['claimName'] = this.claimName;
    data['value'] = this.value;
    return data;
  }
}

class Query {
  Credentials? credentials;

  Query({this.credentials});

  Query.fromJson(Map<String, dynamic> json) {
    credentials = json['credentials'] != null
        ? new Credentials.fromJson(json['credentials'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.credentials != null) {
      data['credentials'] = this.credentials!.toJson();
    }
    return data;
  }
}

class Credentials {
  SdJwtPid? sdJwtPid;
  IdCard? idCard;

  Credentials({this.sdJwtPid, this.idCard});

  Credentials.fromJson(Map<String, dynamic> json) {
    sdJwtPid = json['sd-jwt-pid'] != null
        ? new SdJwtPid.fromJson(json['sd-jwt-pid'])
        : null;
    idCard =
        json['id-card'] != null ? new IdCard.fromJson(json['id-card']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sdJwtPid != null) {
      data['sd-jwt-pid'] = this.sdJwtPid!.toJson();
    }
    if (this.idCard != null) {
      data['id-card'] = this.idCard!.toJson();
    }
    return data;
  }
}

class SdJwtPid {
  String? format;
  String? vct;
  List<Claims>? claims;
  Null? allowedIssuers;

  SdJwtPid({this.format, this.vct, this.claims, this.allowedIssuers});

  SdJwtPid.fromJson(Map<String, dynamic> json) {
    format = json['format'];
    vct = json['vct'];
    if (json['claims'] != null) {
      claims = <Claims>[];
      json['claims'].forEach((v) {
        claims!.add(new Claims.fromJson(v));
      });
    }
    allowedIssuers = json['allowedIssuers'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['format'] = this.format;
    data['vct'] = this.vct;
    if (this.claims != null) {
      data['claims'] = this.claims!.map((v) => v.toJson()).toList();
    }
    data['allowedIssuers'] = this.allowedIssuers;
    return data;
  }
}

class Claims {
  List<String>? path;
  String? id;
  String? value;

  Claims({this.path, this.id, this.value});

  Claims.fromJson(Map<String, dynamic> json) {
    path = json['path'].cast<String>();
    id = json['id'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['path'] = this.path;
    data['id'] = this.id;
    data['value'] = this.value;
    return data;
  }
}

class IdCard {
  String? format;
  String? vct;
  List<Claims>? claims;
  List<String>? allowedIssuers;

  IdCard({this.format, this.vct, this.claims, this.allowedIssuers});

  IdCard.fromJson(Map<String, dynamic> json) {
    format = json['format'];
    vct = json['vct'];
    if (json['claims'] != null) {
      claims = <Claims>[];
      json['claims'].forEach((v) {
        claims!.add(new Claims.fromJson(v));
      });
    }
    allowedIssuers = json['allowedIssuers'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['format'] = this.format;
    data['vct'] = this.vct;
    if (this.claims != null) {
      data['claims'] = this.claims!.map((v) => v.toJson()).toList();
    }
    data['allowedIssuers'] = this.allowedIssuers;
    return data;
  }
}



class Extractor {
  String? unita;
  String? motivo;

  Extractor({this.unita, this.motivo});

  Extractor.fromJson(Map<String, dynamic> json) {
    unita = json['unita'];
    motivo = json['motivo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['unita'] = this.unita;
    data['motivo'] = this.motivo;
    return data;
  }
}

class Sort {
  bool? empty;
  bool? sorted;
  bool? unsorted;

  Sort({this.empty, this.sorted, this.unsorted});

  Sort.fromJson(Map<String, dynamic> json) {
    empty = json['empty'];
    sorted = json['sorted'];
    unsorted = json['unsorted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['empty'] = this.empty;
    data['sorted'] = this.sorted;
    data['unsorted'] = this.unsorted;
    return data;
  }
}

class Pageable {
  int? pageNumber;
  int? pageSize;
  Sort? sort;
  int? offset;
  bool? paged;
  bool? unpaged;

  Pageable(
      {this.pageNumber,
      this.pageSize,
      this.sort,
      this.offset,
      this.paged,
      this.unpaged});

  Pageable.fromJson(Map<String, dynamic> json) {
    pageNumber = json['pageNumber'];
    pageSize = json['pageSize'];
    sort = json['sort'] != null ? new Sort.fromJson(json['sort']) : null;
    offset = json['offset'];
    paged = json['paged'];
    unpaged = json['unpaged'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pageNumber'] = this.pageNumber;
    data['pageSize'] = this.pageSize;
    if (this.sort != null) {
      data['sort'] = this.sort!.toJson();
    }
    data['offset'] = this.offset;
    data['paged'] = this.paged;
    data['unpaged'] = this.unpaged;
    return data;
  }
}