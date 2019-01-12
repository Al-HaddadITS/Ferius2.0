import Vue from 'vue'
import Router from 'vue-router'
import AdminDashboard from './components/admin/dashboard/admin_dashboard.vue'
import EmployeeDashboard from './components/employee/dashboard/dashboard.vue'
import AdminEmployees from './components/admin/employees/admin_employee.vue'
import AdminEmployeesCreate from './components/admin/employees/admin_create_emp.vue'
import AdminDepartments from './components/admin/departments/admin_departments.vue'
import AdminHrTemplates from './components/admin/HrTemplates/adminHrTemplates.vue'
import AdminHrTemplatesCreate from './components/admin/HrTemplates/AdminHrTemplatesCreate.vue'
import AdminOrganization from './components/admin/organizations/admin_organization.vue'
import login from './components/Login.vue'
import store from './store'

Vue.use(Router)

const router = new Router({
    mode: 'history',
    base: process.env.BASE_URL,
    routes: [
        // {
        //     path: '*',
        //     redirect: '/admin/home',
        // },
        {
            path: '/',
            // redirect: '/login',
            name: 'redirect',
            meta: {
                HomeRedirect: true
            }
        },
        {
            path: '/admin',
            redirect: '/admin/home',
            meta: {
                requiresAdminAuth: true
            }
        },
        {
            path: '/admin/home',
            name: 'AdminDashboard',
            component: AdminDashboard,
            meta: {
                requiresAdminAuth: true
            }
        },
        {
            path: '/home',
            name: 'EmployeeDashboard',
            component: EmployeeDashboard,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/admin/employees',
            name: 'AdminEmployees',
            component: AdminEmployees,
            meta: {
                requiresAdminAuth: true
            }
        },
        {
            path: '/admin/employees/create',
            name: 'AdminEmployeesCreate',
            component: AdminEmployeesCreate,
            meta: {
                requiresAdminAuth: true
            }
        },
        {
            path: '/admin/departments',
            name: 'AdminDepartments',
            component: AdminDepartments,
            meta: {
                requiresAdminAuth: true
            }
        },
        {
            path: '/admin/hrTemplates',
            name: 'AdminHrTemplates',
            component: AdminHrTemplates,
            meta: {
                requiresAdminAuth: true
            }
        },
        {
            path: '/admin/hrTemplates/create',
            name: 'AdminHrTemplatesCreate',
            component: AdminHrTemplatesCreate,
            meta: {
                requiresAdminAuth: true
            }
        },
        {
            path: '/admin/organizations',
            name: 'AdminOrganization',
            component: AdminOrganization,
            meta: {
                requiresAdminAuth: true
            }
        },
        {
            path: '/login',
            name: 'login',
            component: login,
            meta: {
                requiresVisitor: true
            }
        }

    ]
})


// router.beforeEach((to, from, next) => {
//     const checkAuth = to.matched.some(x => x.meta.checkAuth)
//     const token = localStorage.getItem("access_token")
//     // console.log(token)

//     if (checkAuth && token) {
//         next('/admin/home')
//     }else {
//         next()
//     }
//   })


export default router



router.beforeEach((to, from, next) => {
    if (to.matched.some(record => record.meta.HomeRedirect)) {
        if (store.getters.loggedIn) {
            store.dispatch('setUser')
                .then(res => {
                        if (store.getters.admin) {
                            next({
                                name: 'AdminDashboard',
                            })
                        } else {
                            next({
                                name: 'EmployeeDashboard',
                            })
                        }
                    })
        } else {
            next({
                name: 'login'
            })
        }
    }else if (to.matched.some(record => record.meta.requiresVisitor)) {
        if (store.getters.loggedIn) {
            next({
                name: 'redirect',
            })
        } else {
            next()
        }
    } else if (to.matched.some(record => record.meta.requiresAdminAuth)) {
        if (!store.getters.loggedIn) {
            next({
                name: 'redirect',
            })
        } else {
            if (store.getters.admin){
                next()
            }
            else{
                next({
                    name: 'redirect',
                })
            }
        }
    } else if (to.matched.some(record => record.meta.requiresAuth)) {
        if (!store.getters.loggedIn) {
            next({
                name: 'redirect',
            })
        } else {
            if (store.getters.admin){
                next({
                    name: 'redirect',
                })
            }
            else{
                next()
            }
        }
    } else {
        next() // make sure to always call next()!
    }
})

