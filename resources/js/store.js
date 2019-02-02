import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios';
// import router from './router'
Vue.use(Vuex)

const store = new Vuex.Store({
    state: {
        myDetails: [],
        allPermissions: [],
        userLoading: false,
        admin: false,
        accessToken: localStorage.getItem("access_token") || null,
        settings: null,
        drawer: true,
        snackbar: false,
        SnackText: '',
        user: null,
        employees: [],
        departments: [],
        myDepartment: [],
        templates: [],
        viewTemplates: [],
        viewEmployee: [],
        pageTitle: '',
        loading: false,
        leaves: []
    },
    mutations: {
        setLeaves(state, payload){
            state.leaves = payload
        },
        setMyDepartment(state, payload){
            state.myDepartment = payload
        },
        setMyDetails(state, payload){
            state.myDetails = payload
        },
        setAllPermissions(state, payload){
            state.allPermissions = payload
        },
        setUserLoading(state, payload){
            state.userLoading = payload
        },
        setAdmin(state, payload){
            state.admin = payload
        },
        setAccessToken(state, payload){
            state.accessToken = payload
        },
        clearLoading(state){
            state.loading = false
        },
        setLoading(state){
            state.loading = true
        },
        clearSnackbar(state){
            state.snackbar = false
        },
        setSnackbar(state){
            state.snackbar = true
        },
        setSnackText(state, payload){
            state.SnackText = payload
        },
        SetPageTitle(state, payload){
            state.pageTitle = payload
        },
        SetTemplates(state, payload){
            state.templates = payload
        },
        SetViewTemplates(state, payload){
            state.viewTemplates = payload
        },
        SetViewEmployee(state, payload){
            state.viewEmployee = payload
        },
        setDepartments(state, payload){
            state.departments = payload
        },
        setEmployees(state, payload){
            state.employees = payload
        },
        setUser(state, payload){
            state.user = payload
        },
        setSettings(state, payload){
            state.settings = payload
        },
        toggleNav(state){
            state.drawer = !state.drawer
        }
    },
    actions:{
        leaves({commit}, payload){
            let URL = "http://localhost:8000/api/Leaves/"
            axios.get(URL)
                .then(res => {
                    commit('setLeaves', res.data)
                })
                .catch(e => {
                    console.log(e)
                })
        },
        myDepartment({commit}, payload){
            let URL = "http://localhost:8000/api/DepartmentsList/"
            axios.get(URL + payload)
                .then(res => {
                    commit('setMyDepartment', res.data)
                })
                .catch(e => {
                    console.log(e)
                })
        },
        myDetails({commit}, payload){
            let access_token = localStorage.getItem("access_token")
            let URL = "/api/auth/myEmployee"
            let Bearer = 'Bearer ' + access_token

            return new Promise((resolve, reject) => {

                axios.get(URL, { headers: { Authorization: Bearer } })
                // .then(res => res.json())
                .then(res => {
                    commit('setMyDetails', res.data)
                    resolve(res)
                })
                .catch(e => {
                    console.log(e)
                    reject(e)
                })
            })
        },

        logout({commit, dispatch, getters}){
            let access_token = localStorage.getItem("access_token")
            let URL = "/api/auth/logout"
            let Bearer = 'Bearer ' + access_token
            if(getters.loggedIn){
                commit('setUserLoading', true)
                return new Promise((resolve, reject) => {
                axios.get(URL, { headers: { Authorization: Bearer } })
                    .then(res => {
                        commit('setUserLoading', false)
                        localStorage.removeItem("access_token");
                        dispatch('setAccessToken', null)
                        resolve(res)
                    })
                    .catch(err => {
                        commit('setUserLoading', false)
                    console.log(err)
                    reject(err)
                    })
                })
            }
        },
        login({commit, dispatch, getters}, payload){

            return new Promise((resolve, reject) => {
                axios.post('/api/auth/login', {
                    email: payload.email,
                    password: payload.password,
                    remember: payload.remember,
                })
                .then(res => {
                    let accessToken = res.data.access_token
                    localStorage.setItem("access_token", accessToken)
                    commit('setAccessToken', accessToken)
                    // dispatch('setUser')
                    //     .then(res => {
                    //         if(getters.admin){
                        //             router.push({name: 'AdminDashboard'})
                    //         }
                    //         else{
                    //             router.push({name: 'EmployeeDashboard'})
                    //         }
                    //     })
                    resolve(res)
                })
                .catch(e=>{
                    console.log(e)
                    reject(e)
                })
            })
        },
        setAccessToken({commit}, payload){
            commit('setAccessToken', payload)
        },

        viewTemplate({commit}, payload){
            fetch('/api/TemplatesList/'+payload)
                .then(res => res.json())
                .then(res => {
                    commit('SetViewTemplates', res)
                })
        },
        viewEmployee({commit}, payload){
            fetch('/api/EmployeesList/'+payload)
                // .then(res => res.json())
                .then(res => {
                    commit('SetViewEmployee', res)
                })
        },
        setSnackBar({commit}, payload){
            commit('setSnackbar')
            commit('setSnackText', payload)
        },
        clearSnackBar({commit}){
            commit('clearSnackbar')
        },
        editTemplate({commit}, payload){
            commit('setLoading')
            axios.put('/api/TemplatesList/'+payload.id, {temp: payload.temp})
                .then(res => {
                    commit('setSnackbar')
                    commit('setSnackText', payload.name+' Successfully Updated')
                    fetch('/api/TemplatesList')
                    .then(res => res.json())
                    .then(res => {
                        commit('clearLoading')
                        commit('SetTemplates', res)
                    })
                    .catch(e =>{
                        commit('clearLoading')
                        console.log(e)
                    })
                })
                .catch(e =>{
                    commit('clearLoading')
                    console.log(e)
                })
        },
        deleteTemplate({commit}, payload){
            commit('setLoading')
            axios.delete('/api/TemplatesList/'+payload.id)
                .then(res => {
                    commit('setSnackbar')
                    commit('setSnackText', payload.name+' Successfully Deleted')
                    fetch('/api/TemplatesList')
                    .then(res => res.json())
                    .then(res => {
                        commit('clearLoading')
                        commit('SetTemplates', res)
                    })
                    .catch(e =>{
                        commit('clearLoading')
                        console.log(e)
                    })
                })
                .catch(e =>{
                    commit('clearLoading')
                    console.log(e)
                })

        },
        saveEmployee({commit}, payload){
            axios.post('/api/EmployeesList', {
                EmpID: payload.EmpID,
                Fname: payload.Fname,
                     Lname: payload.Lname,
                     email: payload.email,
                     dob: payload.dob,
                     gender: payload.gender,
                     pob: payload.pob,
                     nationality: payload.nationality,
                     religion: payload.religion,
                     marital: payload.marital,
                     spouseName: payload.spouseName,
                     ID_no: payload.ID_no,
                     idExpiry: payload.idExpiry,
                     visaNo: payload.visaNo,
                     visaExpiry: payload.visaExpiry,
                     passportNo: payload.passportNo,
                     passportIssue: payload.passportIssue,
                     passportExpiry: payload.passportExpiry,
                     passportPOI: payload.passportPOI,
                     residence: payload.residence,
                     mobNo: payload.mobNo,
                     secNo: payload.secNo,
                     telNo: payload.telNo,
                     address: payload.address,
                     template_id: payload.template_id,
                     salary: payload.salary,
                     contractDate: payload.contractDate,
                     doj: payload.doj,
                     JobTitle: payload.JobTitle,
                     department_id: payload.department_id,
                     profilePic: payload.profilePic,
                     Resume: payload.Resume,
                     ResumeFile: payload.ResumeFile,
                     IDCopy: payload.IDCopy,
                     IDFile: payload.IDFile,
                     PassportCopy: payload.PassportCopy,
                     PassportFile: payload.PassportFile,
                     EduCertificate: payload.EduCertificate,
                     EducationFile: payload.EducationFile,
                     OtherDocs: payload.OtherDocs,
                     OtherFile: payload.OtherFile
            })
                .then(res =>{
                    // console.log(res)
                })
                .catch(e =>{
                    console.log(e)
                })
        },
        saveTemplate({commit}, payload){
            axios.post('/api/TemplatesList', {
                name: payload.name,
                description: payload.description,
                temp: payload.temp
            })
                .then(res =>{
                    // this.$router.push({name: 'AdminHrTemplates'})
                    // console.log(res)
                })
                .catch(e =>{
                    console.log(e)
                })
        },
        SetTemplates({commit}){
            commit('setLoading')
            fetch('/api/TemplatesList')
            .then(res => res.json())
            .then(res => {
                commit('clearLoading')
                commit('SetTemplates', res)
            })
            .catch(e =>{
                commit('clearLoading')
                console.log(e)
            })
        },
        SetPageTitle({commit}, payload){
            commit('SetPageTitle', payload)
        },
        setDepartments({commit}){
            commit('setLoading')
            fetch('/api/DepartmentsList')
                .then(res => res.json())
                .then(res => {
                    commit('clearLoading')
                    commit('setDepartments', res)
                })
                .catch(e =>{
                    commit('clearLoading')
                    console.log(e)
                })
        },
        setEmployees({commit}){
            commit('setLoading')
            fetch('/api/EmployeesList')
                .then(res => res.json())
                .then(res => {
                    commit('clearLoading')
                    commit('setEmployees', res)
                })
                .catch(e =>{
                    commit('clearLoading')
                    console.log(e)
                })
        },
        // setAllPermissions({commit}, payload){

        //   },
        setUser({commit, dispatch, getters}){
            let access_token = localStorage.getItem("access_token")
            let URL = "/api/auth/user"
            let Bearer = 'Bearer ' + access_token
            commit('setUserLoading', true)

            return new Promise((resolve, reject) => {

                axios.get(URL, { headers: { Authorization: Bearer } })
                // .then(res => res.json())
                .then(res => {
                    fetch('/api/getAllPermissions/' + res.data.id)
                        .then(res => res.json())
                        .then(res => {
                            commit('setUserLoading', false)
                            commit('setAllPermissions', res)
                        })
                        .catch(e => {
                            console.log(e)
                            commit('setUserLoading', false)
                        })
                    commit('setUser', res.data)
                    if(res.data.type == 'admin'){
                        commit('setAdmin', true)
                    }
                    else{
                        dispatch('myDetails')
                            .then(res => {
                                // console.log(res.data.department.id)
                                // console.log(getters.myDetails.department)
                                dispatch('myDepartment', res.data.department.id)
                            })
                        commit('setAdmin', false)
                    }
                    resolve(res)
                })
                .catch(e => {
                    commit('setUserLoading', false)
                    console.log(e)
                    reject(e)
                })
            })
        },
        toggleNav({commit}){
            commit('toggleNav')
        },
        getSettings({commit}){
            fetch('/api/getSettings')
                .then(res => res.json())
                .then(res => {
                    commit('setSettings', res)
                })
        }
    },
    getters:{
        leaves(state){
            return state.leaves
        },
        myDepartment(state){
            return state.myDepartment
        },
        myDetails(state){
            return state.myDetails
        },
        allPermissions(state){
            return state.allPermissions
        },
        userLoading(state){
            return state.userLoading
        },
        admin(state){
            return state.admin
        },
        loggedIn(state){
            return state.accessToken !== null
        },
        accessToken(state){
            return state.accessToken
        },
        loading(state){
            return state.loading
        },
        snackbar(state){
            return state.snackbar
        },
        SnackText(state){
            return state.SnackText
        },
        pageTitle(state){
            return state.pageTitle
        },
        settings(state){
            return state.settings
        },
        drawer(state){
            return state.drawer
        },
        user(state){
            return state.user
        },
        employees(state){
            return state.employees
        },
        departments(state){
            return state.departments
        },
        templates(state){
            return state.templates
        },
        viewTemplates(state){
            return state.viewTemplates
        },
        viewEmployee(state){
            return state.viewEmployee
        },
    }
})

export default store
