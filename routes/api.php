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

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('evaluaciones',[EvaluacionController::class,'index']);
Route::get('evaluaciones/{id}/all',[EvaluacionController::class,'evaluacion']);
Route::get('evaluaciones/{id}',[EvaluacionController::class,'show']);
Route::get('evaluacione/{id}',[EvaluacionController::class,'test']);
Route::post('evaluaciones',[EvaluacionController::class,'store']);

Route::get('feedbacks',[FeedbackController::class,'index']);
Route::get('feedbacks/{id}',[FeedbackController::class,'show']);
Route::get('feedbacks/opcion/{opcionId}',[FeedbackController::class,'getFeedback']); 
Route::post('feedbacks/opcion/all',[FeedbackController::class,'getFeedbacks']); //Recibe un conjunto de id de opciones {id_opciones:[1,2,3]}

Route::post("register",[AuthController::class,"register"]);
Route::post("login",[AuthController::class,"login"]);
Route::group(['middleware'=>["auth:sanctum"]],function(){
    Route::get("user-profile",[AuthController::class,"userProfile"]);
    Route::get("logout",[AuthController::class,"logout"]);
    
});