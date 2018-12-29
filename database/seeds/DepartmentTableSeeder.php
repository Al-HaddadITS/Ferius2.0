<?php

use Illuminate\Database\Seeder;

class DepartmentTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('departments')->insert([
            'name' => 'Development',
        ]);
        DB::table('departments')->insert([
            'name' => 'Sales',
        ]);
        DB::table('departments')->insert([
            'name' => 'Operations',
        ]);
    }
}
