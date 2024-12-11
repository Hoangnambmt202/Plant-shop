<?php
namespace App\Http\Controllers\Api;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Order;
use App\Models\OrderProduct;
use App\Models\Product;

class OrderController extends Controller
{
    public function index(Request $request)
    {
        $user = Auth::user();

        if (! $user)
        {
            return response()->json(['message' => 'Không tìm thấy người dùng'], 401);
        }

        try
        {
            $orders = Order::where('user_id', $user->id)
                ->with('orderDetails.product')
                ->orderBy('created_at', 'desc')
                ->get();

            return response()->json(['orders' => $orders]);

        } catch (\Exception $e)
        {
            return response()->json(['error' => $e->getMessage()]);
        }
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'name'             => 'required|string',
            'phone'            => 'required|string',
            'shipping_address' => 'required|string',
            'payment_method'   => 'required|string',
            'total_amount'     => 'required|numeric',
            'cart'             => 'required|array', // Giỏ hàng là một mảng sản phẩm
        ]);


        // Tạo đơn hàng
        $order = Order::create([
            'name'             => $validated['name'],
            'phone'            => $validated['phone'],
            'shipping_address' => $validated['shipping_address'],
            'payment_method'   => $validated['payment_method'],
            'total_amount'     => $validated['total_amount'],
        ]);

        // Thêm sản phẩm vào đơn hàng
        foreach ($validated['cart'] as $cartItem)
        {
            $product = Product::find($cartItem['id']);

            if (! $product)
            {
                return response()->json(['error' => 'Product not found', 'product_id' => $cartItem['id']], 404);
            }

            // Thêm mục đơn hàng
            OrderProduct::create([
                'order_id'   => $order->id, // ID đơn hàng
                'product_id' => $product->id,
                'quantity'   => $cartItem['quantity'],
                'price'      => $product->price,
            ]);
        }

        return response()->json(['success' => true, 'order' => $order], 200);
    }
    public function getOrders(Request $request)
    {
        // Xác thực người dùng (Passport)
        $user = $request->user();

        // Lấy danh sách đơn hàng của user
        $orders = Order::where('user_id', $user->id)->get();

        // Trả về kết quả
        return response()->json([
            'success' => true,
            'orders'  => $orders,
        ]);
    }
}