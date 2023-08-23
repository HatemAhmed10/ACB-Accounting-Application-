// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'process_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProcessModelAdapter extends TypeAdapter<Process_Model> {
  @override
  final int typeId = 2;

  @override
  Process_Model read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Process_Model(
      ProcessID: fields[0] as String,
      CompanyID: fields[1] as String,
      ProductName: fields[2] as String,
      DateProcess: fields[3] as DateTime,
      ProductPrice: fields[4] as String,
      CompanyOwner: fields[5] as String,
      TypeProcess: fields[6] as String,
      LateMoney: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Process_Model obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.ProcessID)
      ..writeByte(1)
      ..write(obj.CompanyID)
      ..writeByte(2)
      ..write(obj.ProductName)
      ..writeByte(3)
      ..write(obj.DateProcess)
      ..writeByte(4)
      ..write(obj.ProductPrice)
      ..writeByte(5)
      ..write(obj.CompanyOwner)
      ..writeByte(6)
      ..write(obj.TypeProcess)
      ..writeByte(7)
      ..write(obj.LateMoney);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProcessModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
