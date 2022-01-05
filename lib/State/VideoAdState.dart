import 'package:flutter_riverpod/flutter_riverpod.dart';

class VideoAdState extends StateNotifier<int> {
  VideoAdState(ref) : super(0);

  void increment() {
    state = state + 1;
  }
}

final videoAdProvider = StateNotifierProvider<VideoAdState, int>((ref) {
  return VideoAdState(ref);
});
