import Vue from 'vue'
import Router from 'vue-router'
import AdminDashboard from './components/admin/dashboard/admin_dashboard.vue'
import AdminEmployees from './components/admin/employees/admin_employee.vue'
import AdminEmployeesCreate from './components/admin/employees/admin_create_emp.vue'
import AdminDepartments from './components/admin/departments/admin_departments.vue'
import AdminHrTemplates from './components/admin/HrTemplates/adminHrTemplates.vue'
import AdminHrTemplatesCreate from './components/admin/HrTemplates/AdminHrTemplatesCreate.vue'
import AdminViewTemplates from './components/admin/HrTemplates/adminViewTemplates.vue'
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
            path: '/admin',
            redirect: '/admin/home',
            meta: {
                page_title: 'Dashboard'
            }
        },
        {
            path: '/admin/home',
            name: 'AdminDashboard',
            component: AdminDashboard,
        },
        {
            path: '/admin/employees',
            name: 'AdminEmployees',
            component: AdminEmployees,
        },
        {
            path: '/admin/employees/create',
            name: 'AdminEmployeesCreate',
            component: AdminEmployeesCreate,
        },
        {
            path: '/admin/departments',
            name: 'AdminDepartments',
            component: AdminDepartments,
        },
        {
            path: '/admin/hrTemplates',
            name: 'AdminHrTemplates',
            component: AdminHrTemplates,
        },
        {
            path: '/admin/hrTemplates/create',
            name: 'AdminHrTemplatesCreate',
            component: AdminHrTemplatesCreate,
        },
        {
            path: '/admin/hrTemplate/view/:id',
            name: 'AdminViewTemplates',
            component: AdminViewTemplates
        }

    ]
})

export default router
