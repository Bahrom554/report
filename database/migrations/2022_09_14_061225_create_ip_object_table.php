<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateIpObjectTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('ip_object', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('ip_id');
            $table->unsignedBigInteger('object_id');
            $table->foreign('ip_id')->references('id')->on('ips')
                ->onDelete('cascade');
            $table->foreign('object_id')->references('id')->on('objects')
                ->onDelete('cascade');
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
        Schema::dropIfExists('ip_object');
    }
}
