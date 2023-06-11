<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            //$table->unsignedInteger('id')->primary();
            $table->increments('id');
            $table->unsignedInteger('rol_id')->default(1);
            $table->foreign('rol_id')->references('id')->on('roles')->onDelete('cascade')->onUpdate("cascade");
            $table->string('nombres');
            $table->string('apellidos');
            $table->string('matricula')->unique();
            $table->string('email')->unique();
            $table->string('centro_trabajo')->default('UNIVERSIDAD TECNOLÓGICA DE PUEBLA');
            $table->string('password');
            $table->string('sexo')->nullable();
            $table->integer('edad')->nullable();
            $table->rememberToken();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
}
