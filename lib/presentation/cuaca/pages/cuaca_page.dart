import 'package:flutter/material.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';
import 'package:grapegrow_apps/presentation/cuaca/model/model_cuaca.dart';
import 'package:grapegrow_apps/presentation/cuaca/widgets/card_cuaca.dart';
import 'package:grapegrow_apps/presentation/cuaca/widgets/card_list_cuaca.dart';

class CuacaPage extends StatefulWidget {

  const CuacaPage({
    super.key,
  });

  @override
  State<CuacaPage> createState() => _CuacaPageState();
}

class _CuacaPageState extends State<CuacaPage> {
  final String fontPoppins = 'FontPoppins';

  final List<CuacaModel> cuaca = [
    CuacaModel(
      gambarCuaca: 'assets/cuaca/panas.png',
      suhuCuaca: '33°C',
      kondisiCuaca: 'Cerah',
      hari: 'Sabtu',
      tanggal: '13 July 2024'
    ),
    CuacaModel(
        gambarCuaca: 'assets/cuaca/badai.png',
        suhuCuaca: '32°C',
        kondisiCuaca: 'Cerah',
        hari: 'Minggu',
        tanggal: '14 July 2024'
    ),
    CuacaModel(
        gambarCuaca: 'assets/cuaca/hujan.png',
        suhuCuaca: '26°C',
        kondisiCuaca: 'Hujan',
        hari: 'Senin',
        tanggal: '15 July 2024'
    ),
    CuacaModel(
        gambarCuaca: 'assets/cuaca/berawan.png',
        suhuCuaca: '28°C',
        kondisiCuaca: 'Berawan',
        hari: 'Selasa',
        tanggal: '16 July 2024'
    ),
    CuacaModel(
        gambarCuaca: 'assets/cuaca/hujan.png',
        suhuCuaca: '26°C',
        kondisiCuaca: 'Hujan',
        hari: 'Rabu',
        tanggal: '17 July 2024'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Informasi Cuaca",
          style: TextStyle(
            fontSize: 16,
            fontFamily: fontPoppins,
            fontWeight: FontWeight.w500,
            color: AppColors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        iconTheme: const IconThemeData(
          color: AppColors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CardCuaca(),
              const SizedBox(
                height: 12.0,
              ),
              Text(
                "Hari ini cerah berawan",
                style: TextStyle(
                  fontFamily: fontPoppins,
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 4.0,
              ),
              Row(
                children: [
                  Text(
                    "Hari ini tidak baik untuk: ",
                    style: TextStyle(
                      fontFamily: fontPoppins,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    "MEMBERI PESTISIDA",
                    style: TextStyle(
                      fontFamily: fontPoppins,
                      fontWeight: FontWeight.w700,
                      fontSize: 12
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12.0),
              Text(
                "Perkiraan Cuaca 5 Hari Kedepan",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: fontPoppins,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8.0),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: cuaca.length,
                separatorBuilder: (context, index) => const SizedBox(height: 8.0),
                itemBuilder: (context, index) => CardListCuaca(
                    imagePath: cuaca[index].gambarCuaca,
                    suhu: cuaca[index].suhuCuaca,
                    kondisinya: cuaca[index].kondisiCuaca,
                    hari: cuaca[index].hari,
                    tanggal: cuaca[index].tanggal
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}