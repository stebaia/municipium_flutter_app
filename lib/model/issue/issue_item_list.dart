import 'package:equatable/equatable.dart';
import 'package:municipium/model/issue/issue_category.dart';
import 'package:municipium/model/municipium_image.dart';

class IssueItemList extends Equatable {
  final int id;
  final String content;
  final String latitude;
  final String longitude;
  final int stato;
  final bool merged;
  final String address;
  final bool closed;
  final bool archived;
  final bool started;
  final bool canceled;
  final String createdAt;
  final IssueCategory issueCategory;
  final MunicipiumImage image;
  final MunicipiumImage image2;
  final MunicipiumImage image3;
  final MunicipiumImage image4;

  const IssueItemList(
      {required this.id,
      required this.content,
      required this.latitude,
      required this.longitude,
      required this.stato,
      required this.merged,
      required this.address,
      required this.closed,
      required this.archived,
      required this.started,
      required this.canceled,
      required this.createdAt,
      required this.issueCategory,
      required this.image,
      required this.image2,
      required this.image3,
      required this.image4});

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        content,
        latitude,
        longitude,
        stato,
        merged,
        address,
        closed,
        archived,
        started,
        canceled,
        createdAt,
        issueCategory,
        image,
        image2,
        image3,
        image4
      ];
}
