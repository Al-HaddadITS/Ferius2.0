<template>
<div>

    <v-toolbar  app clipped-left v-for="(setting, i) in settings" v-bind:key="i" dark :color="setting.app_color" flat fixed>
      <v-toolbar-side-icon @click.stop="toggleNav()"></v-toolbar-side-icon>
      <!-- <span class="title ml-3 mr-5">Google&nbsp;<span class="font-weight-light">Keep</span></span> -->

      <v-spacer></v-spacer>
<!-- <v-toolbar-title>{{ pageTitle }}</v-toolbar-title> -->
<v-toolbar-title class="hidden-sm-and-down">
    <div class="marquee">
        <MarqueeText :duration="30">
            <span class="marqueeSpan" v-for="item in news" :key="item.id">
            NEWS: {{ item.value }}
            </span>
        </MarqueeText>
    </div>
</v-toolbar-title>
<v-spacer></v-spacer>
<!-- <v-toolbar-items class="hidden-sm-and-down"> -->
<v-toolbar-items>

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
              <v-list-tile-title>{{ UserName }}</v-list-tile-title>
            </v-list-tile-content>
            <v-icon right>arrow_drop_down</v-icon>
          </v-list-tile>
        </v-list>
</v-btn>
<v-list>
        <v-list-tile
          v-for="(item, index) in items"
          :key="index"
          :to="{name: item.link}"
        >
          <v-list-tile-title>{{ item.title }}</v-list-tile-title>
        </v-list-tile>
        <v-list-tile @click="logout()">
            Logout
        </v-list-tile>
      </v-list>

</v-menu>
</v-toolbar-items>

    </v-toolbar>
</div>
</template>


<script>
import MarqueeText from 'vue-marquee-text-component'
export default {
      components: {
    MarqueeText
  },
    // props: [
    //     'user'
    // ],
    data(){
        return{
            UserName: '',
            items: [
        { title: 'System Settings' , link: 'AdminDashboard'},
        { title: 'Change Password' , link: 'AdminDashboard'},
      ],
      news: [
          {
              id: '1',
              value: 'HRMS 2.0 to be released soon'
              },
          {
              id: '2',
              value: 'Al-Haddad ITS first Trillion Dollar Company in Bahrain'
              },
          {
              id: '3',
              value: 'In celebration of new years, Al-Haddad ITS is throwing a gathering party'
              },
      ]
        }
    },
        created() {
        this.$store.dispatch('getSettings')
        // this.$store.dispatch('setUser')

    },
        computed:{
            user(){
                return this.$store.getters.user
            },
        settings(){
            return this.$store.getters.settings
        },
        pageTitle(){
            return this.$store.getters.pageTitle
        }
        },
        watch: {
            user: function(val){
                this.UserName = this.user.name
            }
        },
        methods:{
            logout(){
                this.$store.dispatch('logout')
                .then(res =>{
                    this.$router.push('/')
                })
                .catch(err => {
                    console.log(err)
                })
        },
        toggleNav(){
            this.$store.dispatch('toggleNav')
        }
        }
}
</script>

<style scoped>
.marquee{
    font-size: 15px;
}
.marqueeSpan{
        margin-right: 700px;
}
</style>
