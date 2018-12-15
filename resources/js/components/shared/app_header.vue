<template>
<div>

    <v-toolbar  app clipped-left v-for="(setting, i) in settings" v-bind:key="i" dark :color="setting.app_color" flat fixed>
      <v-toolbar-side-icon @click.stop="toggleNav()"></v-toolbar-side-icon>
      <!-- <span class="title ml-3 mr-5">Google&nbsp;<span class="font-weight-light">Keep</span></span> -->

      <v-spacer></v-spacer>
<!-- <v-toolbar-title>{{ setting.app_name }} - {{ page_title }}</v-toolbar-title> -->
<v-toolbar-title class="pageTitle">{{ pageTitle }}</v-toolbar-title>
<v-spacer></v-spacer>
<v-toolbar-items class="hidden-sm-and-down">

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
            <v-icon right>arrow_drop_down</v-icon>
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

    </v-toolbar>
</div>
</template>


<script>
export default {
    props: [
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
        this.$store.dispatch('getSettings')
    },
        computed:{
        settings(){
            return this.$store.getters.settings
        },
        pageTitle(){
            return this.$store.getters.pageTitle
        }
        },
        methods:{
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
        }
}
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css?family=Lora:400i');
.pageTitle{
    font-family: 'Lora', serif;
        font-size: 28px;
}
</style>
