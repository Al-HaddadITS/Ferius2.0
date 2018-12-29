<?php

namespace App\Http\Controllers;

use App\Template;
use Illuminate\Http\Request;
use App\Http\Resources\TemplateResource;

class TemplateController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // $temp = Template::all();
        return TemplateResource::collection(Template::all());

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $templ = new Template;
        $templ->name = $request->name;
        $templ->description = $request->description;
        $templ->temp = $request->temp;
        $templ->save();
        return $request;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Template  $template
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $temp = Template::find($id);
        return new TemplateResource($temp);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Template  $template
     * @return \Illuminate\Http\Response
     */
    public function edit(Template $template)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Template  $template
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $temp = Template::find($id);
        $temp->temp = $request->temp;
        $temp->save();
        return $request;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Template  $template
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $temp = Template::find($id);
        $temp->delete();
        return $temp;
    }
}
