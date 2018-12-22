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
        departments: null,
        templates: [],
        viewTemplates: [],
        pageTitle: '',
    },
    mutations: {
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
        deleteTemplate({commit}, payload){
            axios.delete('/api/TemplatesList/'+payload.id)
                .then(res => {
                    commit('setSnackText', payload.name+' Successfully Deleted')
                    fetch('/api/TemplatesList')
                    .then(res => res.json())
                    .then(res => {
                        commit('SetTemplates', res)
                    })
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
            fetch('/api/TemplatesList')
            .then(res => res.json())
            .then(res => {
                commit('SetTemplates', res)
            })
        },
        SetPageTitle({commit}, payload){
            commit('SetPageTitle', payload)
        },
        setDepartments({commit}){
            fetch('/api/DepartmentsList')
                .then(res => res.json())
                .then(res => {
                    commit('setDepartments', res)
                })
        },
        setEmployees({commit}){
            fetch('/api/EmployeesList')
                .then(res => res.json())
                .then(res => {
                    commit('setEmployees', res)
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
