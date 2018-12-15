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
}

// HasMany
