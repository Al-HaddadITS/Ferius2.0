<template>
    <div>
        <v-container v-for="(setting, i) in settings" v-bind:key="i">
    <div class="body">
                    <!-- <v-layout align-center row spacer  text-xs-center>
                        <v-flex xs12 sm3>
            <v-avatar
            size="36px"
            >
             <img
                :src="compImage"
                alt="Avatar"
              >
            </v-avatar>
            </v-flex>

          <v-flex sm9 hidden-xs-only style="text-align: left">
            <strong v-html="comp_name"></strong>
          </v-flex>

            </v-layout> -->
            <!-- <br> -->

<template>
  <v-layout row>
    <v-flex>
      <v-card>
        <v-toolbar :color="setting.app_color_accent" dark>
          <v-toolbar-title class="text-xs-center">Action Center</v-toolbar-title>
          <v-spacer></v-spacer>
            <a href="#" class="seeAll">
                <span>
                    See All
                </span>
            </a>
        </v-toolbar>
        <!-- <v-divider></v-divider> -->

        <v-list
        three-line
        class="actionCenter"
        >

          <v-list-tile
            v-for="item in items"
            :key="item.title"
            avatar
          >

            <v-list-tile-avatar>
              <img :src="item.avatar">
            </v-list-tile-avatar>

            <v-list-tile-content>
              <v-list-tile-title v-html="item.title"></v-list-tile-title>
              <v-list-tile-sub-title v-html="item.subtitle"></v-list-tile-sub-title>
            </v-list-tile-content>

            <v-list-tile-action>
              <v-icon :color="setting.app_color_accent">folder_open</v-icon>
            </v-list-tile-action>
          </v-list-tile>
        </v-list>



      </v-card>
    </v-flex>
  </v-layout>
</template>

    </div>
        </v-container>
    </div>
</template>

<script>
const fb = require('../../../firebaseConfig.js')
export default {
    data(){
        return{
            comp_name: 'Al-HADDAD ITS',
            items: [
        {
            title: 'Akshay Manoj',
            avatar: 'https://cdn.vuetifyjs.com/images/lists/1.jpg' ,
            subtitle: "Requesting new leave"
        },
        {
            title: 'Rajeev Indusha',
            avatar: 'https://cdn.vuetifyjs.com/images/lists/2.jpg' ,
            subtitle: "Birthday is today"
        },
        {
            title: 'Valli Ramanathan',
            avatar: 'https://cdn.vuetifyjs.com/images/lists/3.jpg' ,
            subtitle: "Visa is due Expire on 14 December 2018 Friday"
        },
        {
            title: 'Julie',
            avatar: 'https://cdn.vuetifyjs.com/images/lists/4.jpg',
            subtitle: "Submitted a Sick Leave Document"
         },
        {
            title: 'Rajeev Indusha',
            avatar: 'https://cdn.vuetifyjs.com/images/lists/2.jpg',
            subtitle: "Submitted a Sick Leave Document"
         },
         {
            title: 'Valli Ramanathan',
            avatar: 'https://cdn.vuetifyjs.com/images/lists/1.jpg' ,
            subtitle: "Requesting new leave"
        },
        ],
        compImage: ''
        }
    },
    created(){
        const storage = fb.storage;
        storage.refFromURL('gs://feriushrms-3a84b.appspot.com/company/SmallLogo.png').getDownloadURL()
            .then(url => {
                this.compImage = url
            })
            .catch(error => {
                console.log(error)
            })


    },
    computed:{
              settings(){
            return this.$store.getters.settings
        }
    }
}
</script>

<style scoped>
.actionCenter{
        max-height: 370px;
    overflow-y: auto;
    height: 370px;
}
</style>
