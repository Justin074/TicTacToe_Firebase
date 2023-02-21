extension StringExtensions on String {
  bool get isX {
    final String formattedValue = trim();
    if (formattedValue.toLowerCase() == 'x') return true;
    return false;
  }

  bool get isO {
    final String formattedValue = trim();
    if (formattedValue.toLowerCase() == 'o') return true;
    return false;
  }

  bool get isBlank {
    final String formattedValue = trim();
    if (formattedValue.toLowerCase() == '') return true;
    return false;
  }
}