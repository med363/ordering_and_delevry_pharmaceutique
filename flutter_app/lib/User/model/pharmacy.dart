class Medication {
  final int id;
  final String name;
  final bool availability;

  Medication({required this.id, required this.name, required this.availability});
}

class Pharmacy {
  final int id;
  final String name;
  final String address;
  final Map<String, double> location;
  final List<Medication> medications;

  Pharmacy({
    required this.id,
    required this.name,
    required this.address,
    required this.location,
    required this.medications,
  });
}

final List<Pharmacy> pharmacies = [
  Pharmacy(
    id: 1,
    name: "Pharmacy Santé Plus",
    address: "123 Rue de la Santé, 75001 Paris, France",
    location: {"latitude": 48.8566, "longitude": 2.3522},
    medications: [
      Medication(id: 101, name: "Paracetamol", availability: true),
      Medication(id: 102, name: "Ibuprofen", availability: true),
      Medication(id: 103, name: "Loratadine", availability: false),
    ],
  ),
  Pharmacy(
    id: 2,
    name: "Pharmacie Bien-Être",
    address: "456 Avenue du Bonheur, 75002 Paris, France",
    location: {"latitude": 48.864716, "longitude": 2.349014},
    medications: [
      Medication(id: 104, name: "Aspirin", availability: true),
      Medication(id: 105, name: "Cetirizine", availability: true),
      Medication(id: 106, name: "Omeprazole", availability: true),
    ],
  ),
  Pharmacy(
    id: 3,
    name: "Pharmacie Rapide Médicaments",
    address: "789 Boulevard de la Rapidité, 75003 Paris, France",
    location: {"latitude": 48.8719, "longitude": 2.3966},
    medications: [
      Medication(id: 107, name: "Amoxicillin", availability: false),
      Medication(id: 108, name: "Simvastatin", availability: true),
      Medication(id: 109, name: "Metformin", availability: false),
    ],
  ),
  Pharmacy(
    id: 4,
    name: "Pharmacie de la Place",
    address: "10 Place de la Liberté, 75004 Paris, France",
    location: {"latitude": 48.8575, "longitude": 2.3524},
    medications: [
      Medication(id: 110, name: "Antacid", availability: true),
      Medication(id: 111, name: "Antibiotic Cream", availability: true),
      Medication(id: 112, name: "Eye Drops", availability: true),
    ],
  ),
];
