<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Unit extends Model
{
    public $timestamps = false;
    protected $fillable = ['name'];
    public function materials()
    {
        return $this->hasMany(Material::class);
    }
}
