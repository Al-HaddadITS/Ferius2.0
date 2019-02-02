<template>
    <v-navigation-drawer
      :value="drawer"
      fixed
      clipped
      class="grey lighten-4"
      app
    >
      <v-list
        dense
        class="grey lighten-4"
      >

<template>
    <v-list-tile :to="{name: 'AdminDashboard'}">
        <v-list-tile-action>
            <v-icon>dashboard</v-icon>
        </v-list-tile-action>
        <v-list-tile-content>
            <v-list-tile-title class="grey--text">
                Dashboard
            </v-list-tile-title>
        </v-list-tile-content>
    </v-list-tile>
    <v-list-tile :to="{name: 'AdminDashboard'}">
        <v-list-tile-action>
            <v-icon>dashboard</v-icon>
        </v-list-tile-action>
        <v-list-tile-content>
            <v-list-tile-title class="grey--text">
                Events Calendar
            </v-list-tile-title>
        </v-list-tile-content>
    </v-list-tile>
    <v-list-tile :to="{name: 'AdminDashboard'}">
        <v-list-tile-action>
            <v-icon>notification_important</v-icon>
        </v-list-tile-action>
        <v-list-tile-content>
            <v-list-tile-title class="grey--text">
                Alerts Center
            </v-list-tile-title>
        </v-list-tile-content>
    </v-list-tile>
    <v-divider dark class="my-3"></v-divider>
    <v-list-tile :to="{name: 'myProfile'}" v-if="myProfile">
        <v-list-tile-action>
            <v-icon>account_circle</v-icon>
        </v-list-tile-action>
        <v-list-tile-content>
            <v-list-tile-title class="grey--text">
                My Profile
            </v-list-tile-title>
        </v-list-tile-content>
    </v-list-tile>
    <v-list-tile :to="{name: 'AdminEmployees'}" v-if="employees">
        <v-list-tile-action>
            <v-icon>account_circle</v-icon>
        </v-list-tile-action>
        <v-list-tile-content>
            <v-list-tile-title class="grey--text">
                Employees
            </v-list-tile-title>
        </v-list-tile-content>
    </v-list-tile>
    <v-list-tile :to="{name: 'MyEmployees'}" v-if="myEmployees">
        <v-list-tile-action>
            <v-icon>account_circle</v-icon>
        </v-list-tile-action>
        <v-list-tile-content>
            <v-list-tile-title class="grey--text">
                My Employees
            </v-list-tile-title>
        </v-list-tile-content>
    </v-list-tile>
    <v-list-tile :to="{name: 'AdminOrganization'}" v-if="departments">
        <v-list-tile-action>
            <v-icon>account_balance</v-icon>
        </v-list-tile-action>
        <v-list-tile-content>
            <v-list-tile-title class="grey--text">
                Departments
            </v-list-tile-title>
        </v-list-tile-content>
    </v-list-tile>
    <v-list-tile :to="{name: 'AdminEmployees'}" v-if="attendance">
        <v-list-tile-action>
            <v-icon>fingerprint</v-icon>
        </v-list-tile-action>
        <v-list-tile-content>
            <v-list-tile-title class="grey--text">
                Attendance
            </v-list-tile-title>
        </v-list-tile-content>
    </v-list-tile>
    <v-list-tile :to="{name: 'AdminEmployees'}" v-if="payroll">
        <v-list-tile-action>
            <v-icon>attach_money</v-icon>
        </v-list-tile-action>
        <v-list-tile-content>
            <v-list-tile-title class="grey--text">
                Payroll
            </v-list-tile-title>
        </v-list-tile-content>
    </v-list-tile>
    <v-list-tile :to="{name: 'leaves'}" v-if="leaveManagement">
        <v-list-tile-action>
            <v-icon>time_to_leave</v-icon>
        </v-list-tile-action>
        <v-list-tile-content>
            <v-list-tile-title class="grey--text">
                Leave Management
            </v-list-tile-title>
        </v-list-tile-content>
    </v-list-tile>
    <v-list-tile :to="{name: 'AdminEmployees'}" v-if="reports">
        <v-list-tile-action>
            <v-icon>time_to_leave</v-icon>
        </v-list-tile-action>
        <v-list-tile-content>
            <v-list-tile-title class="grey--text">
                Reports
            </v-list-tile-title>
        </v-list-tile-content>
    </v-list-tile>
    <v-divider dark class="my-3"></v-divider>
    <v-list-tile :to="{name: 'AdminEmployees'}">
        <v-list-tile-action>
            <v-icon>help</v-icon>
        </v-list-tile-action>
        <v-list-tile-content>
            <v-list-tile-title class="grey--text">
                Policies & Forms
            </v-list-tile-title>
        </v-list-tile-content>
    </v-list-tile>
    <v-list-tile :to="{name: 'AdminHrTemplates'}">
        <v-list-tile-action>
            <v-icon>help</v-icon>
        </v-list-tile-action>
        <v-list-tile-content>
            <v-list-tile-title class="grey--text">
                HR Templates
            </v-list-tile-title>
        </v-list-tile-content>
    </v-list-tile>
    <v-list-tile :to="{name: 'AdminEmployees'}">
        <v-list-tile-action>
            <v-icon>help</v-icon>
        </v-list-tile-action>
        <v-list-tile-content>
            <v-list-tile-title class="grey--text">
                Settings
            </v-list-tile-title>
        </v-list-tile-content>
    </v-list-tile>
</template>


      </v-list>
    </v-navigation-drawer>
</template>

<script>
export default {
    data(){
        return{
      employees: false,
      departments: false,
      attendance: false,
      payroll: false,
      leaveManagement: false,
      reports: false,
      myProfile: false,
      myEmployees: false,
        }
    },
    // created(){
    //     this.drawer
    // },
    computed:{
        drawer(){
            return this.$store.getters.drawer
        },
        allPermissions(){
            return this.$store.getters.allPermissions
        },

    },
    watch: {
        allPermissions: function(val){
            val.forEach(item => {
                if(item.name == 'employees'){
                    this.employees = true
                }
                else if(item.name == 'departments'){
                    this.departments = true
                }
                else if(item.name == 'attendance'){
                    this.attendance = true
                }
                else if(item.name == 'payroll'){
                    this.payroll = true
                }
                else if(item.name == 'leaveManagement'){
                    this.leaveManagement = true
                }
                else if(item.name == 'reports'){
                    this.reports = true
                }
                else if(item.name == 'my profile'){
                    this.myProfile = true
                }
                else if(item.name == 'my employees'){
                    this.myEmployees = true
                }
                // console.log(item.name)
            });
        }
    },
}
</script>

<style lang="stylus">
  #keep
    .v-navigation-drawer__border
      display: none
</style>
