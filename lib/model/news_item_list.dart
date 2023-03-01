import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:municipium/model/municipium_image.dart';
import 'package:municipium/model/item_category.dart';

class NewsItemList extends Equatable {

  final int id;
  final String title;
  final MunicipiumImage images;
  final List<ItemCategory> newsCategories;
  final String publishedAt;

  const NewsItemList({
    required this.id,
    required this.title,
    required this.images,
    required this.newsCategories,
    required this.publishedAt
  });

  

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    title,
    images,
    newsCategories,
    publishedAt
  ];

}