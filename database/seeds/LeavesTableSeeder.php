<?php

use Illuminate\Database\Seeder;

class LeavesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('leaves')->insert([
            'type' => 'Annual Leave',
            'start_date' => '05/02/2019',
            'end_date' => '07/02/2019',
            'no_days' => '2',
            'description' => '',
            'attachment' => '',
            'employee_id' => '2',
            'submission_date' => '02/02/2019',
            'status' => 'Approved',
            'done_by' => 'Staffy Manager',
            'done_date' => '03/02/2019',
            'rejection_reason' => '',
        ]);
        DB::table('leaves')->insert([
            'type' => 'Sick Leave',
            'start_date' => '27/01/2019',
            'end_date' => '27/01/2019',
            'no_days' => '1',
            'description' => '',
            'attachment' => '',
            'employee_id' => '2',
            'submission_date' => '28/01/2019',
            'status' => 'Rejected',
            'done_by' => 'Staffy Manager',
            'done_date' => '03/02/2019',
            'rejection_reason' => 'Too many Sick Leaves',
        ]);
        DB::table('leaves')->insert([
            'type' => 'Annual Leave',
            'start_date' => '27/02/2019',
            'end_date' => '05/03/2019',
            'no_days' => '7',
            'description' => '',
            'attachment' => '',
            'employee_id' => '2',
            'submission_date' => '28/02/2019',
            'status' => 'Pending',
            'done_by' => '',
            'done_date' => '',
            'rejection_reason' => '',
        ]);
    }
}
