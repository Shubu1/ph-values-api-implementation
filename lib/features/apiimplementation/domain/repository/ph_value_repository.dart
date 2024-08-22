import 'package:ecph_value/features/apiimplementation/domain/models/ph_value_model.dart';

abstract class PhValueRepository {
  Future<PhValue>? phValue();
}
