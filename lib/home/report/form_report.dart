import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:polandesa/utils/constants/colors.dart';
import 'package:polandesa/utils/constants/helpers/hex_color.dart';

enum Groceries { pickles, tomato, lettuce }

class FormReportScreen extends StatefulWidget {
  const FormReportScreen({super.key});

  @override
  State<FormReportScreen> createState() => _FormReportScreenState();
}

class _FormReportScreenState extends State<FormReportScreen> {
  Groceries? _selected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leadingWidth: 56,
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 14, top: 10, right: 14),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Foto",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(width: 6),
                  Text(
                    "Maks.3",
                    style: TextStyle(color: UColors.darkerGrey, fontSize: 10),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Container(
                    height: 130,
                    width: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: HexColor.fromHex("#4158D0").withAlpha(40),
                    ),
                    child: Icon(
                      Icons.camera_alt_rounded,
                      size: 40,
                      color: HexColor.fromHex("#4158D0"),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Lokasi Laporan",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {},
                    child: TextFormField(
                      focusNode: FocusNode(),
                      decoration: InputDecoration(
                        labelText: "Pilih Kabupaten/Kota",
                        labelStyle: TextStyle(fontSize: 12),
                      ),
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(16),
                            ),
                          ),
                          builder: (context) {
                            return Container(
                              height: 400,
                              padding: EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    behavior: HitTestBehavior.translucent,
                                    onTap: () {},
                                    child: TextFormField(
                                      focusNode: FocusNode(),
                                      decoration: InputDecoration(
                                        labelText:
                                            "Cari Lokasi (Kabupaten/Kota/Kecamatan/Kelurahan)",
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  Expanded(
                                    child: ListView(
                                      children: [
                                        Image.asset(
                                          "assets/images/data-kosong.png",
                                          height: 150,
                                          width: 150,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),

              SizedBox(height: 18),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Rincian Laporan",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(width: 6),
                      Text(
                        "Minimal 50 Karakter",
                        style: TextStyle(
                          color: UColors.darkerGrey,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),

                  TextFormField(
                    maxLines: null,
                    minLines: 8,
                    expands: false,

                    decoration: InputDecoration(
                      labelText: "Rincian Laporan",
                      labelStyle: TextStyle(fontSize: 14),
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 12,
                      ),
                    ),
                  ),

                  SizedBox(height: 8),
                  Text(
                    "Sertakan waktu kejadian dan detail yang diperlukan",
                    style: TextStyle(fontSize: 14, color: UColors.darkGrey),
                  ),

                  SizedBox(height: 20),
                  Text(
                    "Jenis Privasi",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8),
                  Card(
                    elevation: 0,
                    margin: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                            border: Border.all(
                              color: Colors.grey.shade300,
                              width: 0.5,
                            ),
                          ),
                          child: IntrinsicHeight(
                            child: Row(
                              children: [
                                Expanded(
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
                                                return Colors.green;
                                              }
                                              return Colors.grey;
                                            }),
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        'Privat (Rahasia)',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),

                                VerticalDivider(
                                  width: 1,
                                  thickness: 1,
                                  color: Colors.grey.shade300,
                                ),

                                Expanded(
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
                                                return Colors.green;
                                              }
                                              return Colors.grey;
                                            }),
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        'Publik',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: HexColor.fromHex("#f7f8fb"),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16),
                            ),
                            border: Border.all(
                              color: Colors.grey.shade300,
                              width: 0.5,
                            ),
                          ),

                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.only(
                            left: 12,
                            right: 12,
                            top: 18,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.lock_outline_rounded,
                                color: HexColor.fromHex(
                                  "#4158D0",
                                ).withAlpha(100),
                                size: 30,
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Aduan Privat (Rahasia)",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: UColors.dark,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "Aduan hanya dapat diakses olehmu sebagai pelapor dan petugas yang melakukan tindak lanjut. Aduan privat tidak akan terlihat oleh pengguna lain",
                                      style: TextStyle(
                                        color: UColors.darkGrey,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              SizedBox(
                width: 400,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(65, 88, 208, 1.0),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    "Kirim Laporan",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
