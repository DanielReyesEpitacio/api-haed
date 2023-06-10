<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Evaluacion;
use App\Models\Pregunta;
use Symfony\Component\HttpFoundation\Response;

class EvaluacionController extends Controller
{
    
    public function index()
    {
        return response()->json(Evaluacion::all(),Response::HTTP_OK);
    }

    //devuelve la evaluacion con el id especificado y todas sus preguntas y feedbacks
    public function evaluacionAll($id){
        $evaluacion = Evaluacion::with('preguntas.opciones')->find($id);
        return response()->json($evaluacion,Response::HTTP_OK);
    }

    public function evaluacionWithPreguntas($id){
        $evaluacion = Evaluacion::with('preguntas')->find($id);
        return response()->json($evaluacion,Response::HTTP_OK);
    }

    public function evaluacionWithPreguntasOpciones($id){
        $evaluacion = Evaluacion::with('preguntas.opciones')->find($id);
        return response()->json($evaluacion,Response::HTTP_OK);
    }

    public function store(Request $request)
    {
        $request->validate([
            'titulo'=>'required',
        ]);

        $evaluacion=new Evaluacion();
        $evaluacion->titulo = $request->titulo;
        $evaluacion->descripcion = $request->descripcion;
        $evaluacion->save();
        return response()->json($evaluacion,Response::HTTP_CREATED);
    }


    public function show($id)
    {
        $evaluacion = Evaluacion::findOrFail($id);
        return response()->json($evaluacion,Response::HTTP_OK);
         
    }


    public function update(Request $request, $id)
    {
        //
    }


    public function destroy($id)
    {
        
    }
}
