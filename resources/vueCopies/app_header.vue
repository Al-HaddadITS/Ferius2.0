<template>
<div>
  <v-toolbar v-for="(setting, i) in settings" v-bind:key="i"
  dark
  flat
  :color="setting.app_color"
  fixed
  app
  >

  <!-- class="topBar" -->
    <!-- <v-toolbar-side-icon @click.stop="toggleNav()"></v-toolbar-side-icon> -->
    <v-spacer></v-spacer>
    <v-toolbar-title>{{ setting.app_name }} - {{ page_title }}</v-toolbar-title>
    <v-spacer></v-spacer>
    <v-toolbar-items class="hidden-sm-and-down">
        <!-- <v-menu offset-y open-on-hover>
      <v-btn
        slot="activator"
        flat
      >
        {{ user.name }}
        <v-icon right>arrow_drop_down</v-icon>
      </v-btn>
      <v-list>
        <v-list-tile
          v-for="(item, index) in items"
          :key="index"
        >
          <v-list-tile-title>{{ item.title }}</v-list-tile-title>
        </v-list-tile>
      </v-list>
    </v-menu> -->
<v-menu offset-y open-on-hover>
    <v-btn
        slot="activator"
        flat
      >
        <v-list class="pa-0 transparent">
          <v-list-tile avatar>
            <v-list-tile-avatar>
              <img src="https://randomuser.me/api/portraits/lego/5.jpg">
            </v-list-tile-avatar>

            <v-list-tile-content>
              <v-list-tile-title>{{ user.name }}</v-list-tile-title>
            </v-list-tile-content>
          </v-list-tile>
        </v-list>
</v-btn>
<v-list>
        <v-list-tile
          v-for="(item, index) in items"
          :key="index"
        >
          <v-list-tile-title>{{ item.title }}</v-list-tile-title>
        </v-list-tile>
      </v-list>

</v-menu>

    </v-toolbar-items>
    <!-- <v-toolbar-items class="hidden-sm-and-down">

      <v-btn flat @click="logout()">Logout</v-btn>
    </v-toolbar-items> -->
  </v-toolbar>
</div>
</template>


<script>
export default {
    props: [
        'page_title',
        'user'
    ],
    data(){
        return{
            items: [
        { title: 'System Settings' },
        { title: 'Change Password' },
        { title: 'Logout' }
      ]
        }
    },
    created() {
        this.$store.dispatch('getSettings');
        // this.$store.dispatch('setUser');
    },
    methods: {
        // fetchSettings(){
        //     this.
        // },
        logout(){
            axios.post('logout')
                .then(res => {
                    window.location.href = '/';
                    console.log(res);
                })
                .catch(err =>{
                    console.log(err);
                })
        },
        toggleNav(){
            this.$store.dispatch('toggleNav')
        }
    },
    computed:{
        settings(){
            return this.$store.getters.settings
        },
        // user(){
        //     return this.$store.getters.user
        // }
    }
}
</script>

<style scoped>
.topBar{
      background: #00838F;
    background: -webkit-linear-gradient(to right, #00838F, #00ACC1, #00897B);
    background: linear-gradient(to right, #00838F, #00ACC1, #00897B);
}
</style>
