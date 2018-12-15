<template>
  <!-- <v-card height="350px"> -->
      <div>
    <v-navigation-drawer
    v-for="(setting, i) in settings" v-bind:key="i"
      v-model="drawer"
      permanent
      absolute
      dark
      width="215"
      floating
      :class="setting.app_color"
      fixed
      app
    >
      <!-- <v-toolbar flat class="transparent">
        <v-list class="pa-0">
          <v-list-tile avatar>
            <v-list-tile-avatar>
              <img src="https://randomuser.me/api/portraits/men/85.jpg">
            </v-list-tile-avatar>

            <v-list-tile-content>
              <v-list-tile-title>John Leider</v-list-tile-title>
            </v-list-tile-content>
          </v-list-tile>
        </v-list>
      </v-toolbar> -->
      <!-- <v-toolbar flat class="transparent"> -->
      <v-toolbar flat :class="setting.app_color_secondary">
        <v-list class="pa-0">
          <v-list-tile>
            <v-list-tile-content>
              <v-list-tile-title>Ferius</v-list-tile-title>
            </v-list-tile-content>
          </v-list-tile>
        </v-list>
      </v-toolbar>

      <v-list class="mt-3" dense>
        <!-- <v-divider></v-divider> -->

        <v-list-tile
          v-for="item in items"
          :key="item.title"
          :to="{name: item.link}"
        >
          <!-- class="pa-2" -->
          <v-list-tile-action>
            <v-icon>{{ item.icon }}</v-icon>
          </v-list-tile-action>

          <v-list-tile-content>
            <v-list-tile-title>{{ item.title }}</v-list-tile-title>
          </v-list-tile-content>
        </v-list-tile>
      </v-list>
    </v-navigation-drawer>
  <!-- </v-card> -->
  </div>
</template>


<script>
  export default {
    data () {
      return {
        drawer: true,
        items: [
          { title: 'Dashboard', icon: 'dashboard', link: 'AdminDashboard' },
          { title: 'Employees', icon: 'account_circle', link: 'AdminEmployees' },
          { title: 'Departments', icon: 'account_balance', link: 'AdminEmployees' },
          { title: 'Attendance', icon: 'fingerprint', link: 'AdminEmployees' },
          { title: 'Payroll', icon: 'attach_money', link: 'AdminEmployees' },
          { title: 'Alerts', icon: 'notification_important', link: 'AdminEmployees' },
          { title: 'Leave Management', icon: 'time_to_leave', link: 'AdminEmployees' },
        ],
        right: null
      }
    },
        created() {
        this.$store.dispatch('getSettings');
        // this.$store.dispatch('setUser');
    },
        computed:{
        settings(){
            return this.$store.getters.settings
        },
        // user(){
        //     return this.$store.getters.         user
        // }
    }
  }
</script>

