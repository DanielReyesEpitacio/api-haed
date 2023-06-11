<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Respuesta;
use Symfony\Component\HttpFoundation\Response;

class RespuestaController extends Controller
{

    protected $intentoController;

    public function __construct(IntentoController $intentoController){
        $this->intentoController=$intentoController;
    }

    public function store(Request $request){
        $request-> validate([
            "intento_id"=>"required"
        ]);
    }
    public function storeAnswers(Request $request){
        $request->validate([
            'respuestas' => 'required|array',
            'respuestas.*.pregunta_id' => 'required|exists:preguntas,id',
            'respuestas.*.respuesta' => 'required|string',
        ]);
        $response = $this->intentoController->store($request);
        $intento=$response->getData();
        $respuestas = $request->respuestas;
        $respuestasFinales=array();
        foreach($respuestas as $datosRespuesta){
            $respuesta=new Respuesta();
            $respuesta->intento_id=$intento->id;
            $respuesta->pregunta_id=$datosRespuesta["pregunta_id"];
            $respuesta->respuesta=$datosRespuesta["respuesta"];
            $respuesta->save();
            $respuestasFinales[]=$respuesta;
        }
        return response()->json($respuestasFinales,Response::HTTP_CREATED);

    }
}
