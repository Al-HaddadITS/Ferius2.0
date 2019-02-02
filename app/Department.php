<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Department extends Model
{
    public function Employee()
    {
        return $this->hasMany('App\Employee');
    }
    // public function Manager()
    // {
    //     return $this->hasOne('App\Manager');
    // }
    public function Manager()
    {
        return $this->belongsTo('App\Manager', 'manager');
    }
}

// HasMany
