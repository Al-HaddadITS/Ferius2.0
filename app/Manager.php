<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasOne;

class Manager extends Model
{
    //
    public function Department()
    {
        return $this->hasOne('App\Department', 'manager');
    }

    protected $table = 'employees';
}
