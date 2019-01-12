<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Template extends Model
{
    //
    protected $fillable = [];

    public function Employee()
    {
        return $this->hasMany('App\Employee');
    }
}
