<?php
namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;

use App\Models\CartItem;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CartController extends Controller
{
    public function addToCart(Request $request)
    {


        // Validate đầu vào
        $validated = $request->validate([
            'product_id' => 'required|exists:products,id',
            'quantity'   => 'integer|min:1|max:10',
        ]);

        // Kiểm tra xác thực
        if ($userID == null)
        {
            return response()->json([
                'message'       => 'Chưa đăng nhập',
                'authenticated' => false,
            ], 401);
        }

        try
        {
            $userId = Auth::id();

            // Debug: In ra các thông tin
            \Log::info('Adding to Cart:', [
                'user_id'    => $userId,
                'product_id' => $request->product_id,
                'quantity'   => $request->quantity,
            ]);

            // Tìm hoặc tạo mới item trong giỏ hàng
            $cartItem = CartItem::firstOrCreate(
                [
                    'user_id'    => $userId,
                    'product_id' => $request->product_id,
                ],
                [
                    'quantity' => $request->quantity ?? 1
                ],
            );

            // Nếu item đã tồn tại, cập nhật số lượng
            if (! $cartItem->wasRecentlyCreated)
            {
                $cartItem->increment('quantity', $request->quantity ?? 1);
            }

            return response()->json([
                'message'   => 'Thêm sản phẩm vào giỏ hàng thành công',
                'cart_item' => $cartItem->load('product'),
            ], 201);

        } catch (\Exception $e)
        {
            // Ghi log lỗi chi tiết
            \Log::error('Cart Add Error: ' . $e->getMessage());

            return response()->json([
                'message' => 'Lỗi thêm sản phẩm vào giỏ hàng',
                'error'   => $e->getMessage(),
            ], 500);
        }
    }

    public function getCart()
    {
        $cartItems = CartItem::where('user_id', Auth::id())
            ->with('product')
            ->get();

        return response()->json([
            'cart_items' => $cartItems,
            'total'      => $cartItems->sum(function ($item) {
                return $item->quantity * $item->product->price;
            }),
        ]);
    }

    public function updateCartItem(Request $request, $cartItemId)
    {
        $request->validate([
            'quantity' => 'required|integer|min:1|max:10',
        ]);

        $cartItem = CartItem::where('user_id', Auth::id())
            ->findOrFail($cartItemId);

        $cartItem->update([
            'quantity' => $request->quantity,
        ]);

        return response()->json([
            'message'   => 'Cập nhật giỏ hàng thành công',
            'cart_item' => $cartItem,
        ]);
    }

    public function removeCartItem($cartItemId)
    {
        $cartItem = CartItem::where('user_id', Auth::id())
            ->findOrFail($cartItemId);

        $cartItem->delete();

        return response()->json([
            'message' => 'Xóa sản phẩm khỏi giỏ hàng thành công',
        ]);
    }
}