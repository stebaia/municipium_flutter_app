import 'package:equatable/equatable.dart';
import 'package:municipium/model/municipality.dart';
import 'package:municipium/services/network/dto/municipality_dto.dart';

class MunicipalityListDTO extends Equatable {
  int? total;
	int? pages;
	List<MunicipalityDTO>? results;
	int? currentPage;
	int? pageSize;

	MunicipalityListDTO({this.total, this.pages, this.results, this.currentPage, this.pageSize});

	MunicipalityListDTO.fromJson(Map<String, dynamic> json) {
		total = json['total'];
		pages = json['pages'];
		if (json['results'] != null) {
			results = <MunicipalityDTO>[];
			json['results'].forEach((v) { results!.add(MunicipalityDTO.fromJson(v)); });
		}
		currentPage = json['current_page'];
		pageSize = json['page_size'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['total'] = this.total;
		data['pages'] = this.pages;
		if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
		data['current_page'] = this.currentPage;
		data['page_size'] = this.pageSize;
		return data;
	}

  
  @override
  List<Object?> get props => [total, pages, results, currentPage, pageSize];

  
}