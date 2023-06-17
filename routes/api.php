<?php
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\EvaluacionController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\OpcionController;
use App\Http\Controllers\IntentoController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\RespuestaController;
use App\Http\Controllers\RolController;
use App\Http\Controllers\PreguntaController;

Route::get("evaluaciones",[EvaluacionController::class,'index']);
Route::get("evaluaciones/{id}/all",[EvaluacionController::class,'evaluacionAll']);
Route::get("evaluaciones/{id}/preguntas",[EvaluacionController::class,'evaluacionWithPreguntas']);
Route::get("evaluaciones/{id}/preguntas/opciones",[EvaluacionController::class,'evaluacionWithPreguntasOpciones']);
Route::get("evaluaciones/{id}",[EvaluacionController::class,'show']);



Route::post("auth/register",[AuthController::class,"register"]);
Route::post("auth/login",[AuthController::class,"login"]);

Route::group(['middleware'=>["auth:sanctum"]],function(){
    Route::get("auth/logout",[AuthController::class,"logout"]);
    Route::get("users/intentos",[UserController::class,"intentos"]);
    Route::get("users/info",[UserController::class,"info"]);
    Route::get("users/evaluaciones/respuestas/{intentoId}",[UserController::class,"resultadosEvaluacion"]);
    Route::put("users/update",[UserController::class,"actualizarMiInfo"]);

    Route::post("intentos",[IntentoController::class,"store"]);

    Route::post("respuestas/all",[RespuestaController::class,"storeAnswers"]);

    Route::get("admin/users",[UserController::class,"show"])->middleware('role:3');
    Route::get("admin/users/{id}",[UserController::class,"index"])->middleware('role:3');
    Route::post("admin/users",[UserController::class,"store"])->middleware("role:3");
    Route::put("admin/users/{id}",[UserController::class,"update"])->middleware("role:3");
    Route::delete("admin/users/{id}",[UserController::class,"destroy"])->middleware("role:3");

    Route::get("admin/roles",[RolController::class,"index"])->middleware("role:3");
    Route::get("admin/roles/{id}",[RolController::class,"show"])->middleware("role:3");
    Route::post("admin/roles",[RolController::class,"store"])->middleware("role:3");
    Route::put("admin/roles/{id}",[RolController::class,"update"]);
    Route::delete("admin/roles/{id}",[RolController::class,"destroy"])->middleware("role:3");

    Route::get("admin/evaluaciones",[EvaluacionController::class,"index"])->middleware("role:3");
    Route::get("admin/evaluaciones/{id}",[EvaluacionController::class,"show"])->middleware("role:3");
    Route::post("admin/evaluaciones",[EvaluacionController::class,'store'])->middleware("role:3");
    Route::put("admin/evaluaciones/{id}",[EvaluacionController::class,"update"])->middleware("role:3");
    Route::delete("admin/evaluaciones/{id}",[EvaluacionController::class,"destroy"]);

    Route::get("admin/preguntas",[PreguntaController::class,"index"])->middleware("role:3");
    Route::get("admin/preguntas/{id}",[PreguntaController::class,"show"])->middleware("role:3");
    Route::post("admin/preguntas",[PreguntaController::class,"store"])->middleware("role:3");
    Route::post("admin/preguntas/store-batch",[PreguntaController::class,"storeBatch"])->middleware("role:3");
    Route::put("admin/preguntas/{id}",[PreguntaController::class,"update"])->middleware("role:3");
    Route::delete("admin/preguntas/{id}",[PreguntaController::class,"destroy"])->middleware("role:3");

    Route::get("admin/opciones",[OpcionController::class,"index"])->middleware("role:3");
    Route::post("admin/opciones",[OpcionController::class,"store"])->middleware("role:3");
    Route::post("admin/opciones/store-batch",[OpcionController::class,"storeBatch"])->middleware("role:3");
    //Route::put("admin/opciones/{id}",[OpcionController::class,"update"])->middleware("role:3");
    //Route::delete("admin/opciones/{id}",[OpcionController::class,"destroy"])->middleware("role:3");
});

//Route::get("admin/users",[UserController::class,"show"])->middleware(['auth','role:3']);

