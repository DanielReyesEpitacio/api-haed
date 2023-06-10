<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Opcion extends Model
{
    use HasFactory;
    protected $table = 'opciones';
    public $timestamps = false;
    public $fillable = [
        'pregunta_id',
        'opcion',
        'feedback'
    ];

    public $hidden = [
        
    ];

    public function pregunta(){
        return $this->belongsTo(Pregunta::class);
    }

}
