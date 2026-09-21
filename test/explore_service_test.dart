import 'package:test/test.dart';
import 'package:jenh_der/service/explore_service.dart';

void main() {
  group('Explore service', () {
    test('returns all places when category is All', () {
      final service = ExploreService();

      final result = service.filterByCategory('All');

      expect(result.length, service.places.length);
    });

    test('filters places by category', () {
      final service = ExploreService();

      final result = service.filterByCategory('Temple');

      expect(result.every((place) => place.category == 'Temple'), true);
    });

    test('search narrows down by name', () {
      final service = ExploreService();

      final result = service.search('koh');

      expect(result.length, 1);
      expect(result.first.name, 'Koh Ker');
    });

    test('search matches by province too', () {
      final service = ExploreService();

      final result = service.search('kampong speu');

      expect(result.length, 1);
      expect(result.first.name, 'Kirirom');
    });
  });
}
