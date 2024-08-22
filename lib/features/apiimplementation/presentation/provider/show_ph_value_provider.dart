import 'package:ecph_value/features/apiimplementation/domain/models/ph_value_model.dart';
import 'package:ecph_value/features/apiimplementation/domain/provider/ph_value_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final availablePhValueProvider = FutureProvider.autoDispose<PhValue?>((ref) {
  return ref.read(phCheckRepoProvider).phValue();
});
