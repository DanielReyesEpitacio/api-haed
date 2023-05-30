<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Feedback;
use Symfony\Component\HttpFoundation\Response;

class FeedbackController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $feedbacks = Feedback::all();
        return response()->json($feedbacks,Response::HTTP_OK);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $feedback = Feedback::find($id);
        return response()->json($feedback,Response::HTTP_OK);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
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

        $options = $request->input("opciones");

        $feedbacks = Feedback::whereIn('opcion_id',$options)->get();

        return response()->json($feedbacks,Response::HTTP_OK);

    }
}
