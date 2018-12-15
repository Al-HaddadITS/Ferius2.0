<?php

use Illuminate\Database\Seeder;

class EmployeesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('employees')->insert([
            'EmpID' => 'S5986',
            'Fname' => 'Rajeev',
            'Lname' => 'Indusha',
            'JobTitle' => 'Salesman',
            'department_id' => '2'
        ]);
        DB::table('employees')->insert([
            'EmpID' => 'S5986',
            'Fname' => 'Julie',
            'Lname' => '',
            'JobTitle' => 'Operation Manager',
            'department_id' => '3'
        ]);
    }
}
