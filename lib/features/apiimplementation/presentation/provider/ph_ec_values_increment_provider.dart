import 'package:flutter_riverpod/flutter_riverpod.dart';

class PhEcData {
  String? phValue;
  String? ecValue;

  PhEcData({this.phValue, this.ecValue});

  PhEcData copyWith({String? phValue, String? ecValue}) {
    return PhEcData(
      phValue: phValue ?? this.phValue,
      ecValue: ecValue ?? this.ecValue,
    );
  }
}

class PhValueNotifier extends StateNotifier<AsyncValue<PhEcData>> {
  PhValueNotifier() : super(const AsyncValue.loading());

  void initializeData(String initialPhValue, String initialEcValue) {
    state = AsyncValue.data(PhEcData(
      phValue: initialPhValue,
      ecValue: initialEcValue,
    ));
  }

  void incrementPhValue() {
    if (state is AsyncData) {
      final currentState = state as AsyncData<PhEcData>;
      final currentPhValue = int.parse(currentState.value.phValue!);
      state = AsyncValue.data(
        currentState.value.copyWith(phValue: (currentPhValue + 1).toString()),
      );
    }
  }

  void incrementEcValue() {
    if (state is AsyncData) {
      final currentState = state as AsyncData<PhEcData>;
      final currentEcValue = int.parse(currentState.value.ecValue!);
      state = AsyncValue.data(
        currentState.value.copyWith(ecValue: (currentEcValue + 1).toString()),
      );
    }
  }
}

final increasePhValueProvider =
    StateNotifierProvider<PhValueNotifier, AsyncValue<PhEcData>>((ref) {
  return PhValueNotifier();
});
