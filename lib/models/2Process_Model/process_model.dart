import 'package:hive/hive.dart';
// dsadsad
part 'process_model.g.dart';

@HiveType(typeId: 2)
class Process_Model extends HiveObject {
  @HiveField(0)
  String ProcessID;
  @HiveField(1)
  String CompanyID;
  @HiveField(2)
  String ProductName;
  @HiveField(3)
  DateTime DateProcess;
  @HiveField(4)
  String ProductPrice;
  @HiveField(5)
  String CompanyOwner;
  @HiveField(6)
  String TypeProcess;
  @HiveField(7)
  String LateMoney;

  Process_Model({
    required this.ProcessID,
    required this.CompanyID,
    required this.ProductName,
    required this.DateProcess,
    required this.ProductPrice,
    required this.CompanyOwner,
    required this.TypeProcess,
    required this.LateMoney,
  });
}
