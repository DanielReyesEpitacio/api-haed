<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Rol extends Model
{
    use HasFactory;

    protected $table="roles";
    public $timestamps=false;
    public $fillable=["rol","descripcion"];
    public $hidden=[];

    public function users(){
        return $this->hasMany(User::class);
    }
}
