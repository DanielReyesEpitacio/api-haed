<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

class HomeController extends Controller
{
    public function info(){
        $routes = Route::getRoutes();

        $apiRoutes = [];
        foreach ($routes as $route) {
            if (str_contains($route->uri, 'api/')) {
                $apiRoutes[] = $route->uri;
            }
        }

        return view("haed-info")->with('apiRoutes',$apiRoutes);
    }

    public function endpoint($endpoint){
        return view($endpoint);
    }
}
