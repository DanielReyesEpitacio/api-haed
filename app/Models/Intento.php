<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Intento extends Model
{
    use HasFactory;
    
    public $timestamps = false;
    public $fillable = [
        "usuario_id",
        "evaluacion_id",
        "fecha"
    ];

    public $hidden=[];

    public function usuario(){
        return $this->belongsTo(User::class);
    }

    public function evaluacion(){
        return $this->belongsTo(Evaluacion::class,);
    }

    public function respuestas(){
        return $this->hasMany(Respuesta::class);
    }
}
