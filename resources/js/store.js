import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios';

Vue.use(Vuex)

const store = new Vuex.Store({
    state: {
        settings: null,
        drawer: true,
        snackbar: false,
        SnackText: '',
        user: null,
        employees: [],
        departments: [],
        templates: [],
        viewTemplates: [],
        pageTitle: '',
        loading: false
    },
    mutations: {
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
        viewTemplate({commit}, payload){
            fetch('/api/TemplatesList/'+payload)
                .then(res => res.json())
                .then(res => {
                    commit('SetViewTemplates', res)
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
                     IDCopy: payload.IDCopy,
                     PassportCopy: payload.PassportCopy,
                     EduCertificate: payload.EduCertificate,
                     OtherDocs: payload.OtherDocs
            })
                .then(res =>{
                    // this.$router.push({name: 'AdminHrTemplates'})
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
        setUser({commit}){
            fetch('/getUser')
                .then(res => res.json())
                .then(res => {
                    commit('setUser', res)
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
    }
})

export default store
