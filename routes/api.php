<?php

use App\Http\Controllers\AccountController;
use App\Http\Controllers\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/register', [UserController::class, 'register']);

Route::post('/login', [UserController::class, 'login'])->name('login');

Route::group(['middleware' => 'auth:sanctum'], function () {

    Route::post('/logout', [UserController::class, 'logout']);

    Route::get('/accounts', [AccountController::class, 'index']);

    Route::post('/accounts', [AccountController::class, 'store']);

    Route::get('/users', [UserController::class, 'index']);

    Route::get('/users/{user}/accounts', [UserController::class, 'userAccounts']);


    // allow if user is verified by admin
    Route::group(['middleware' => 'user-is-verified'], function () {

    });
});
