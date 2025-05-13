class ProviderModel {
  final String serialNumber;
  final String providerName;
  final String providerCode;
  final String providerRepresenter;
  final String providerPhoneNumber;
  final String providerAddress;
  final String providerActivity;
  final String providerType;
  final String description;
  final String totalSupplies;

  ProviderModel({
    required this.serialNumber,
    required this.providerName,
    required this.providerCode,
    required this.providerRepresenter,
    required this.providerPhoneNumber,
    required this.providerAddress,
    required this.providerActivity,
    required this.providerType,
    required this.description,
    required this.totalSupplies,
  });
}

List<ProviderModel> providers = [
  ProviderModel(
    serialNumber: '1',
    providerName: 'شركة الأندلس للأقمشة',
    providerCode: '102922',
    providerRepresenter: 'محمد ياسر عرفات',
    providerPhoneNumber: '01100126436',
    providerAddress: '55 الأزبكية شارع محمد حسن المتفرع من شارع الشراباتلي',
    providerActivity: 'خدمات',
    providerType: 'أقمشة',
    description:
        'توريد أقمشة تول و أقمشة نايلون عالية الجودة ومتوسطة الجودة 5 ألوان و...',
    totalSupplies: '1000',
  ),
  ProviderModel(
    serialNumber: '2',
    providerName: 'شركة الحلول الذكية',
    providerCode: '981260',
    providerRepresenter: 'احمد خالد توفيق',
    providerPhoneNumber: '01098267801',
    providerAddress: '55 الأزبكية شارع محمد حسن المتفرع من شارع الصديق',
    providerActivity: 'خدمات',
    providerType: 'زراير',
    description:
        'توريد أقمشة تول و أقمشة نايلون عالية الجودة ومتوسطة الجودة 5 ألوان و...',
    totalSupplies: '1200',
  ),
  ProviderModel(
    serialNumber: '3',
    providerName: 'شركة أبو خاطر',
    providerCode: '981260',
    providerRepresenter: 'خاطر  عبدالله',
    providerPhoneNumber: '01098269901',
    providerAddress: '55 الأزبكية شارع محمد حسن المتفرع من شارع الصديق',
    providerActivity: 'خدمات',
    providerType: 'زراير',
    description:
        'توريد أقمشة تول و أقمشة نايلون عالية الجودة ومتوسطة الجودة 5 ألوان و...',
    totalSupplies: '230',
  ),
];
