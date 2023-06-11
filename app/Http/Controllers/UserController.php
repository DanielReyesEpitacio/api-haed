<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Intento;
use App\Models\Evaluacion;
use App\Models\Respuesta;
use App\Models\Opcion;
use Symfony\Component\HttpFoundation\Response;

class UserController extends Controller
{

    public function intentos(){
        $user=auth()->user();
        return response()->json($user->intentos,Response::HTTP_OK);
    }

    public function info(){
        $user=auth()->user();
        return response()->json($user,Response::HTTP_OK);
    }

    public function resultadosEvaluacion($intentoId){

        $intento=Intento::where("user_id",auth()->user()->id)->findOrFail($intentoId);
        $intentoId=$intento->id;
        $evaluacionId=$intento->evaluacion_id;

        $evaluacion= Evaluacion::with(['preguntas.respuestas' => function ($query) use ($intentoId) {
            $query->where('intento_id', $intentoId);
        },])->find($evaluacionId);

        foreach ($evaluacion->preguntas as $pregunta) {
            foreach ($pregunta->respuestas as $respuesta) {
                $feedback = Opcion::where("pregunta_id", $respuesta->pregunta_id)
                    ->where("opcion", $respuesta->respuesta)
                    ->get()->first()->feedback;
        
                $respuesta->feedback = $feedback;
            }
        }

        return response()->json($evaluacion,Response::HTTP_OK);

    }
}
