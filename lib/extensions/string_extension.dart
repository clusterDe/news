extension StringExtension on String {
  String get clearAllPadSpace {
    if (isEmpty) {
      return "";
    }
    final pattern = RegExp('\\s+');
    return trim().replaceAll(pattern, " ");
  }

  String get clearPadSpace {
    if (isEmpty) {
      return "";
    }
    return trim().split("\n").map((e) => e.clearAllPadSpace).join("\n");
  }

  String get inCaps => '${clearPadSpace[0].toUpperCase()}${substring(1)}';

  String get capitalizeEachWord {
    if (clearPadSpace.isEmpty) return this;
    return clearPadSpace
        .toLowerCase()
        .split(" ")
        .map((str) => str.inCaps)
        .join(" ");
  }
}
