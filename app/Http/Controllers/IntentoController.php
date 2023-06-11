<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Intento;
use App\Models\Respuesta;
use App\Models\Evaluacion;
use Symfony\Component\HttpFoundation\Response;

class IntentoController extends Controller
{

    public function index(){
        $intentos = Intento::all();
        return response()->json($intentos,Response::HTTP_OK);
    }

    public function store(Request $request){
        $request->validate([
            "evaluacion_id"=>"required|exists:evaluaciones,id"
        ]);

        $user_id=auth()->user()->id;
        $intento=new Intento();
        $intento->user_id=$user_id;
        $intento->evaluacion_id=$request->evaluacion_id;
        $intento->save();

        return response()->json($intento,Response::HTTP_CREATED);
    }

}
