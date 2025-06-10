<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Material extends Model
{
    public $timestamps = false;
    protected $fillable = [
        'name', 'material_type_id', 'price', 'quantity', 'minQuantity',
        'packageQuantity', 'unit_id'
    ];
    public function materialType()
    {
        return $this->belongsTo(MaterialType::class);
    }
    public function unit()
    {
        return $this->belongsTo(Unit::class);
    }
    public function productMaterials()
    {
        return $this->hasMany(ProductMaterial::class);
    }
}
