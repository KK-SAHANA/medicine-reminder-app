import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../models/medicine_model.dart';

class MedicineProvider extends ChangeNotifier {
  final Box _box = Hive.box('medicinesBox');

  List<Medicine> get medicines {
    final List stored = _box.get('medicines', defaultValue: []);
    final List<Medicine> meds = stored.cast<Medicine>();

    meds.sort((a, b) => a.time.compareTo(b.time));
    return meds;
  }

  void addMedicine(Medicine medicine) {
    final List stored = _box.get('medicines', defaultValue: []);
    stored.add(medicine);
    _box.put('medicines', stored);
    notifyListeners();
  }
}
