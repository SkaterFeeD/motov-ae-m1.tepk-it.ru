<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProductType extends Model
{
    public $timestamps = false;
    protected $fillable = ['name', 'coefficient'];
    public function products()
    {
        return $this->hasMany(Product::class);
    }
}
