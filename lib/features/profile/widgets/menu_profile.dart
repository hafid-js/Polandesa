import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polandesa/features/profile/edit_profile.dart';
import 'package:polandesa/features/profile/setting_profile.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuProfile extends StatelessWidget {
  final Map<String, String> item;

  void openPrivacyPolicy() async {
    final Uri url = Uri.parse("https://laporgub.jatengprov.go.id/privacy");

    if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
      throw 'Could not launch $url';
    }
  }

  void termsAndConditions() async {
    final Uri url = Uri.parse(
      "https://lakon.jatengprov.go.id/ketentuan-pengguna",
    );

    if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
      throw 'Could not launch $url';
    }
  }

  const MenuProfile({super.key, required this.item});

  void _handleTap() {
    if (item['name'] == 'Informasi Pribadi') {
      Get.to(() => EditProfileScreen());
    } else if (item['name'] == 'Pengaturan Akun') {
      Get.to(() => SettingProfileScreen());
    } else if (item['name'] == 'Kebijakan Privasi') {
      openPrivacyPolicy();
    } else if (item['name'] == 'Syarat & Ketentuan') {
      termsAndConditions();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: _handleTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(item['icon']!, height: 25, width: 25),
                  const SizedBox(width: 10),
                  Text(
                    item['name']!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  if (item['name'] == "Rating Aplikasi") const Text("v1.0.0"),
                  const SizedBox(width: 16),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 22,
                    color: Colors.blue.withAlpha(90),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        if (item['name'] != "Rating Aplikasi")
          Divider(color: Colors.grey[350], thickness: 1),
        const SizedBox(height: 18),
      ],
    );
  }
}
