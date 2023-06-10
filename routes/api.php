<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\EvaluacionController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\OpcionController;
use App\Http\Controllers\IntentoController;

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

Route::get("feedbacks",[OpcionController::class,"getFeedbacks"]);

Route::post("intentos",[IntentoController::class,"store"]);
Route::get("intentos",[IntentoController::class,"index"]);
Route::get("intentos/{id}",[IntentoController::class,"test"]);

Route::post("auth/register",[AuthController::class,"register"]);
Route::post("auth/login",[AuthController::class,"login"]);
Route::get("user-profile/resultados-evaluacion",[AuthController::class,"ResultadosEvaluacion"]);
Route::group(['middleware'=>["auth:sanctum"]],function(){
    Route::get("user-profile",[AuthController::class,"intentosUser"]);
    Route::get("auth/logout",[AuthController::class,"logout"]);
    
});