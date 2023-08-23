// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CompanyModelAdapter extends TypeAdapter<Company_Model> {
  @override
  final int typeId = 0;

  @override
  Company_Model read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Company_Model(
      CompanyID: fields[0] as String,
      CompanyName: fields[1] as String,
      CompanyAdress: fields[2] as String,
      CompanyNumber: fields[3] as String,
      CompanyManager: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Company_Model obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.CompanyID)
      ..writeByte(1)
      ..write(obj.CompanyName)
      ..writeByte(2)
      ..write(obj.CompanyAdress)
      ..writeByte(3)
      ..write(obj.CompanyNumber)
      ..writeByte(4)
      ..write(obj.CompanyManager);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompanyModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
