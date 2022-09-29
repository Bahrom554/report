<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTargetsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('targets', function (Blueprint $table) {
            $table->id();
            $table->string('name',512)->index()->unique();
            $table->unsignedBigInteger('type_id')->nullable();
            $table->unsignedBigInteger('object_type_id')->nullable();
            $table->unsignedBigInteger('object_id')->nullable();
            $table->unsignedBigInteger('parent_id')->nullable();
            $table->unsignedBigInteger('country_id')->nullable();
            $table->foreign('type_id')->references('id')->on('target_types')->onDelete('set null');
            $table->foreign('object_type_id')->references('id')->on('object_types')->onDelete('set null');
            $table->foreign('object_id')->references('id')->on('objects')->onDelete('set null');
            $table->foreign('parent_id')->references('id')->on('targets')->onDelete('set null');
            $table->foreign('country_id')->references('id')->on('countries')->onDelete('set null');

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
        Schema::dropIfExists('targets');
    }
}
