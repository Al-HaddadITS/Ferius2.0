<?php

use Illuminate\Database\Seeder;

class TemplateTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('templates')->insert([
            'name' => 'Full-Time',
            'description' => 'template description',
            'temp' => 'here i might put an HTML version of the template .. i will see how this fits in the templates page.'
        ]);
    }
}
