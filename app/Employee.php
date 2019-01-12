<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Employee extends Model
{
    protected $fillable = [];
    public function Department()
    {
        return $this->BelongsTo('App\Department');
    }
    public function Template()
    {
        return $this->BelongsTo('App\Template');
    }

    public function user()
    {
        return $this->hasOne('App\User');
    }

}

// belongsTo
