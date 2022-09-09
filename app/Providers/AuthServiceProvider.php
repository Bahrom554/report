<?php

namespace App\Providers;

use App\Post;
use App\User;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Gate;
use Laravel\Passport\Passport;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array
     */
    protected $policies = [
        // 'App\Model' => 'App\Policies\ModelPolicy',
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {
        Passport::routes();
        $this->registerPolicies();
        $this->registerPermission();
    }
    public function registerPermission()
    {
        Gate::define('admin', function (User $user) {
            return $user->isAdmin();
        });
        Gate::define('developer', function (User $user) {
            return $user->isDeveloper();
        });
        Gate::define('manager', function (User $user) {
            return $user->isManager();
        });
        Gate::define('pentester', function (User $user) {
            return $user->isPentester();
        });
        Gate::define('soceng', function (User $user) {
            return $user->isSoceng();
        });
    }
}
