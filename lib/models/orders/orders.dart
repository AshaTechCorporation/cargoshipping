import 'package:cargoshipping/models/orders/optionsItem.dart';
import 'package:cargoshipping/models/orders/products.dart';
import 'package:json_annotation/json_annotation.dart';

part 'orders.g.dart';

@JsonSerializable()
class Orders {
  String? date;
  int? total_price;
  String? member_id;
  String? member_address_id;
  String? shipping_type;
  String? payment_term;
  String? note;
  List<Products>? products;
  List<OptionsItem>? options;

  Orders(
    this.date,
    this.total_price,
    this.member_id,
    this.member_address_id,
    this.shipping_type,
    this.payment_term,
    this.note,
    this.products,
    this.options,
  );

  factory Orders.fromJson(Map<String, dynamic> json) => _$OrdersFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersToJson(this);
}
