<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Laravel\Passport\HasApiTokens;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
class CartItem extends Model
{
    protected $table = 'cart_items';
    use HasFactory, HasApiTokens, Notifiable;
    protected $fillable = [
        'user_id',
        'product_id',
        'quantity',
    ];
    public function product()
    {
        return $this->belongsTo(Product::class);
    }
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}