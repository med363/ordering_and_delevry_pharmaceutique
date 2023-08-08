class Category {
  const Category(this.icon, this.title, this.id);

  final String icon;
  final String title;
  final String id;
}

final homeCaktegries = <Category>[
  const Category('assets/icons/med.png', 'Medecin', 'medecin'),
  const Category('assets/icons/pharmacie.png', 'Pharmacie', 'pharmacie'),
  const Category('assets/icons/medicament.png', 'Medicament','medicament'),
  const Category('assets/icons/question.png', 'Question', 'question'),
  const Category('assets/icons/magasine.png', 'Magazine', 'Magazine'),
  const Category('assets/icons/category_others@2x.png', 'Others', 'other'),
];
