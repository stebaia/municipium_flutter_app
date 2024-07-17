import 'package:equatable/equatable.dart';
import 'package:municipium/model/issue/issue_category.dart';
import 'package:municipium/model/municipium_image.dart';

class IssueDetail extends Equatable {
  final int? id;
  final String? content;
  final double? latitude;
  final double? longitude;
  final String? address;
  final String? createdAt;
  final int? stato;
  final bool? merged;
  final IssueCategory? issueCategory;
  final bool? closed;
  final bool? archived;
  final bool? started;
  final bool? canceled;
  final MunicipiumImage? image;
  final MunicipiumImage? image2;
  final MunicipiumImage? image3;
  final MunicipiumImage? image4;
  final List<String>? email;

  const IssueDetail(
      {required this.id,
      required this.content,
      required this.latitude,
      required this.longitude,
      required this.address,
      required this.createdAt,
      required this.stato,
      required this.merged,
      required this.issueCategory,
      required this.closed,
      required this.archived,
      required this.started,
      required this.canceled,
      required this.image,
      required this.image2,
      required this.image3,
      required this.image4,
      required this.email});

  @override
  List<Object?> get props => [
        id,
        content,
        latitude,
        longitude,
        address,
        createdAt,
        stato,
        merged,
        issueCategory,
        closed,
        archived,
        started,
        canceled,
        image,
        image2,
        image3,
        image4,
        email
      ];
}
