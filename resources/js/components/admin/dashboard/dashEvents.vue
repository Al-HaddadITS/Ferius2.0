<template>
    <div>
<v-container v-for="(setting, i) in settings" v-bind:key="i">
 <!-- <v-layout align-center row spacer text-xs-center>
                <v-flex xs12 sm3>
 <v-icon>calendar_today</v-icon>
            </v-flex>

          <v-flex sm9 hidden-xs-only style="text-align: left">
            <strong>EVENTS</strong>
          </v-flex>

            </v-layout>

<br> -->
<template>
  <v-layout row>
    <v-flex>
      <v-card>
        <v-toolbar :color="setting.app_color_accent" dark>
          <v-toolbar-title class="text-xs-center">Upcoming Events</v-toolbar-title>
          <v-spacer></v-spacer>
            <a href="#" class="seeAll">
                <span>
                    See All
                </span>
            </a>
        </v-toolbar>
        <!-- <v-divider></v-divider> -->

        <v-list
        two-line
        class="events"
        >

          <v-list-tile
            v-for="item in items"
            :key="item.title"
          >

            <!-- avatar -->
            <!-- <v-list-tile-avatar>
              <img :src="item.avatar">
            </v-list-tile-avatar> -->

            <v-list-tile-content>
              <v-list-tile-title v-html="item.title"></v-list-tile-title>
              <v-list-tile-sub-title v-html="item.subtitle"></v-list-tile-sub-title>
            </v-list-tile-content>

            <v-list-tile-action>
              <v-icon :color="setting.app_color_accent">info</v-icon>
            </v-list-tile-action>
          </v-list-tile>
        </v-list>



      </v-card>
    </v-flex>
  </v-layout>
</template>



</v-container>
    </div>
</template>


<script>
export default {
    data(){
        return{
    items: [
        {
            title: 'Rajeev Indusha Birthday',
            subtitle: "12 December 2018"
        },
        {
            title: 'Valli Ramanathan Visa Expiry',
            subtitle: "14 December 2018"
        },
        {
            title: 'Bahrain National Day',
            subtitle: "16 December 2018"
        },
        {
            title: 'New Years',
            subtitle: "01 January 2019"
        },
        ],
        todayDate: ''
        }
    },
    computed:{
              settings(){
            return this.$store.getters.settings
        }
    }
}
</script>

<style scoped>
.events{
    max-height: 240px;
    overflow-y: auto;
    height: 240px;
}
</style>
