import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:grapegrow_apps/core/component/build_context_ext.dart';
import 'package:grapegrow_apps/core/component/buttons.dart';
import 'package:grapegrow_apps/core/component/custom_input_field.dart';
import 'package:grapegrow_apps/core/component/description_input.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';
import 'package:grapegrow_apps/data/models/maps/map_model.dart';
import 'package:grapegrow_apps/data/models/request/update_sebaran_hama.dart';
import 'package:grapegrow_apps/data/models/responses/sebaran/add_sebaran_hama_response.dart';
import 'package:grapegrow_apps/presentation/sebaran_hama/bloc/add_map_hama/add_map_hama_bloc.dart';
import 'package:grapegrow_apps/presentation/sebaran_hama/bloc/update_sebaran_hama/update_sebaran_hama_bloc.dart';
import 'package:grapegrow_apps/presentation/sebaran_hama/pages/add_map_hama.dart';
import 'package:grapegrow_apps/presentation/sebaran_hama/pages/sebaran_hama_page.dart';

class UpdateHamaSebaran extends StatefulWidget {
  final SebaranHama data;

  const UpdateHamaSebaran({
    super.key,
    required this.data,
  });

  @override
  State<UpdateHamaSebaran> createState() => _UpdateHamaSebaranState();
}

class _UpdateHamaSebaranState extends State<UpdateHamaSebaran> {
  final String fontPoppins = 'FontPoppins';

  final _namaController = TextEditingController();
  final _gejalaController = TextEditingController();
  final _solusiController = TextEditingController();
  final _alamatController = TextEditingController();
  MapModel? _mapModel;

  @override
  void dispose() {
    _namaController.dispose();
    _gejalaController.dispose();
    _solusiController.dispose();
    _alamatController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    context.read<AddMapHamaBloc>().add(const AddMapHamaEvent.getCurrentPosition());

    _namaController.text = widget.data.nama;
    _gejalaController.text = widget.data.gejala;
    _solusiController.text = widget.data.solusi;
    _alamatController.text = getAddressFromLatLong(widget.data.lat, widget.data.lon).toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Update Data Sebaran Hama',
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
                label: "Nama Jenis Penyakit Atau Hama?",
                controller: _namaController,
                toggleObscureText: null,
                labelText: "Nama Penyakit Atau Hama",
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 12.0),
              DescriptionInput(
                label: "Cara Penyelesainnya?",
                controller: _solusiController,
              ),
              const SizedBox(height: 12.0),
              DescriptionInput(
                label: "Gejala Yang Dialami?",
                controller: _gejalaController,
              ),
              const SizedBox(height: 12.0),
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
              const SizedBox(height: 12.0),
              BlocConsumer<AddMapHamaBloc, AddMapHamaState>(
                listener: (context, state) {
                  state.maybeMap(
                    orElse: () => _alamatController,
                    loaded: (data) {
                      _mapModel = data.data;
                      _alamatController.text = data.data.address;
                    }
                  );
                },
                builder: (context, state) {
                  state.maybeMap(
                    orElse: () {},
                    loading: (data) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  );
                  return Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: TextField(
                          controller: _alamatController,
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
                      const SizedBox(width: 4.0),
                      Expanded(
                        flex: 2,
                        child: ElevatedButton(
                          onPressed: () async {
                            await context.push(AddMapHama(
                              lat: _mapModel!.latLng.latitude,
                              lon: _mapModel!.latLng.longitude,
                            ));
                            setState(() {});
                          },
                          child: const FittedBox(child: Text('Cari\nLocation')),
                        ),
                      ),
                    ],
                  );
                }
              ),
              const SizedBox(height: 40.0),
              BlocConsumer<UpdateSebaranHamaBloc, UpdateSebaranHamaState>(
                listener: (context, state) {
                  state.maybeWhen(
                    orElse: () {},
                    success: (data) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Update Sebaran Hama Berhasil",
                            style: TextStyle(
                              color: AppColors.white
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
                        ),
                      );
                    }
                  );
                },
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return Button.filled(
                        onPressed: () {
                          final updateHamaRequest = UpdateSebaranHama(
                            nama: _namaController.text,
                            solusi: _solusiController.text,
                            gejala: _gejalaController.text,
                            lat: _mapModel!.latLng.latitude,
                            lon: _mapModel!.latLng.longitude,
                          );

                          context
                              .read<UpdateSebaranHamaBloc>()
                              .add(UpdateSebaranHamaEvent.updateSebaranHama(updateHamaRequest, widget.data.id));
                        },
                        label: "Update",
                      );
                    },
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      )
                  );
                }
              ),
              const SizedBox(height: 12.0),
              Button.outlined(
                onPressed: () {
                  context.pushReplacement(const SebaranHamaPage());
                },
                label: "Batalkan",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getAddressFromLatLong(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks[0];
        String address = '${placemark.street}, ${placemark.subLocality}, ${placemark.postalCode}, ${placemark.country}';
        _alamatController.text = address;
      }
    } catch (e) {
      print('Error getting address: $e');
    }
  }
}