<?php

namespace App\Http\Controllers;

use App\Employee;
use App\Department;
use App\User;
use Illuminate\Http\Request;
use App\Permission;

class EmployeeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $emp = Employee::with('Department')->get();
        // $dep = $emp->department_id;
        return $emp;
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
        $emp = new Employee;
        $emp->EmpID = $request->EmpID;
        $emp->Fname = $request->Fname;
        $emp->Lname = $request->Lname;
        $emp->email = $request->email;
        $emp->dob = $request->dob;
        $emp->gender = $request->gender;
        $emp->pob = $request->pob;
        $emp->nationality = $request->nationality;
        $emp->religion = $request->religion;
        $emp->marital = $request->marital;
        $emp->spouseName = $request->spouseName;
        $emp->ID_no = $request->ID_no;
        $emp->idExpiry = $request->idExpiry;
        $emp->visaNo = $request->visaNo;
        $emp->visaExpiry = $request->visaExpiry;
        $emp->passportNo = $request->passportNo;
        $emp->passportIssue = $request->passportIssue;
        $emp->passportExpiry = $request->passportExpiry;
        $emp->passportPOI = $request->passportPOI;
        $emp->residence = $request->residence;
        $emp->mobNo = $request->mobNo;
        $emp->secNo = $request->secNo;
        $emp->telNo = $request->telNo;
        $emp->address = $request->address;
        $emp->template_id = $request->template_id;
        $emp->salary = $request->salary;
        $emp->contractDate = $request->contractDate;
        $emp->doj = $request->doj;
        $emp->JobTitle = $request->JobTitle;
        $emp->department_id = $request->department_id;
        $emp->profilePic = $request->profilePic;
        $emp->Resume = $request->Resume;
        $emp->ResumeFile = $request->ResumeFile;
        $emp->IDCopy = $request->IDCopy;
        $emp->IDFile = $request->IDFile;
        $emp->PassportCopy = $request->PassportCopy;
        $emp->PassportFile = $request->PassportFile;
        $emp->EduCertificate = $request->EduCertificate;
        $emp->EducationFile = $request->EducationFile;
        $emp->OtherDocs = $request->OtherDocs;
        $emp->OtherFile = $request->OtherFile;
        $emp->save();


        $fullname = $request->Fname." ".$request->Lname;
        $password = bcrypt($request->ID_no);


        $user = new User;
        $user->name = $fullname;
        $user->email = $request->email;
        $user->password = $password;
        $user->type = 'employee';


        $permission = new Permission;
        $permission->all_employees = false;
        $permission->all_attendance = false;
        $permission->all_payroll = false;
        $permission->manage_leaves = false;
        $permission->reports = false;
        $permission->hr_templates = false;
        $user->Permission()->save($permission);
        $user->permission_id = $permission->id;
        $emp->user()->save($user);
        $emp->user_id = $user->id;
        $emp->save();

        // $user->save();
        return $request;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Employee  $employee
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $emp = Employee::with('Department', 'Template', 'user')->find($id);
        // return new EmployeeResource($emp);
        return $emp;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Employee  $employee
     * @return \Illuminate\Http\Response
     */
    public function edit(Employee $employee)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Employee  $employee
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Employee $employee)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Employee  $employee
     * @return \Illuminate\Http\Response
     */
    public function destroy(Employee $employee)
    {
        //
    }
}
