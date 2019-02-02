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
import AdminOrganizationCreate from './components/admin/organizations/AdminOrganizationCreate.vue'
import MyEmployees from './components/manager/MyEmployees.vue'
import myProfile from './components/myProfile.vue'
import leaves from './components/admin/leaveManagement/leaves.vue'
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
            path: '/',
            redirect: '/home',
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/home',
            name: 'AdminDashboard',
            component: AdminDashboard,
            meta: {
                requiresAuth: true
            }
        },
        // {
        //     path: '/home',
        //     name: 'EmployeeDashboard',
        //     component: EmployeeDashboard,
        //     meta: {
        //         requiresAuth: true
        //     }
        // },
        {
            path: '/myProfile',
            name: 'myProfile',
            component: myProfile,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/employees',
            name: 'AdminEmployees',
            component: AdminEmployees,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/employees/create',
            name: 'AdminEmployeesCreate',
            component: AdminEmployeesCreate,
            meta: {
                requiresAuth: true
            }
        },
        // {
        //     path: '/admin/departments',
        //     name: 'AdminDepartments',
        //     component: AdminDepartments,
        //     meta: {
        //         requiresAuth: true
        //     }
        // },
        {
            path: '/hrTemplates',
            name: 'AdminHrTemplates',
            component: AdminHrTemplates,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/hrTemplates/create',
            name: 'AdminHrTemplatesCreate',
            component: AdminHrTemplatesCreate,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/departments',
            name: 'AdminOrganization',
            component: AdminOrganization,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/departments/create',
            name: 'AdminOrganizationCreate',
            component: AdminOrganizationCreate,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/MyEmployees',
            name: 'MyEmployees',
            component: MyEmployees,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/leaves',
            name: 'leaves',
            component: leaves,
            meta: {
                requiresAuth: true
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
                    next({
                        name: 'AdminDashboard',
                    })
                    //     if (store.getters.admin) {
                    //     } else {
                    //         next({
                    //             name: 'EmployeeDashboard',
                    //         })
                    //     }
                    })
        } else {
            next({
                name: 'login'
            })
        }
    }else if (to.matched.some(record => record.meta.requiresVisitor)) {
        if (store.getters.loggedIn) {
            if(!store.getters.user){
                store.dispatch('setUser')
            }
            next({
                name: 'redirect',
            })
        } else {
            next()
        }
    // } else if (to.matched.some(record => record.meta.requiresAuth)) {
    //     if (!store.getters.loggedIn) {
    //         next({
    //             name: 'redirect',
    //         })
    //     } else {
    //         if (store.getters.admin){
    //             next()
    //         }
    //         else{
    //             next({
    //                 name: 'redirect',
    //             })
    //         }
    //     }
    } else if (to.matched.some(record => record.meta.requiresAuth)) {
        if (!store.getters.loggedIn) {
            next({
                name: 'redirect',
            })
        } else {
            if(!store.getters.user){
                store.dispatch('setUser')
            }
                    next()
            // if (store.getters.admin){
            //     next({
            //         name: 'redirect',
            //     })
            // }
            // else{
            // }
        }
    } else {
        next() // make sure to always call next()!
    }
})

