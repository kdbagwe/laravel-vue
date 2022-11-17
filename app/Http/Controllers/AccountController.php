<?php

namespace App\Http\Controllers;

use App\Http\Requests\AccountRequest;
use App\Http\Resources\AccountResource;
use App\Http\Resources\UserResource;
use App\Models\Account;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class AccountController extends Controller
{
    public function index()
    {
        $accounts = Account::where('user_id', Auth::id())->latest()->get();

        return AccountResource::collection($accounts);
    }

    public function store(AccountRequest $request)
    {
        $data = DB::transaction(function () use ($request) {

            $user = User::findOrFail(Auth::id());

            $account = Account::create([
                'user_id' => $user->id,
                'action' => $request->action,
                'amount' => $request->amount
            ]);

            if ($account->action) {

                $user->increment('balance', $account->amount);
            }
            else {

                $user->decrement('balance', $account->amount);
            }

            return [
                'account' => new AccountResource($account),
                'user' => new UserResource($user)
            ];
        });

        return response()->json($data, 200);
    }
}
