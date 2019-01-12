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
        <template v-for="(item, i) in items">
          <v-layout
            v-if="item.heading"
            :key="i"
            row
            align-center
          >
            <v-flex xs6>
              <v-subheader v-if="item.heading">
                {{ item.heading }}
              </v-subheader>
            </v-flex>
            <v-flex xs6 class="text-xs-right">
              <v-btn small flat>edit</v-btn>
            </v-flex>
          </v-layout>
          <v-divider
            v-else-if="item.divider"
            :key="i"
            dark
            class="my-3"
          ></v-divider>
          <v-list-tile
            v-else
            :key="i"
            :to="{name: item.link}"
          >
            <v-list-tile-action>
              <v-icon>{{ item.icon }}</v-icon>
            </v-list-tile-action>
            <v-list-tile-content>
              <v-list-tile-title class="grey--text">
                {{ item.text }}
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
            // drawer: null,
            items: [
        { icon: 'dashboard', text: 'Dashboard', link: 'AdminDashboard' },
        { icon: 'dashboard', text: 'Events Calendar', link: 'AdminDashboard'},
        { icon: 'notification_important', text: 'Alerts Center', link: 'AdminDashboard'},
        { divider: true },
        { icon: 'account_circle', text: 'Employees' , link: 'AdminEmployees' },
        { icon: 'account_balance', text: 'Departments' , link: 'AdminOrganization' },
        { icon: 'fingerprint', text: 'Attendance' , link: 'AdminEmployees'},
        { icon: 'attach_money', text: 'Payroll' , link: 'AdminEmployees'},
        { icon: 'time_to_leave', text: 'Leave Management' , link: 'AdminEmployees'},
        { icon: 'time_to_leave', text: 'Reports' , link: 'AdminEmployees'},
        { divider: true },
        { icon: 'help', text: 'Policies & Forms' , link: 'AdminEmployees' },
        { icon: 'help', text: 'HR Templates' , link: 'AdminHrTemplates' },
        { icon: 'settings', text: 'Settings' , link: 'AdminEmployees' }
      ]
        }
    },
    // created(){
    //     this.drawer
    // },
    computed:{
        drawer(){
            return this.$store.getters.drawer
        }
    }
}
</script>

<style lang="stylus">
  #keep
    .v-navigation-drawer__border
      display: none
</style>
