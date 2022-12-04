import 'package:flutter_test/flutter_test.dart';
import 'package:waroengku/domain/usecases/extract_name.dart';

void main() {
  const String input = "k1 Nama Kategori";
  const String expectedOutput = "Nama Kategori";
  test("should remove k1 from name", () {
    final output = extractName(input);
    expect(output, expectedOutput);
  });
}
