<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTasksTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tasks', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->date('start');
            $table->date('deadline');
            $table->string('definition')->nullable();
            $table->unsignedBigInteger('creator');
            $table->json('assigned');
            $table->json('assigned_role')->nullable();
            $table->json('files')->nullable();
            $table->unsignedBigInteger('object_id')->nullable();
            $table->unsignedBigInteger('country_id')->nullable();
            $table->foreign('creator')->references('id')->on('users')->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tasks');
    }
}
