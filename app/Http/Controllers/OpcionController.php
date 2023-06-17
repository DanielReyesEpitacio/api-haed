<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Opcion;
use App\Models\Intento;
use App\Models\Respuesta;
use Symfony\Component\HttpFoundation\Response;

class OpcionController extends Controller
{
    public function index()
    {
        return response()->json(Opcion::all(),Response::HTTP_OK);
    }

    public function store(Request $request)
    {
        $request->validate([
            "pregunta_id"=>"required|integer|exists:preguntas,id",
            "opcion"=>"required",
            "feedback"=>"required"
        ]);

        $opcion=new Opcion();
        $opcion->pregunta_id=$request->pregunta_id;
        $opcion->opcion=$request->opcion;
        $opcion->feedback=$request->feedback;
        $opcion->save();

        return response()->json($opcion,Response::HTTP_CREATED);
    }

    public function storeBatch(Request $request)
    {
        $request->validate([
            "opciones" => "required|array", // Cambio en la validación: ahora esperamos un arreglo de preguntas
            "opciones.*.pregunta_id" => "required|integer|exists:preguntas,id",
            "preguntas.*.opcion" => "required",
            "preguntas.*.feedback"=>"required"
        ]);
    
        $opciones = [];
    
        foreach ($request->opciones as $opcionData) {
            $opcion = new Opcion();
            $opcion->pregunta_id = $opcionData['pregunta_id'];
            $opcion->opcion = $opcionData['opcion'];
            $opcion->feedback=$opcionData["feedback"];
            $opcion->save();
        
            $opciones[] = $opcion;
        }
    
        return response()->json($opciones, Response::HTTP_CREATED);
    }

    /*
    public function update(Request $request, $id)
    {
        $opcion=Opcion::findOrFail($id);
        $request->validate([
            "pregunta_id"=>"integer|exists:preguntas,id"
        ]);
        $data=$request->only(["pregunta_id","opcion","feedback"]);
        $opcion->fill($data);
        $opcion->save();
        return response()->json($opcion,Response::HTTP_OK);
    }

    public function destroy($id)
    {
        $opcion=Opcion::findOrFail($id);
        $opcion->delete();
        return response()->json([
            "message"=>"Registro eliminado"
        ],Response::HTTP_OK);
    }
    */
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
