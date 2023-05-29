<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Evaluacion extends Model
{
    use HasFactory;
    protected $table = 'evaluaciones';
    public $timestamps = false;
    public $fillable = ['titulo','descripcion'];

    public function preguntas(){
       return $this->hasMany(Pregunta::class);
    }
}
