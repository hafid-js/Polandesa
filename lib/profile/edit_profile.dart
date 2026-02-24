import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:polandesa/common/widgets/images/circular_image.dart';
import 'package:polandesa/home/report/form_report.dart';
import 'package:polandesa/utils/constants/helpers/hex_color.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nikController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  Groceries? _selected;

  @override
  void dispose() {
    _nikController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  final List<String> religionItems = [
    'ISLAM',
    'PROTESTAN',
    'KATHOLIK',
    'HINDU',
    'BUDDHA',
    'KONGHUCU',
  ];

  final List<String> marriedStatus = [
    'BELUM KAWIN',
    'KAWIN',
    'CERAI HIDUP',
    'CERAI MATI',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
          ),
          centerTitle: true,
          title: Text(
            "Ubah Informasi Pribadi",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: TabBar(
            dividerColor: Colors.grey[400],
            dividerHeight: 2,
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            unselectedLabelStyle: TextStyle(
              color: Colors.grey[400],
              fontSize: 14,
            ),
            labelPadding: EdgeInsets.only(bottom: 12, top: 12),
            indicatorColor: HexColor.fromHex("#ff6900"),
            labelColor: HexColor.fromHex("#ff6900"),
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              color: HexColor.fromHex("#ff6900"),
              backgroundBlendMode: BlendMode.color,
            ),
            tabs: [
              Text("Data Profil", style: TextStyle(fontSize: 14)),
              Text("Data Diri", style: TextStyle()),
            ],
          ),
        ),

        body: TabBarView(
          children: [
            // Tab Data Profil
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      UCircularImage(
                        image: "assets/images/profile.jpeg",
                        height: 100,
                        width: 100,
                      ),
                      Positioned(
                        bottom: -14,
                        right: -1,
                        top: 40,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Buat Ubah Foto Profil"),
                                  duration: Duration(seconds: 1),
                                ),
                              );
                            },
                            child: Icon(
                              Icons.camera_alt_rounded,
                              size: 16,
                              color: HexColor.fromHex("#4158D0"),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 25,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Informasi Utama",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          focusNode: FocusNode(),
                          decoration: InputDecoration(
                            labelText: "Nama Lengkap",
                            labelStyle: TextStyle(fontSize: 14),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: HexColor.fromHex("#4158D0"),
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 14),
                        TextFormField(
                          focusNode: FocusNode(),
                          decoration: InputDecoration(
                            labelText: "Email",
                            labelStyle: TextStyle(fontSize: 14),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: HexColor.fromHex("#4158D0"),
                                width: 1,
                              ),
                            ),
                            suffixIcon: Icon(
                              Iconsax.edit,
                              fontWeight: FontWeight.w900,
                              size: 18,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: HexColor.fromHex("#4158D0"),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 14),
                        TextFormField(
                          focusNode: FocusNode(),
                          decoration: InputDecoration(
                            labelText: "Nomor Whatsapp",
                            labelStyle: TextStyle(fontSize: 14),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: HexColor.fromHex("#4158D0"),
                                width: 1,
                              ),
                            ),
                            suffixIcon: Icon(
                              Iconsax.edit,
                              fontWeight: FontWeight.bold,
                              size: 18,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: HexColor.fromHex("#4158D0"),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Tab Data Diri
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Data Diri",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            focusNode: FocusNode(),
                            decoration: InputDecoration(
                              labelText: "Email",
                              labelStyle: TextStyle(fontSize: 14),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: HexColor.fromHex("#4158D0"),
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: HexColor.fromHex("#4158D0"),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 14),
                          TextFormField(
                            focusNode: FocusNode(),
                            decoration: InputDecoration(
                              labelText: "Nama Lengkap",
                              labelStyle: TextStyle(fontSize: 14),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: HexColor.fromHex("#4158D0"),
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: HexColor.fromHex("#4158D0"),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 14),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "Nomor Whatsapp",
                              labelStyle: TextStyle(fontSize: 14),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: HexColor.fromHex("#4158D0"),
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: HexColor.fromHex("#4158D0"),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 14),
                          TextFormField(
                            maxLength: 16,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            focusNode: FocusNode(),
                            decoration: InputDecoration(
                              labelText: "NIK",
                              labelStyle: TextStyle(fontSize: 14),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: HexColor.fromHex("#4158D0"),
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: HexColor.fromHex("#4158D0"),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 20),

                          Text(
                            "Tempat Lahir",
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                          TextFormField(
                            focusNode: FocusNode(),
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: HexColor.fromHex("#4158D0"),
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: HexColor.fromHex("#4158D0"),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: _dateController,
                            decoration: InputDecoration(
                              labelText: "Tanggal Lahir",
                              labelStyle: TextStyle(fontSize: 14),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: HexColor.fromHex("#4158D0"),
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: HexColor.fromHex("#4158D0"),
                                ),
                              ),
                            ),
                            readOnly: true,
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1950),
                                lastDate: DateTime(2100),
                                builder: (BuildContext context, Widget? child) {
                                  return Theme(
                                    data: Theme.of(context).copyWith(
                                      colorScheme: ColorScheme.light(
                                        primary: HexColor.fromHex("#4158D0"),
                                        onPrimary: Colors.white,
                                        onSurface: Colors.black,
                                      ),
                                      textTheme: TextTheme(),
                                      textButtonTheme: TextButtonThemeData(
                                        style: TextButton.styleFrom(
                                          foregroundColor: HexColor.fromHex(
                                            "#4158D0",
                                          ),
                                        ),
                                      ),
                                    ),
                                    child: child!,
                                  );
                                },
                              );

                              if (pickedDate != null) {
                                String formattedDate = DateFormat(
                                  'dd-MM-yyy',
                                ).format(pickedDate);
                                setState(() {
                                  _dateController.text = formattedDate;
                                });
                              } else {}
                            },
                          ),

                          SizedBox(height: 14),
                          Text(
                            "Jenis Kelamin",
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    border: Border.all(
                                      color: HexColor.fromHex("#4158D0"),
                                      width: 1,
                                    ),
                                  ),
                                  child: IntrinsicHeight(
                                    child: Row(
                                      children: [
                                        Radio<Groceries>(
                                          value: Groceries.pickles,
                                          groupValue: _selected,
                                          onChanged: (value) {
                                            setState(() {
                                              _selected = value;
                                            });
                                          },
                                          fillColor:
                                              MaterialStateProperty.resolveWith<
                                                Color
                                              >((states) {
                                                if (states.contains(
                                                  MaterialState.selected,
                                                )) {
                                                  return HexColor.fromHex(
                                                    "#4158D0",
                                                  );
                                                }
                                                return Colors.grey;
                                              }),
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                          'Laki-Laki',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(width: 20),

                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    border: Border.all(
                                      color: HexColor.fromHex("#4158D0"),
                                      width: 1,
                                    ),
                                  ),
                                  child: IntrinsicHeight(
                                    child: Row(
                                      children: [
                                        Radio<Groceries>(
                                          value: Groceries.tomato,
                                          groupValue: _selected,
                                          onChanged: (value) {
                                            setState(() {
                                              _selected = value;
                                            });
                                          },
                                          fillColor:
                                              MaterialStateProperty.resolveWith<
                                                Color
                                              >((states) {
                                                if (states.contains(
                                                  MaterialState.selected,
                                                )) {
                                                  return HexColor.fromHex(
                                                    "#4158D0",
                                                  );
                                                }
                                                return Colors.grey;
                                              }),
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                          'Perempuan',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 14),

                          Form(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                DropdownButtonFormField2<String>(
                                  isExpanded: true,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                    ),
                                    labelText: "Agama",
                                    labelStyle: TextStyle(color: Colors.black),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                        color: HexColor.fromHex("#4158D0"),
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  hint: const Text(
                                    'Pilih Agama',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  items: religionItems
                                      .map(
                                        (item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Silahkan Pilih Agama.';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {},
                                  onSaved: (value) {
                                    selectedValue = value.toString();
                                  },
                                  buttonStyleData: const ButtonStyleData(
                                    padding: EdgeInsets.only(right: 8),
                                  ),
                                  iconStyleData: const IconStyleData(
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black45,
                                    ),
                                    iconSize: 24,
                                  ),
                                  dropdownStyleData: DropdownStyleData(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  menuItemStyleData: const MenuItemStyleData(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 14),

                          Form(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                DropdownButtonFormField2<String>(
                                  isExpanded: true,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                    ),
                                    labelText: "Status Perkawinan",
                                    labelStyle: TextStyle(color: Colors.black),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                        color: HexColor.fromHex("#4158D0"),
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  hint: const Text(
                                    'Pilih Status Perkawinan',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  items: marriedStatus
                                      .map(
                                        (item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Pilih Status Perkawinan';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {},
                                  onSaved: (value) {
                                    selectedValue = value.toString();
                                  },
                                  buttonStyleData: const ButtonStyleData(
                                    padding: EdgeInsets.only(right: 8),
                                  ),
                                  iconStyleData: const IconStyleData(
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black45,
                                    ),
                                    iconSize: 24,
                                  ),
                                  dropdownStyleData: DropdownStyleData(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  menuItemStyleData: const MenuItemStyleData(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 14),

                          Text(
                            "Alamat",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 10),
                          Form(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                DropdownButtonFormField2<String>(
                                  isExpanded: true,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                    ),
                                    labelText: "Provinsi",
                                    labelStyle: TextStyle(color: Colors.black),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                        color: HexColor.fromHex("#4158D0"),
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  hint: const Text(
                                    'Pilih Provinsi',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  items: marriedStatus
                                      .map(
                                        (item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Pilih Provinsi';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {},
                                  onSaved: (value) {
                                    selectedValue = value.toString();
                                  },
                                  buttonStyleData: const ButtonStyleData(
                                    padding: EdgeInsets.only(right: 8),
                                  ),
                                  iconStyleData: const IconStyleData(
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black45,
                                    ),
                                    iconSize: 24,
                                  ),
                                  dropdownStyleData: DropdownStyleData(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  menuItemStyleData: const MenuItemStyleData(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 14),
                          Form(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                DropdownButtonFormField2<String>(
                                  isExpanded: true,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                    ),
                                    labelText: "Kabupaten/Kota",
                                    labelStyle: TextStyle(color: Colors.black),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                        color: HexColor.fromHex("#4158D0"),
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  hint: const Text(
                                    'Pilih Provinsi dahulu',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  items: marriedStatus
                                      .map(
                                        (item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Pilih Provinsi';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {},
                                  onSaved: (value) {
                                    selectedValue = value.toString();
                                  },
                                  buttonStyleData: const ButtonStyleData(
                                    padding: EdgeInsets.only(right: 8),
                                  ),
                                  iconStyleData: const IconStyleData(
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black45,
                                    ),
                                    iconSize: 24,
                                  ),
                                  dropdownStyleData: DropdownStyleData(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  menuItemStyleData: const MenuItemStyleData(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 14),
                          Form(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                DropdownButtonFormField2<String>(
                                  isExpanded: true,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                    ),
                                    labelText: "Kecamatan",
                                    labelStyle: TextStyle(color: Colors.black),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                        color: HexColor.fromHex("#4158D0"),
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  hint: const Text(
                                    'Pilih Kabupaten/Kota dahulu',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  items: marriedStatus
                                      .map(
                                        (item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Pilih Kecamatan';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {},
                                  onSaved: (value) {
                                    selectedValue = value.toString();
                                  },
                                  buttonStyleData: const ButtonStyleData(
                                    padding: EdgeInsets.only(right: 8),
                                  ),
                                  iconStyleData: const IconStyleData(
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black45,
                                    ),
                                    iconSize: 24,
                                  ),
                                  dropdownStyleData: DropdownStyleData(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  menuItemStyleData: const MenuItemStyleData(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 14),
                          Form(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                DropdownButtonFormField2<String>(
                                  isExpanded: true,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                    ),
                                    labelText: "Kelurahan",
                                    labelStyle: TextStyle(color: Colors.black),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                        color: HexColor.fromHex("#4158D0"),
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  hint: const Text(
                                    'Pilih Kecamatan dahulu',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  items: marriedStatus
                                      .map(
                                        (item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Pilih Kelurahan';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {},
                                  onSaved: (value) {
                                    selectedValue = value.toString();
                                  },
                                  buttonStyleData: const ButtonStyleData(
                                    padding: EdgeInsets.only(right: 8),
                                  ),
                                  iconStyleData: const IconStyleData(
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black45,
                                    ),
                                    iconSize: 24,
                                  ),
                                  dropdownStyleData: DropdownStyleData(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  menuItemStyleData: const MenuItemStyleData(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 14),
                          TextFormField(
                            maxLines: null,
                            minLines: 8,
                            expands: false,

                            decoration: InputDecoration(
                              labelText: "Alamat Lengkap",
                              labelStyle: TextStyle(fontSize: 14),
                              alignLabelWithHint: true,
                              enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: HexColor.fromHex("#4158D0"),
                                width: 1,
                              ),
                            ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        bottomNavigationBar: Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 30),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(65, 88, 208, 1),
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text(
              "Simpan",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
