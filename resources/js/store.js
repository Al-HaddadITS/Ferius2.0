import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

const store = new Vuex.Store({
    state: {
        settings: null,
        drawer: true,
        user: null,
        employees: [],
        departments: null,
        pageTitle: '',
    },
    mutations: {
        SetPageTitle(state, payload){
            state.pageTitle = payload
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
        }
    }
})

export default store
