<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Intento extends Model
{
    use HasFactory;

    protected $primaryKey = ["user_id","evaluacion_id","uuid"];
    public $incrementing = false;
    public $timestamps = false;
    public $fillable = [
        "user_id",
        "evaluacion_id",
        "fecha"
    ];

    public $hidden=[];

    public function usuario(){
        return $this->belongsTo(User::class,"user_id");
    }

    public function evaluacion(){
        return $this->belongsTo(Evaluacion::class,"evaluacion_id");
    }

    public function resultados(){
        return $this->hasMany(Resultado::class);
    }
}
