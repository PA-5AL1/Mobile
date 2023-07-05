import 'package:croix_rouge_storage_manager_mobile/src/constants/colors.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/icons.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/text_strings.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/authentication/controllers/authentication_controller.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/core/product/controllers/barcode_scanner_controller.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/core/product/screens/product/product_category_screen.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/core/product/screens/scanner/scanner_screen.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/core/product/screens/storage/storage_screen.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/core/profile/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 1;

  setCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthenticationController());
    final barCodeController = Get.put(BarCodeScannerController());

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
          Text(tProducts),
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
        ProductCategoryScreen(),
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
        items: [
          buildBottomNavigationBarItem(
            IconButton(
              onPressed: barCodeController.scanBarcode,
              icon: const Icon(tBarcodeIcon),
            ),
            tScanner,
          ),
          buildBottomNavigationBarItem(const Icon(tHomeIcon), tHome),
          buildBottomNavigationBarItem(const Icon(tProductsIcon), tProducts),
          buildBottomNavigationBarItem(const Icon(tSettingsIcon), tProfile),
        ],
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(
    Widget icon,
    String label,
  ) {
    return BottomNavigationBarItem(
      icon: icon,
      label: label,
    );
  }
}
