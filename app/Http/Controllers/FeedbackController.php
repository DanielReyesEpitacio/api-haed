<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Feedback;
use Symfony\Component\HttpFoundation\Response;

class FeedbackController extends Controller
{

    public function index()
    {
        $feedbacks = Feedback::all();
        return response()->json($feedbacks,Response::HTTP_OK);
    }

    public function store(Request $request)
    {
        $request->validate([
            "opcion_id"=>"required",
            "feedback"=>"required"
        ]);

        $feedback=new Feedback();
        $feedback->opcion_id=$request->opcion_id;
        $feedback->feedback=$request->feedback;
        $feedback->save();

        return response()->json($feedback,Response::HTTP_CREATED);
    }

    public function show($id)
    {
        $feedback = Feedback::find($id);
        return response()->json($feedback,Response::HTTP_OK);
    }

    public function update(Request $request, $id)
    {
        //
    }

    public function destroy($id)
    {
        //
    }

    public function getFeedback($opcionId){
        $feedback = Feedback::where('opcion_id',$opcionId)->first();

            return response()->json($feedback,Response::HTTP_OK);

    }

    public function getFeedbacks(Request $request){

        $request->validate([
            "opciones"=>"required|array",
            "opciones.*"=>"integer"
        ]);

        $options = $request->opciones;

        $feedbacks = Feedback::whereIn('opcion_id',$options)->get();

        return response()->json($feedbacks,Response::HTTP_OK);
    }
}
