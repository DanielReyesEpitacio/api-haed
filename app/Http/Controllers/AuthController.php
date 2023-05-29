<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Symfony\Component\HttpFoundation\Response;
class AuthController extends Controller
{
    public function register(Request $request){
        $request->validate(
            [
                "nombres"=>"required",
                "apellidos"=>"required",
                "email"=>"required|email|unique:users",
                "matricula"=>"required|unique:users",
                "password"=>"required|confirmed",

            ]
        );
        
        $user = new User();
        $user->nombres=$request->nombres;
        $user->apellidos=$request->apellidos;
        $user->email=$request->email;
        $user->matricula=$request->matricula;
        $user->password=Hash::make($request->password);
        $user->save();

        return response()->json([
            $user
        ],Response::HTTP_CREATED);
    }
    public function login(Request $request){
        $request->validate([
            "email"=>"required|email",
            "password"=>"required"
        ]);

        $user = User::where("email",$request->email)->first();
        if(isset($user->id)){
            if(Hash::check($request->password,$user->password)){
                //Creacion del token
                $token= $user->createToken("auth_token")->plainTextToken;
                return response()->json([
                    "data"=>$user,
                    "token"=>$token
                ],Response::HTTP_ACCEPTED);
            }else{
                return response()->json([
                    "message"=>"Contraseña no válida"
                ],Response::HTTP_NOT_ACCEPTABLE);
            }
        }else {
            return response()->json([
                "message"=>"Usuario no encontrado"
            ],Response::HTTP_NOT_FOUND);
        }
    }

    public function userProfile(){

        return response()->json(auth()->user(),Response::HTTP_OK);
    }

    public function logout(){
        auth()->user()->tokens()->delete();
        return response()->json([
            "message"=>"Sesion cerrada exitosamente"
        ],Response::HTTP_OK);
    }

}
