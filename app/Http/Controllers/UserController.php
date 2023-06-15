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
        
                $respuesta->feedback = $feedback; // modificar a $feedback != null ? $feedback:"NA"
            }
        }

        return response()->json($evaluacion,Response::HTTP_OK);

    }

    public function actualizarMiInfo(Request $request){

        $user=User::find(auth()->user()->id);
        $data=$request->only(["nombres","apellidos","centro_trabajo","password","sexo","edad"]);
        $user->fill($data);
        $user->save();
        return response()->json($user,Response::HTTP_OK);
    }

    public function show(){
        return response()->json(User::all(),Response::HTTP_OK);
    }

    public function index($id){
        $user=User::findOrFail($id);
        return response()->json($user,Response::HTTP_OK);
    }

    public function store(Request $request){
        $request->validate([
            "rol_id"=>"required|integer|exists:roles,id",
            "nombres"=>"required",
            "apellidos"=>"required",
            "email"=>"required|email|unique:users",
            "matricula"=>"required|unique:users",
            "password"=>"required|confirmed",

        ]);

        $user=new User($request->all());
        $user->save();
        return response()->json($user,Response::HTTP_CREATED);
    }

    public function update(Request $request, $id){
        
        $user=User::findOrFail($id);
        $data=$request->only(["rol_id","nombres","apellidos","centro_trabajo","password","sexo","edad"]);
        $user->fill($data);
        $user->save();
        return response()->json($user,Response::HTTP_OK);
    }

    public function destroy($id){
        $user=User::findOrFail($id);
        $user->delete();
        return response()->json([
            "message"=>"Registro eliminado",
        ],Response::HTTP_OK);
    }
}
