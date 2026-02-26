import 'package:polandesa/features/complaint/complaint.dart';
import 'package:polandesa/features/event/event.dart';
import 'package:polandesa/features/article/list_article.dart';

final List<Map<String, dynamic>> menuCategories = [
  {
    "title": "Layanan Masyarakat",
    "items": [
      {
        "icon": "assets/icons/aduan-masyarakat.png",
        "title": "Aduan",
        "subtitle": "Salurkan keluhan seputar layanan publik",
        "route": () => ComplaintScreen(),
      },
      {
        "icon": "assets/icons/pajak-kendaraan.png",
        "title": "Pajak Kendaraan",
        "subtitle": "Cek dan bayar pajak kendaraan dengan mudah",
        "route": () => ListArticleScreen(),
      },
      {
        "icon": "assets/icons/pajak-kendaraan.png",
        "title": "Layanan Dukcapil",
        "subtitle": "Urus dokumen kependudukan secara online",
        "route": () => ListArticleScreen(),
      },
    ],
  },
  {
    "title": "Karier dan Usaha",
    "items": [
      {
        "icon": "assets/icons/aduan-masyarakat.png",
        "title": "Bursa Kerja",
        "subtitle": "Temukan lowongan pekerjaan di Jawa Tengah",
        "route": () => ListArticleScreen(),
      },
      {
        "icon": "assets/icons/zilenial-jateng.png",
        "title": "Zilenial Jateng",
        "subtitle": "Ruang kolaborasi kreatif anak muda Jateng",
        "route": () => ListArticleScreen(),
      },
    ],
  },
  {
    "title": "Kesehatan",
    "items": [
      {
        "icon": "assets/icons/antrean-faskes.png",
        "title": "Antrean Faskes",
        "subtitle": "Daftar antrean fakses tanpa harus datang",
        "route": () => ListArticleScreen(),
      },
      {
        "icon": "assets/icons/zilenial-jateng.png",
        "title": "Ambulans",
        "subtitle": "Daftar ambulans terdekat",
        "route": () => ListArticleScreen(),
      },
    ],
  },
  {
    "title": "Transportasi",
    "items": [
      {
        "icon": "assets/icons/antrean-faskes.png",
        "title": "Trans Jateng",
        "subtitle": "Info rute dan jadwal Bus Trans Jateng",
        "route": () => ListArticleScreen(),
      },
      {
        "icon": "assets/icons/zilenial-jateng.png",
        "title": "SPKLU Terdekat",
        "subtitle": "Info SPKLU di Jawa tengah",
        "route": () => ListArticleScreen(),
      },
    ],
  },
  {
    "title": "Informasi Publik",
    "items": [
      {
        "icon": "assets/icons/event-jateng.png",
        "title": "Event",
        "subtitle": "Jadwal acara dan kegiatan di Jawa Tengah",
        "route": () => EventScreen(),
      },
      {
        "icon": "assets/icons/zilenial-jateng.png",
        "title": "Berita",
        "subtitle": "Update berita dan info penting seputar Jawa Tengah",
        "route": () => ListArticleScreen(),
      },
    ],
  },
];