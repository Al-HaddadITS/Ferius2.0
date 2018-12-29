<?php

use Illuminate\Database\Seeder;

class SettingsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('settings')->insert([
            'app_name' => 'Ferius HRMS',
            'app_color' => 'blue darken-3',
            'app_color_secondary' => 'blue darken-4',
            'app_color_accent' => 'blue darken-1',
            'app_color_error' => 'red',
            'app_color_warning' => 'yellow',
            'app_color_info' => 'blue',
            'app_color_success' => 'green'
        ]);
    }
}
