<?php

namespace App\Models;

use App\Traits\UsesUuidTrait;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Account extends Model
{
    use HasFactory, SoftDeletes, UsesUuidTrait;

    protected $fillable = [
        'uuid',
        'user_id',
        'action',
        'amount'
    ];

    protected $casts = [
        'action' => 'boolean',
        'amount' => 'double'
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
