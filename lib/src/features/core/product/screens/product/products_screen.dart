import 'package:cached_network_image/cached_network_image.dart';
import 'package:croix_rouge_storage_manager_mobile/src/common_widgets/screen/loading_result_error_widget.dart';
import 'package:croix_rouge_storage_manager_mobile/src/common_widgets/screen/loading_result_widget.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/icons.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/sizes.dart';
import 'package:croix_rouge_storage_manager_mobile/src/constants/text_strings.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/core/product/controllers/storage_product_controller.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/core/product/models/storage_product_model.dart';
import 'package:croix_rouge_storage_manager_mobile/src/features/core/product/screens/product/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key, required this.category}) : super(key: key);
  final String category;

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  final storageProductController = Get.put(StorageProductController());

  late Future<List<StorageProductModel>> _products;
  int _currentSortColumn = 0;
  bool _isSortAsc = true;

  @override
  initState() {
    super.initState();
    _products = getProducts();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _refreshIndicatorKey.currentState?.show());
  }

  Future<List<StorageProductModel>> getProducts() async {
    return await storageProductController
        .getProductsByCategory(widget.category);
  }

  Future<void> _refresh() async {
    setState(() {
      _products = getProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: _refresh,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(tArrowLeftIcon),
            onPressed: () => Get.back(),
          ),
          title: Text(
            widget.category,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: FutureBuilder<List<StorageProductModel>>(
              future: _products,
              builder: (BuildContext context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    List<StorageProductModel> products = snapshot.data!;
                    if (products!.isEmpty) {
                      return const Center(
                        child: Text(tNoProducts),
                      );
                    }
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: _createDataTable(products!),
                    );
                  } else if (snapshot.hasError) {
                    return const LoadingResultErrorWidget();
                  } else {
                    return const LoadingResultErrorWidget();
                  }
                } else {
                  return const LoadingResultWidget();
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  DataTable _createDataTable(List<StorageProductModel> products) {
    return DataTable(
      columns: _createColumns(),
      rows: _createRows(products),
      sortColumnIndex: _currentSortColumn,
      sortAscending: _isSortAsc,
    );
  }

  List<DataColumn> _createColumns() {
    return [
      DataColumn(
        label: const Text('Nom'),
        onSort: (columnIndex, _) {
          setState(() {
            _currentSortColumn = columnIndex;
            if (_isSortAsc) {
              _products.then(
                (value) => value.sort(
                  (a, b) => b.name.compareTo(a.name),
                ),
              );
            } else {
              _products.then(
                (value) => value.sort(
                  (a, b) => a.name.compareTo(b.name),
                ),
              );
            }
            _isSortAsc = !_isSortAsc;
          });
        },
      ),
      const DataColumn(
        label: Text('Image'),
      ),
      const DataColumn(label: Text('Marque')),
      const DataColumn(label: Text('Quantité')),
      const DataColumn(label: Text('Catégorie')),
      const DataColumn(label: Text('Date de péremption')),
      const DataColumn(label: Text('Actions')),
    ];
  }

  List<DataRow> _createRows(List<StorageProductModel> products) {
    return products.map((product) {
      return DataRow(
          onLongPress: () => Get.to(() => ProductScreen(
                product: product,
              )),
          cells: [
            DataCell(Text(product.name)),
            DataCell(
              CachedNetworkImage(
                imageUrl: product.image,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                height: tDatatableImageSize,
                width: tDatatableImageSize,
              ),
            ),
            DataCell(Text(product.brand)),
            DataCell(Text(product.quantity.toString())),
            DataCell(Text(product.category)),
            DataCell(Text(product.expirationDate.toString())),
            DataCell(
              IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Center(child: Text(tDelete)),
                        content: const Text(tShowDialogWarningDeleteProduct),
                        actionsAlignment: MainAxisAlignment.spaceEvenly,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(tDefaultSize),
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              storageProductController
                                  .deleteProduct(product.barcode);
                              Get.back();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  duration: Duration(milliseconds: 500),
                                  content: Center(
                                    child: Text(tSnackBarRemoveProduct),
                                  ),
                                ),
                              );
                            },
                            child: const Text(tDelete),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: const Text(tCancel),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ]);
    }).toList();
  }
}
