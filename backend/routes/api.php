<?php


use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\CartController;
use App\Http\Controllers\Api\CommentController;

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::group(['namespace' => 'Api', 'prefix' => 'v1'], function () {
    // Authentication routes
    Route::post('login', [\App\Http\Controllers\Api\AuthenticationController::class, 'login']);
    Route::post('logout', [\App\Http\Controllers\Api\AuthenticationController::class, 'destroy'])->middleware('auth:api');
    Route::post('register', [\App\Http\Controllers\Api\AuthenticationController::class, 'register']);
    Route::post('updateprofile', [\App\Http\Controllers\Api\ProfileController::class, 'updateProfile'])->middleware('auth:api');
    Route::post('forgot-password', [\App\Http\Controllers\Api\AuthenticationController::class, 'forgotPassword']);
    Route::post('reset-password', [\App\Http\Controllers\Api\AuthenticationController::class, 'resetPassword']);

    // Product routes
    Route::get('products', [\App\Http\Controllers\Api\ProductController::class, 'getAllProduct']);
    Route::get('products/{id}', [\App\Http\Controllers\Api\ProductController::class, 'show']);

    Route::group(['prefix' => 'cart'], function () {
        Route::post('/add', [App\Http\Controllers\Api\CartController::class, 'addToCart']);
        Route::get('/', [App\Http\Controllers\Api\CartController::class, 'getCart']);
        Route::put('/{cartItemId}', [App\Http\Controllers\Api\CartController::class, 'updateCartItem']);
        Route::delete('/cart/{cartItemId}', [App\Http\Controllers\Api\CartController::class, 'removeCartItem']);
    });

    // Comment routes
    Route::get('comments', [\App\Http\Controllers\Api\CommentController::class, 'index']);
    Route::post('comments', [\App\Http\Controllers\Api\CommentController::class, 'store']);
    Route::put('comments/{id}', [\App\Http\Controllers\Api\CommentController::class, 'update']);
    Route::delete('comments/{id}', [\App\Http\Controllers\Api\CommentController::class, 'destroy']);
    Route::get('comments/product/{productId}', [\App\Http\Controllers\Api\CommentController::class, 'getByProduct']);


    //Orders routes
    Route::post('/order', [\App\Http\Controllers\Api\OrderController::class, 'store']);
    Route::get('/orders', [\App\Http\Controllers\Api\OrderController::class, 'index']);
    // Route::get('/orders', [\App\Http\Controllers\Api\OrderController::class, 'getOrders']);

    // Hoặc sử dụng Resource Route (ngắn gọn hơn)
    // Route::apiResource('comments', \App\Http\Controllers\Api\CommentController::class);
    // Route::get('comments/product/{productId}', [\App\Http\Controllers\Api\CommentController::class, 'getByProduct']);
});