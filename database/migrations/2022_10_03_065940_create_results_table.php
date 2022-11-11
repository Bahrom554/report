<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateResultsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('results', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('task_id');
            $table->json('task_items');
            $table->unsignedBigInteger('result_type_id');
            $table->unsignedBigInteger('creator');
            $table->json('targets');
            $table->text('description');
            $table->json('files');
            $table->timestamps();
        });
    }


    public function down()
    {
        Schema::dropIfExists('results');
    }
}
