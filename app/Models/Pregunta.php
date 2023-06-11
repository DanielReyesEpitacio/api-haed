<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pregunta extends Model
{
    use HasFactory;
    protected $table= 'preguntas';
    public $timestamps = false;
    public $fillable = [
        'evaluacion_id',
        'pregunta'
    ];

    public $hidden = [
        'evaluacion_id'
    ];

    public function evaluacion(){
        return $this->belongsTo(Evaluacion::class);
    }

    public function opciones(){
        return $this->hasMany(Opcion::class);
    }

    public function respuestas(){
        return $this->hasMany(Respuesta::class);
    }
}
