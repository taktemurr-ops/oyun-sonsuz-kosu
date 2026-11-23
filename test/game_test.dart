import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_sonsuz_kosu/oyun_sonsuz_kosu.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(kosuConfig.title.length, 33);
    expect(kosuConfig.tagline.length, 33);
    for (final s in kosuConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler üretilir ve bot tarafından geçilir', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(kosuRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: kosuId, optionalMechanics: kosuRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(kosuRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
