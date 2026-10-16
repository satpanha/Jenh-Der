import 'package:flutter_test/flutter_test.dart';
import '../../docs/lib/model/category.dart';
import '../../docs/lib/model/geo_point.dart';
import '../../docs/lib/model/place.dart';
import '../../docs/lib/model/province.dart';

void main() {
  final province = Province(id: 'PV001', name: 'Preah Vihear');
  final place = Place(
    id: 'P001',
    name: 'Koh Ker',
    province: province,
    category: Category.temple,
    imageUrls: [],
    description: 'Ancient temple site',
    location: GeoPoint(latitude: 13.7847, longitude: 104.5375),
  );

  test('Empty keyword returns true', () {
    expect(place.matchesSearch(''), true);
  });

  test('Spaces-only keyword returns true', () {
    expect(place.matchesSearch('   '), true);
  });

  test('Lowercase koh matches place name', () {
    expect(place.matchesSearch('koh'), true);
  });

  test('Uppercase KOH matches place name', () {
    expect(place.matchesSearch('KOH'), true);
  });

  test('Province keyword returns true', () {
    expect(place.matchesSearch('preah'), true);
  });

  test('Non-matching keyword returns false', () {
    expect(place.matchesSearch('angkor'), false);
  });
}
