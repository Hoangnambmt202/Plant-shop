import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/models/product.dart';
import 'package:frontend/providers/cart_provider.dart';
import 'package:frontend/providers/loginProvider.dart';
import 'package:frontend/Services/order_service.dart';

class CheckoutPage extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();

  String _selectedPaymentMethod = 'Thanh toán khi nhận hàng';

  final List<String> _paymentMethods = [
    'Thanh toán khi nhận hàng',
    'Ngân hàng',
    'Momo'
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart =
        ref.watch(cartProvider); // Lấy danh sách sản phẩm từ CartProvider
    final loginProviderState = ref.watch(loginProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Xác nhận thanh toán'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Sản phẩm trong giỏ hàng:',
                  style: TextStyle(fontWeight: FontWeight.bold)),

              // Hiển thị danh sách các sản phẩm
              ...cart.map((product) {
                return ListTile(
                  leading: Image.network(
                    product.photos.isNotEmpty ? product.photos.first : '',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(product.name),
                  subtitle: Text(
                    'Số lượng: ${product.quantity}, Giá: ${product.price} VNĐ',
                  ),
                );
              }).toList(),

              SizedBox(height: 16),

              // Hiển thị tổng số tiền giỏ hàng
              Text(
                'Tổng số tiền: ${ref.watch(cartProvider.notifier).totalAmount} VNĐ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 16),

              // Form nhập thông tin khách hàng
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Họ tên'),
              ),
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(labelText: 'Số điện thoại'),
              ),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(labelText: 'Địa chỉ nhận hàng'),
              ),

              DropdownButtonFormField<String>(
                value: _selectedPaymentMethod,
                items: _paymentMethods.map((method) {
                  return DropdownMenuItem(value: method, child: Text(method));
                }).toList(),
                onChanged: (value) {
                  _selectedPaymentMethod = value!;
                },
              ),

              SizedBox(height: 16),

              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate() && loginProviderState) {
                    final userId = ref.read(userProvider)?.id;
                    final cartNotifier = ref.watch(cartProvider.notifier);

                    // Tạo dữ liệu đơn hàng từ giỏ hàng
                    final orderData = {
                      "user_id": userId,
                      "name": _nameController.text,
                      "phone": _phoneController.text,
                      "shipping_address": _addressController.text,
                      "payment_method": _selectedPaymentMethod,
                      "total_amount": cartNotifier.totalAmount,
                      "products": cart.map((product) {
                        return {
                          "product_id": product.id,
                          "quantity": product.quantity,
                        };
                      }).toList(),
                    };

                    try {
                      final success =
                          await OrderService.createOrder(ref, orderData);

                      if (success) {
                        Navigator.pushNamed(context, '/checkout-success');
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Lỗi: $e')),
                      );
                    }
                  }
                },
                child: Text('Xác nhận thanh toán'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
