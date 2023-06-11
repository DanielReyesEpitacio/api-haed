<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Respuesta extends Model
{
    use HasFactory;
    public $timestamps=false;
    public $fillable=["intento_id","evaluacion_id","opcion_id"];
    public $hidden=[];


    public function intento(){
        return $this->belongsTo(Intento::class);
    }

    //public function evaluacion(){
    //    return $this->belongsTo(Evaluacion::class); //evaluacion_id
    //}

    public function opcion(){
        return $this->belongsTo(Opcion::class,); //opcion_id
    }

    public function pregunta()
    {
        return $this->belongsTo(Pregunta::class, 'pregunta_id');
    }

}
