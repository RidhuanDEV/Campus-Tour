library globals;

int currentindex = 0;
List<int> indexStack = [0];
int kampusindex = 0;
bool ubahtema = false;
List<Map<String, dynamic>> items = [
  {
    'name': 'UNPAM',
    'image': 'assets/unpam.jpg',
    'subtitle': 'Universitas Pamulang',
    'index': 11
  },
  {
    'name': 'ITI',
    'image': 'assets/iti.jpg',
    'subtitle': 'Institut Teknologi Indonesia',
    'index': 12
  },
  {
    'name': 'UI',
    'image': 'assets/ui.jpg',
    'subtitle': 'Universitas Indonesia',
    'index': 13
  },
  {
    'name': 'IPB',
    'image': 'assets/ipb.jpg',
    'subtitle': 'Institut Pertanian Bogor',
    'index': 14
  },
  {
    'name': 'ITB',
    'image': 'assets/itb.jpg',
    'subtitle': 'Institut Teknologi Bandung',
    'index': 15
  },
];
String? profileName;
String? profileID;
String? profileImagePath;