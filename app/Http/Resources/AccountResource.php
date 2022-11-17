<?php

namespace App\Http\Resources;

use Carbon\Carbon;
use Illuminate\Http\Resources\Json\JsonResource;

class AccountResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'uuid' => $this->uuid,
            'user' => new UserResource($this->whenLoaded('user')),
            'action' => $this->action,
            'amount' => $this->amount,
            'date' => Carbon::parse($this->created_at)->format('d-m-Y'),
            'time' => Carbon::parse($this->created_at)->format('h:m:i A')
        ];
    }
}
