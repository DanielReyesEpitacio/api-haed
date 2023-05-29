<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Feedback extends Model
{
    use HasFactory;
    protected $table = 'feedbacks';
    public $timestamps = false;
    public $fillable = [
        'opcion_id',
        'feedback'
    ];

    public $hidden = [
        'opcion_id'
    ];

    public function opcion(){
        return $this->belongsTo(Opcion::class);
    }
}
