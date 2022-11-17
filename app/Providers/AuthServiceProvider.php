<?php

namespace App\Providers;

use Carbon\Carbon;
use Illuminate\Auth\Notifications\ResetPassword;
use Illuminate\Auth\Notifications\VerifyEmail;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Facades\URL;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array<class-string, class-string>
     */
    protected $policies = [
        // 'App\Models\Model' => 'App\Policies\ModelPolicy',
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerPolicies();

        // creating custom URL for reset password links
        ResetPassword::createUrlUsing(function ($user, string $token) {

            // when admin resets password
            if ($user->getTable() === 'admins') {

                return env('APP_URL').'/admin/reset-password/'.$token.'?email='.$user->email;
            }
            // when user/contributor resets password
            return env('APP_URL').'/contributor/reset-password/'.$token.'?email='.$user->email;
        });

        // VerifyEmail::toMailUsing(function ($notifiable, $url) {
        //     // remove api/ from url since vue route and laravel route cannot be same
        //     $url = str_replace("api/", "", $url);
        //     return (new MailMessage)
        //         ->subject('Verify Email')
        //         ->line('Click the button below to verify your email address.')
        //         ->action('Verify Email Address', $url);
        // });
    }
}
