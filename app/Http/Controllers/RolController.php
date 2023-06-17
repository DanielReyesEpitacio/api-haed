<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Rol;
use Symfony\Component\HttpFoundation\Response;

class RolController extends Controller
{

    public function index()
    {
        $roles=Rol::all();
        return response()->json($roles,Response::HTTP_OK);
    }

    public function store(Request $request)
    {
        $request->validate([
            "rol"=>"required|unique:roles,rol",
        ]);

        $rol=new Rol($request->all());
        $rol->save();

        return response()->json($rol,Response::HTTP_CREATED);
    }

    public function show($id)
    {
        $rol=Rol::findOrFail($id);
        return response()->json($rol,Response::HTTP_OK);
    }


    public function update(Request $request, $id)
    {
        $rol=Rol::findOrFail($id);
        $data=$request->only(["rol","descripcion"]);
        $rol->fill($data);
        $rol->save();
        return response()->json($rol,Response::HTTP_OK);
    }


    public function destroy($id)
    {
        $rol=Rol::findOrFail($id);
        $rol->delete();
        return response()->json([
            "message"=>"Registro Eliminado"
        ],Response::HTTP_OK);
    }
}
