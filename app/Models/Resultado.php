<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Resultado extends Model
{
    use HasFactory;
    public $timestamps=false;
    public $fillable=["user_id","evaluacion_id","opcion_id"];
    public $hidden=[];

    public function usuario(){
        return $this->belongsTo(User::class); //user_id
    }

    public function intento(){
        
    }

    public function evaluacion(){
        return $this->belongsTo(Evaluacion::class); //evaluacion_id
    }

    public function opcion(){
        return $this->belongsTo(Opcion::class); //opcion_id
    }

}
