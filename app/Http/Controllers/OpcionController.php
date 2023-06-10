<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Opcion;

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

    public function getFeedbacks(Request $request){

        $data = $request->all();
        $ids = array_keys($data); // Obtener los IDs del array
    
        $opciones = Opcion::whereIn('pregunta_id', $ids)
                          ->get();
    
        $opcionesFiltradas = [];
    
        foreach ($opciones as $opcion) {
            $opcionId = $opcion->pregunta_id;
    
            if (isset($data[$opcionId]) && $opcion->opcion === $data[$opcionId]) {
                $opcionesFiltradas[] = $opcion;
            }
        }
    
        // Haz algo con las opciones filtradas
    
        return response()->json($opcionesFiltradas);
    }
}
