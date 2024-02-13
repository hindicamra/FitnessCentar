import 'package:json_annotation/json_annotation.dart';

part 'shop_item_model.g.dart';

@JsonSerializable()
class ShopItemModel {
  final int id;
  final int price;
  final String name;
  final String description;
  ShopItemModel(
    this.id,
    this.price,
    this.name,
    this.description,
  );
  factory ShopItemModel.fromJson(Map<String, dynamic> json) =>
      _$ShopItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$ShopItemModelToJson(this);
}
