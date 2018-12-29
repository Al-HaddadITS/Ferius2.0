<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateEmployeesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('employees', function (Blueprint $table) {
            $table->increments('id');
            $table->string('EmpID')->nullable();
            $table->string('Fname')->nullable();
            $table->string('Lname')->nullable();
            $table->string('email')->nullable();
            $table->string('dob')->nullable();
            $table->string('gender')->nullable();
            $table->string('pob')->nullable();
            $table->string('nationality')->nullable();
            $table->string('religion')->nullable();
            $table->string('marital')->nullable();
            $table->string('spouseName')->nullable();
            $table->string('ID_no')->nullable();
            $table->string('idExpiry')->nullable();
            $table->string('visaNo')->nullable();
            $table->string('visaExpiry')->nullable();
            $table->string('passportNo')->nullable();
            $table->string('passportIssue')->nullable();
            $table->string('passportExpiry')->nullable();
            $table->string('passportPOI')->nullable();
            $table->string('residence')->nullable();
            $table->string('mobNo')->nullable();
            $table->string('secNo')->nullable();
            $table->string('telNo')->nullable();
            $table->string('address')->nullable();
            $table->unsignedInteger('template_id')->nullable();
            $table->foreign('template_id')->references('id')->on('templates');
            $table->string('salary')->nullable();
            $table->string('contractDate')->nullable();
            $table->string('doj')->nullable();
            $table->string('JobTitle')->nullable();
            $table->unsignedInteger('department_id')->nullable();
            $table->foreign('department_id')->references('id')->on('departments');
            $table->longText('profilePic')->nullable();
            $table->longText('Resume')->nullable();
            $table->longText('IDCopy')->nullable();
            $table->longText('PassportCopy')->nullable();
            $table->longText('EduCertificate')->nullable();
            $table->longText('OtherDocs')->nullable();
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
        Schema::dropIfExists('employees');
    }
}
