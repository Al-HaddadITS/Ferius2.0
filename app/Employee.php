<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Employee extends Model
{
    public function Department()
    {
        return $this->BelongsTo('App\Department');
    }
}

// belongsTo
