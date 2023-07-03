import 'package:croix_rouge_storage_manager_mobile/src/constants/colors.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/icons.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/text_strings.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/authentication/controllers/authentication_controller.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/core/controllers/barcode_scanner_controller.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/core/screens/product/product_screen.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/core/screens/profile/profile_screen.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/core/screens/scanner/scanner_screen.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/core/screens/storage/storage_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 1;
  final scannerController = Get.put(BarCodeScannerController());


  setCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Future<void> scanBarcode() async {
    var barcode = scannerController.scan();
    setState(() {
      print(barcode);
    });
  }

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthenticationController());

    return Scaffold(
      appBar: AppBar(
        leading: [
          const Icon(tBarcodeIcon),
          const Icon(tHomeIcon),
          const Icon(tProductsIcon),
          const Icon(tSettingsIcon),
        ][_currentIndex],
        title: const [
          Text(tScanner),
          Text(tHome),
          Text(tStorage),
          Text(tProfile),
        ][_currentIndex],
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              authController.logoutUser();
            },
            icon: const Icon(tLogoutIcon),
          )
        ],
      ),
      body: const [
        ScannerScreen(),
        StorageScreen(),
        ProductScreen(),
        ProfileScreen(),
      ][_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: tRedCroixRougeColor,
        currentIndex: _currentIndex,
        onTap: (index) => setCurrentIndex(index),
        type: BottomNavigationBarType.fixed,
        elevation: 10,
        iconSize: 32,
        unselectedItemColor: tBlack,
        items:  [
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: scanBarcode,
              icon: const Icon(tBarcodeIcon),
            ),
            label: tScanner,
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              tHomeIcon,
            ),
            label: tHome,
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              tProductsIcon,
            ),
            label: tStorage,
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              tSettingsIcon,
            ),
            label: tProfile,
          ),
        ],
      ),
    );
  }
}
