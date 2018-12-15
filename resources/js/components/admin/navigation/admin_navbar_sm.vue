<template>
  <!-- <v-card height="350px"> -->
      <div>
    <v-navigation-drawer
    v-for="(setting, i) in settings" v-bind:key="i"
      v-model="drawer"
      permanent
      absolute
      dark
      floating
      :mini-variant.sync="mini"
      :class="setting.app_color"
    >
      <!-- width="230" -->
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

      <v-list class="mt-5" dense>
        <!-- <v-divider></v-divider> -->

        <v-list-tile
          v-for="item in items"
          :key="item.title"
          :href="item.link"
        >
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
          { title: 'Dashboard', icon: 'dashboard', link: '/' },
          { title: 'Employees', icon: 'account_circle', link: '/admin/employees' },
          { title: 'Departments', icon: 'account_balance', link: '/admin/departments' },
          { title: 'Attendance', icon: 'fingerprint', link: '/admin/' },
          { title: 'Payroll', icon: 'attach_money', link: '/admin/' },
          { title: 'Alerts', icon: 'notification_important', link: '/admin/' },
          { title: 'Leave Management', icon: 'time_to_leave', link: '/admin/' },
        ],
        right: null,
        mini: true,
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
