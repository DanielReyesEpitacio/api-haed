<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\EvaluacionController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\OpcionController;
use App\Http\Controllers\IntentoController;
use App\Http\Controllers\UserController;

Route::get("evaluaciones",[EvaluacionController::class,'index']);
Route::get("evaluaciones/{id}/all",[EvaluacionController::class,'evaluacionAll']);
Route::get("evaluaciones/{id}/preguntas",[EvaluacionController::class,'evaluacionWithPreguntas']);
Route::get("evaluaciones/{id}/preguntas/opciones",[EvaluacionController::class,'evaluacionWithPreguntasOpciones']);
Route::get("evaluaciones/{id}",[EvaluacionController::class,'show']);
Route::post("evaluaciones",[EvaluacionController::class,'store']);
Route::get("test",[UserController::class,"test"]);

Route::post("auth/register",[AuthController::class,"register"]);
Route::post("auth/login",[AuthController::class,"login"]);

Route::group(['middleware'=>["auth:sanctum"]],function(){
    Route::get("auth/logout",[AuthController::class,"logout"]);
    Route::get("users/intentos",[UserController::class,"intentos"]);
    Route::get("users/info",[UserController::class,"info"]);
    Route::get("users/evaluaciones/respuestas/{intentoId}",[UserController::class,"resultadosEvaluacion"]);

    Route::post("intentos",[IntentoController::class,"store"]);
});

