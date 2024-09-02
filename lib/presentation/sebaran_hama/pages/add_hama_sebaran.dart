import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grapegrow_apps/core/component/build_context_ext.dart';
import 'package:grapegrow_apps/core/component/buttons.dart';
import 'package:grapegrow_apps/core/component/custom_input_field.dart';
import 'package:grapegrow_apps/core/component/description_input.dart';
import 'package:grapegrow_apps/core/component/image_input.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';
import 'package:grapegrow_apps/data/models/maps/map_model.dart';
import 'package:grapegrow_apps/data/models/request/sebaran_hama_request.dart';
import 'package:grapegrow_apps/presentation/sebaran_hama/bloc/add_map_hama/add_map_hama_bloc.dart';
import 'package:grapegrow_apps/presentation/sebaran_hama/bloc/add_sebaran_hama/add_sebaran_hama_bloc.dart';
import 'package:grapegrow_apps/presentation/sebaran_hama/pages/add_map_hama.dart';
import 'package:grapegrow_apps/presentation/sebaran_hama/pages/sebaran_hama_page.dart';

class AddHamaSebaran extends StatefulWidget {
  const AddHamaSebaran({super.key});

  @override
  State<AddHamaSebaran> createState() => _AddHamaMapSebaranState();
}

class _AddHamaMapSebaranState extends State<AddHamaSebaran> {
  final String fontPoppins = 'FontPoppins';

  final namaController = TextEditingController();
  final gejalaController = TextEditingController();
  final solusiController = TextEditingController();
  final alamatController = TextEditingController();
  MapModel? mapModel;
  File? imageFile;

  @override
  void initState() {
    context
        .read<AddMapHamaBloc>()
        .add(const AddMapHamaEvent.getCurrentPosition());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tambahkan Hama Di Map',
          style: TextStyle(
            fontSize: 16,
            fontFamily: fontPoppins,
            fontWeight: FontWeight.w500,
            color: AppColors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        iconTheme: const IconThemeData(color: AppColors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              CustomInputField(
                label: 'Nama Jenis Penyakit Atau Hama ?',
                controller: namaController,
                toggleObscureText: null,
                labelText: 'Nama Penyakit Atau Hama',
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 12),
              DescriptionInput(
                label: 'Cara Penyelesainnya ?',
                controller: solusiController,
              ),
              const SizedBox(height: 12),
              DescriptionInput(
                label: 'Gejala Yang Dialami ?',
                controller: gejalaController,
              ),
              const SizedBox(height: 12),
              ImageInput(
                label: 'Masukan Bukti Foto',
                onImageSelected: (File? file) {
                  imageFile = file;
                },
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Alamat",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: fontPoppins,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              BlocConsumer<AddMapHamaBloc, AddMapHamaState>(
                listener: (context, state) {
                  state.maybeMap(
                      orElse: () => alamatController.text = "Location Not Found",
                      loaded: (data) {
                        mapModel = data.data;
                        alamatController.text = data.data.address;
                      });
                },
                builder: (context, state) {
                  state.maybeMap(
                      orElse: () {},
                      loading: (data) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      });
                  return Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: TextField(
                          controller: alamatController,
                          maxLines: 2,
                          enabled: false,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Alamat",
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 16,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        flex: 2,
                        child: ElevatedButton(
                          onPressed: () async {
                            await context.push(AddMapHama(
                              lat: mapModel!.latLng.latitude,
                              lon: mapModel!.latLng.longitude,
                            ));
                            setState(() {});
                          },
                          child: const FittedBox(child: Text('Change\nLocation')),
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 40),
              BlocConsumer<AddSebaranHamaBloc, AddSebaranHamaState>(
                listener: (context, state) {
                  state.maybeWhen(
                    orElse: () {},
                    success: (data) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Menambahkan Sebaran Hama Berhasil",
                            style: TextStyle(
                              color: AppColors.white,
                            ),
                          ),
                          backgroundColor: AppColors.primary,
                        ),
                      );
                      context.pushReplacement(const SebaranHamaPage());
                    },
                    error: (message) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(message),
                          backgroundColor: Colors.redAccent,
                        )
                      );
                    }
                  );
                },
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return Button.filled(
                        onPressed: () {
                          final addHamaRequest = SebaranHamaRequest(
                            nama: namaController.text,
                            gejala: gejalaController.text,
                            solusi: solusiController.text,
                            lat: mapModel!.latLng.latitude,
                            lon: mapModel!.latLng.longitude,
                            gambar: imageFile!,
                          );

                          context
                            .read<AddSebaranHamaBloc>()
                            .add(AddSebaranHamaEvent.addSebaran(addHamaRequest));
                        },
                        label: "Tambahkan",
                      );
                    },
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    )
                  );
                },
              ),
              const SizedBox(height: 12),
              Button.outlined(
                onPressed: () {
                  context.pushReplacement(const SebaranHamaPage());
                },
                label: 'Batalkan',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
