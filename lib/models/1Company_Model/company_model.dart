import 'package:hive/hive.dart';
// dsadsad
part 'company_model.g.dart';

@HiveType(typeId: 0)
class Company_Model extends HiveObject {
  @HiveField(0)
  String CompanyID;
  @HiveField(1)
  String CompanyName;
  @HiveField(2)
  String CompanyAdress;
  @HiveField(3)
  String CompanyNumber;
  @HiveField(4)
  String CompanyManager;

  Company_Model({
    required this.CompanyID,
    required this.CompanyName,
    required this.CompanyAdress,
    required this.CompanyNumber,
    required this.CompanyManager,
  });
}
