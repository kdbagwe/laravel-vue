<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Http\Requests\User\LoginRequest;
use App\Http\Requests\User\RegisterRequest;
use App\Http\Resources\UserResource;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    public function index()
    {
        $users = User::where('is_banker', 0)->latest()->get();

        return UserResource::collection($users);
    }

    public function userAccounts($id)
    {
        $user = User::where('uuid', $id)->with('accounts')->firstOrFail();

        return new UserResource($user);
    }

    public function login(LoginRequest $request)
    {
        return $this->loginUser($request);
    }

    public function logout()
    {
        Auth::guard('web')->logout();

        return response()->json([], 200);
    }

    public function register(RegisterRequest $request)
    {
        // dd($request->all());
        User::create([
            'name' => ucfirst($request->name),
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]);

        return $this->loginUser($request);
    }

    public function loginUser($user)
    {
        if (!Auth::attempt([
            'email' => $user->email,
            'password' => $user->password
        ], $user->get('remember'))) {

            return response()->json([
                'error' => 'Invalid Credentials'
            ], 401);
        }

        $token = Auth::user()->createToken('user-auth-token');

        return [
            'user' => new UserResource(Auth::user()),
            'userToken' => $token->plainTextToken
        ];
    }
}
