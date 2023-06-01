<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\EvaluacionController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\FeedbackController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/


Route::get('evaluaciones',[EvaluacionController::class,'index']);
Route::get('evaluaciones/{id}/all',[EvaluacionController::class,'evaluacionAll']);
Route::get('evaluaciones/{id}/preguntas',[EvaluacionController::class,'evaluacionWithPreguntas']);
Route::get('evaluaciones/{id}/preguntas/opciones',[EvaluacionController::class,'evaluacionWithPreguntasOpciones']);
Route::get('evaluaciones/{id}',[EvaluacionController::class,'show']);
Route::post('evaluaciones',[EvaluacionController::class,'store']);

Route::get('feedbacks',[FeedbackController::class,'index']);

Route::get('feedbacks/{id}',[FeedbackController::class,'show']);
Route::get('feedbacks/opcion/{opcionId}',[FeedbackController::class,'getFeedback']); 
Route::post('feedbacks',[FeedbackController::class,'store']);
Route::post('feedbacks/opcion/all',[FeedbackController::class,'getFeedbacks']); //Recibe un conjunto de id de opciones {id_opciones:[1,2,3]}

Route::post("auth/register",[AuthController::class,"register"]);
Route::post("auth/login",[AuthController::class,"login"]);
Route::group(['middleware'=>["auth:sanctum"]],function(){
    Route::get("user-profile",[AuthController::class,"userProfile"]);
    Route::get("auth/logout",[AuthController::class,"logout"]);
    
});