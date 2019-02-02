<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Setting;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class MainController extends Controller
{
    public function index()
    {
        $settings = Setting::first();
        return view('layouts/index', [
            'settings' => $settings,
        ]);
    }

    public function addPermission(Request $request)
    {
        $role = Role::findByName($request->role);
        // $role = Role::create(['name' => $request->role]);
        $permission = Permission::create(['name' => $request->permission]);
        // $permission = Permission::find($request->permission);

        $role -> givePermissionTo($permission);

        $permission->assignRole($role);

        return $request;
    }

    public function revokePermission(Request $request)
    {
        $role = Role::findByName($request->role);
        // $role = Role::create(['name' => $request->role]);
        // $permission = Permission::create(['name' => $request->permission]);
        $permission = Permission::findByName($request->permission);

        $role -> revokePermissionTo($permission);

        // $permission->assignRole($role);

        return $request;
    }
}
