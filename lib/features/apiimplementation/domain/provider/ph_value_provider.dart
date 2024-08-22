import 'package:ecph_value/features/apiimplementation/data/repository/ph_value_repository_implementation.dart';
import 'package:ecph_value/features/apiimplementation/domain/repository/ph_value_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final phCheckRepoProvider = Provider<PhValueRepository>((ref) {
  return PhValueRepositoryImpl();
});
