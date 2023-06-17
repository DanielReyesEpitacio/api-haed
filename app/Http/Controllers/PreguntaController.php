<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Pregunta;
use Symfony\Component\HttpFoundation\Response;

class PreguntaController extends Controller
{

    public function index()
    {
        $preguntas=Pregunta::all();
        return response()->json($preguntas,Response::HTTP_OK);
    }

    public function store(Request $request)
    {
        $request->validate([
            "evaluacion_id"=>"required|integer|exists:evaluaciones,id",
            "pregunta"=>"required"
        ]);

        $pregunta=new Pregunta();
        $pregunta->evaluacion_id=$request->evaluacion_id;
        $pregunta->pregunta=$request->pregunta;
        $pregunta->save();

        return response()->json($pregunta,Response::HTTP_CREATED);
    }

    public function storeBatch(Request $request)
    {
        $request->validate([
            "preguntas" => "required|array", // Cambio en la validación: ahora esperamos un arreglo de preguntas
            "preguntas.*.evaluacion_id" => "required|integer|exists:evaluaciones,id",
            "preguntas.*.pregunta" => "required"
        ]);
    
        $preguntas = [];
    
        foreach ($request->preguntas as $preguntaData) {
            $pregunta = new Pregunta();
            $pregunta->evaluacion_id = $preguntaData['evaluacion_id'];
            $pregunta->pregunta = $preguntaData['pregunta'];
            $pregunta->save();
        
            $preguntas[] = $pregunta;
        }
    
        return response()->json($preguntas, Response::HTTP_CREATED);
    }

    public function show($id)
    {
        $pregunta=Pregunta::findOrFail($id);
        return response()->json($pregunta, Response::HTTP_OK);
    }


    public function update(Request $request, $id)
    {
        $pregunta=Pregunta::findOrFail($id);
        $request->validate([
            "evaluacion_id"=>"integer|exists:evaluaciones,id"
        ]);
        $data=$request->only(["pregunta", "evaluacion_id"]);
        $pregunta->fill($data);
        $pregunta->save();

        return response()->json($pregunta,Response::HTTP_OK);
    }


    public function destroy($id)
    {
        $pregunta=Pregunta::findOrFail($id);
        $pregunta->delete();
        return response()->json([
            "message"=>"Registro eliminado"
        ],Response::HTTP_OK);
    }
}
