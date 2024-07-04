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
import 'package:grapegrow_apps/data/models/request/sebaran_varietas_request.dart';
import 'package:grapegrow_apps/presentation/sebaran_varietas/bloc/add_map_varietas/add_map_varietas_bloc.dart';
import 'package:grapegrow_apps/presentation/sebaran_varietas/bloc/add_sebaran_varietas/add_sebaran_varietas_bloc.dart';
import 'package:grapegrow_apps/presentation/sebaran_varietas/pages/add_map_varietas.dart';
import 'package:grapegrow_apps/presentation/sebaran_varietas/pages/sebaran_varietas_page.dart';

class AddVarietasSebaran extends StatefulWidget {
  const AddVarietasSebaran({super.key});

  @override
  State<AddVarietasSebaran> createState() => _AddVarietasSebaranState();
}

class _AddVarietasSebaranState extends State<AddVarietasSebaran> {
  final fontPoppins = 'FontPoppins';

  final namaController = TextEditingController();
  final jumlahTanamanController = TextEditingController();
  final deskripsiController = TextEditingController();
  final alamatController = TextEditingController();
  bool _selectedValue = false;
  MapModel? mapModel;
  File? imageFile;

  @override
  void initState() {
    context
        .read<AddMapVarietasBloc>()
        .add(const AddMapVarietasEvent.getCurrentPosition());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tambahkan Varietas Di Map',
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
                label: 'Varietas Anggur ?',
                controller: namaController,
                toggleObscureText: null,
                labelText: 'Nama varietas anggur',
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 12),
              CustomInputField(
                label: 'Jumlah Pohon Anggur ?',
                controller: jumlahTanamanController,
                toggleObscureText: null,
                labelText: 'Jumlah Pohon Anggur',
                textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>( // Use DropdownButtonFormField for better form integration
                decoration: const InputDecoration(labelText: 'Apakah Jual Bibit?'),
                value: _selectedValue ? 'Iya' : 'Tidak', // Use _isSellingSeedlings for value
                items: const [
                  DropdownMenuItem(value: 'Iya', child: Text('Iya')),
                  DropdownMenuItem(value: 'Tidak', child: Text('Tidak')),
                ],
                onChanged: (String? newValue) { // Type is now bool? to handle null
                  setState(() {
                    _selectedValue = newValue == 'Iya';
                  });
                },
                validator: (value) { // Add validation (optional)
                  if (value == null) {
                    return 'Harap pilih apakah menjual bibit atau tidak';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              DescriptionInput(
                label: 'Tuliskan Deskripsi',
                controller: deskripsiController,
              ),
              const SizedBox(height: 12),
              ImageInput(
                label: 'Masukan Gambar',
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
                    fontWeight: FontWeight.w500,
                    fontFamily: fontPoppins,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              BlocConsumer<AddMapVarietasBloc, AddMapVarietasState>(
                listener: (context, state) {
                  state.maybeMap(
                      orElse: () =>
                          alamatController.text = "Location Not Found",
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
                    },
                  );
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
                            await context.push(AddMapVarietas(
                              lat: mapModel!.latLng.latitude,
                              lon: mapModel!.latLng.longitude,
                            ));
                            setState(() {});
                          },
                          child: const FittedBox(
                            child: Text('Change\nLocation'),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 40),
              BlocConsumer<AddSebaranVarietasBloc, AddSebaranVarietasState>(
                listener: (context, state) {
                  state.maybeWhen(
                    orElse: () {},
                    success: (data) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Menambahkan Sebaran Varietas Berhasil",
                            style: TextStyle(
                              color: AppColors.white,
                            ),
                          ),
                          backgroundColor: AppColors.primary,
                        ),
                      );
                      context.pushReplacement(const SebaranVarietasPage());
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
                          final addVarietas = SebaranVarietasRequest(
                            nama: namaController.text,
                            deskripsi: deskripsiController.text,
                            jumlahTanaman: jumlahTanamanController.text,
                            lat: mapModel!.latLng.latitude,
                            lon: mapModel!.latLng.longitude,
                            gambar: imageFile!,
                          );

                          addVarietas.setJualBibit(_selectedValue);

                          context
                            .read<AddSebaranVarietasBloc>()
                            .add(AddSebaranVarietasEvent.addSebaranVarietas(addVarietas));
                        },
                        label: "Tambahkan",
                      );
                    },
                    loading: () =>const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 12),
              Button.outlined(
                onPressed: () {},
                label: 'Batalkan',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
