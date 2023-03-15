import 'package:equatable/equatable.dart';
import 'package:municipium/model/point_of_interests_item.dart';

class PointOfInterestsList extends Equatable {

  int? currentPage;
	int? pageSize;
	int? pages;
	int? totalPoi;
	List<PointOfInterestsItem>? pointOfInterestsItemList;

  PointOfInterestsList({
    this.currentPage,
    this.pageSize,
    this.pages,
    this.totalPoi,
    this.pointOfInterestsItemList
  });
  
  @override
  // TODO: implement props
  List<Object?> get props => [
    currentPage,
    pageSize,
    pages,
    totalPoi,
    pointOfInterestsItemList
  ];




}