import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:grapegrow_apps/core/component/build_context_ext.dart';
import 'package:grapegrow_apps/core/component/buttons.dart';
import 'package:grapegrow_apps/core/component/custom_input_field.dart';
import 'package:grapegrow_apps/core/component/description_input.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';
import 'package:grapegrow_apps/data/models/maps/map_model.dart';
import 'package:grapegrow_apps/data/models/request/update_sebaran_varietas.dart';
import 'package:grapegrow_apps/data/models/responses/sebaran/add_sebaran_varietas_response.dart';
import 'package:grapegrow_apps/presentation/sebaran_varietas/bloc/add_map_varietas/add_map_varietas_bloc.dart';
import 'package:grapegrow_apps/presentation/sebaran_varietas/bloc/update_sebaran_varietas/update_sebaran_varietas_bloc.dart';
import 'package:grapegrow_apps/presentation/sebaran_varietas/pages/add_map_varietas.dart';
import 'package:grapegrow_apps/presentation/sebaran_varietas/pages/sebaran_varietas_page.dart';

class UpdateVarietasSebaran extends StatefulWidget {
  final SebaranVarietas data;

  const UpdateVarietasSebaran({
    super.key,
    required this.data,
  });

  @override
  State<UpdateVarietasSebaran> createState() => _UpdateVarietasSebaranState();
}

class _UpdateVarietasSebaranState extends State<UpdateVarietasSebaran> {
  final fontPoppins = 'FontPoppins';

  final _namaController = TextEditingController();
  final _jumlahTanamanController = TextEditingController();
  final _deskripsiController = TextEditingController();
  final _alamatController = TextEditingController();
  bool _selectedValue = false;
  MapModel? _mapModel;

  @override
  void dispose() {
    _namaController.dispose();
    _jumlahTanamanController.dispose();
    _deskripsiController.dispose();
    _alamatController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    context.read<AddMapVarietasBloc>().add(const AddMapVarietasEvent.getCurrentPosition());

    _namaController.text = widget.data.nama;
    _jumlahTanamanController.text = widget.data.jumlahTanaman;
    _deskripsiController.text = widget.data.deskripsi;
    _selectedValue = widget.data.jualBibit == "1";
    _alamatController.text = getAddressFromLatLong(widget.data.lat, widget.data.lon).toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Update Data Sebaran Varietas',
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
                controller: _namaController,
                toggleObscureText: null,
                labelText: 'Nama Varietas Anggur',
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 12.0),
              CustomInputField(
                label: 'Jumlah Pohon Anggur ?',
                controller: _jumlahTanamanController,
                toggleObscureText: null,
                labelText: 'Jumlah Pohon Anggur',
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 12.0),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Apakah Jual Bibit?'),
                value: _selectedValue ? 'Iya' : 'Tidak',
                items: const [
                  DropdownMenuItem(value: 'Iya', child: Text('Iya')),
                  DropdownMenuItem(value: 'Tidak', child: Text('Tidak')),
                ],
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedValue = newValue == 'Iya';
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Harap pilih apakah menjual bibit atau tidak';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12.0),
              DescriptionInput(
                label: 'Tuliskan Deskripsi',
                controller: _deskripsiController,
              ),
              const SizedBox(height: 12.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Alamat',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: fontPoppins,
                  ),
                ),
              ),
              const SizedBox(height: 12.0),
              BlocConsumer<AddMapVarietasBloc, AddMapVarietasState>(
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
                            )
                          ),
                        ),
                      ),
                      const SizedBox(width: 4.0),
                      Expanded(
                        flex: 2,
                        child: ElevatedButton(
                          onPressed: () async {
                            await context.push(
                              AddMapVarietas(
                                lat: _mapModel!.latLng.latitude,
                                lon: _mapModel!.latLng.longitude,
                              ),
                            );
                            setState(() {});
                          },
                          child: const FittedBox(child: Text('Cari\nLocation')),
                        ),
                      ),
                    ],
                  );
                }
              ),
              const SizedBox(height: 12.0),
              BlocConsumer<UpdateSebaranVarietasBloc, UpdateSebaranVarietasState>(
                listener: (context, state) {
                  state.maybeWhen(
                    orElse: () {},
                    success: (data) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Memperbarui Data Sebaran Berhasil",
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
                          final updateVarietasRequest = UpdateSebaranVarietas(
                            nama: _namaController.text,
                            deskripsi: _deskripsiController.text,
                            jumlahTanaman: _jumlahTanamanController.text,
                            lat: _mapModel!.latLng.latitude,
                            lon: _mapModel!.latLng.longitude,
                          );

                          updateVarietasRequest.setJualBibit(_selectedValue);

                          context
                              .read<UpdateSebaranVarietasBloc>()
                              .add(UpdateSebaranVarietasEvent.updateSebaran(updateVarietasRequest, widget.data.id));
                        },
                        label: "Update",
                      );
                    },
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    )
                  );
                },
              ),
              const SizedBox(height: 12.0),
              Button.outlined(
                onPressed: () {
                  context.pushReplacement(const SebaranVarietasPage());
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