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
            $table->unsignedBigInteger('task_item_id')->nullable();
            $table->unsignedBigInteger('result_type_id')->nullable();
            $table->unsignedBigInteger('creator');
            $table->unsignedBigInteger('target_id')->nullable();
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
