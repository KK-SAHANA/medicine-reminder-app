import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/medicine_provider.dart';
import '../models/medicine_model.dart';
import 'add_medicine_screen.dart';
import '../services/alarm_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Medicines')),
      body: Consumer<MedicineProvider>(
        builder: (context, provider, child) {
          final List<Medicine> medicines = provider.medicines;
          AlarmService.start(context, medicines);

          if (medicines.isEmpty) {
            return const Center(
              child: Text(
                'No medicines added yet',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }

          return ListView.builder(
            itemCount: medicines.length,
            itemBuilder: (context, index) {
              final medicine = medicines[index];

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  leading: const Icon(
                    Icons.medical_services,
                    color: Colors.teal,
                  ),
                  title: Text(medicine.name),
                  subtitle: Text(
                    '${medicine.dose} • ${TimeOfDay.fromDateTime(medicine.time).format(context)}',
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddMedicineScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
