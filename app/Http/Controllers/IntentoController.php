<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Intento;
use Symfony\Component\HttpFoundation\Response;

class IntentoController extends Controller
{

    public function index(){
        $intentos = Intento::all();
        return response()->json($intentos,Response::HTTP_OK);
    }

    public function store(Request $request){
        $request->validate([
            "user_id"=>"required|exists:users,id",
            "evaluacion_id"=>"required|exists:evaluaciones,id"
        ]);

        $intento=new Intento();
        $intento->user_id=$request->usuario_id;
        $intento->evaluacion_id=$request->evaluacion_id;
        $intento->save();

        return response()->json($intento,Response::HTTP_CREATED);
    }


}
