String extractName(String name) {
  final regex = RegExp(r"(?<=\s)(.*)");
  return regex.stringMatch(name).toString();
}
