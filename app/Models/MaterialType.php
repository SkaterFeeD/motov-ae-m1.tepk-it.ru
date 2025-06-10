<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MaterialType extends Model
{
    public $timestamps = false;
    protected $fillable = ['name', 'defect'];
    public function materials()
    {
        return $this->hasMany(Material::class);
    }
}
