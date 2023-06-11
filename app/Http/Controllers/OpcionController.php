<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Opcion;
use App\Models\Intento;
use App\Models\Respuesta;

class OpcionController extends Controller
{
    public function index()
    {
        //
    }

    public function store(Request $request)
    {
        //
    }

    public function show($id)
    {
        //
    }

    public function update(Request $request, $id)
    {
        //
    }

    public function destroy($id)
    {
        //
    }

    public function getFeedbacks($evaluacion_id,Request $request){

        $data = $request->all();
        $ids = array_keys($data); // Obtener los IDs del array
    
        $opciones = Opcion::whereIn('pregunta_id', $ids)
                          ->get();
    
        $opcionesFiltradas = [];

        if(count($opciones)>0){
            $intento=new Intento();
            $usuario_id= auth()->user()->id;
            $intento->evaluacion_id=$evaluacion_id;
            $intento->usuario_id=$usuario_id;
            $intento->save();

            foreach($data as $pregunta_id => $option){
                $respuesta=new Respuesta();
                $respuesta->intento_id=$intento->id;
                $respuesta->pregunta_id=$pregunta_id;
                $respuesta->respuesta=$option;
                $respuesta->save();
            }
        }
    
        foreach ($opciones as $opcion) {
            $opcionId = $opcion->pregunta_id;
    
            if (isset($data[$opcionId]) && $opcion->opcion === $data[$opcionId]) {
                $opcionesFiltradas[] = $opcion;
            }
        }
       
        return response()->json($opcionesFiltradas);
    }
}
