<template>
<div>
    <v-container class="hidden-xs-only" v-for="(setting, i) in settings" v-bind:key="i">

    <v-card>
        <v-toolbar :color="setting.app_color_accent" dark>
          <v-toolbar-title class="text-xs-center">My Team</v-toolbar-title>
          <v-spacer></v-spacer>
            <a href="#" class="seeAll">
                <span>
                    See All
                </span>
            </a>
        </v-toolbar>

  <v-carousel
  height="235"
  light
  hide-delimiters
  >
    <v-carousel-item
        v-for="(member,i) in members"
        :key="i"
    >
        <v-container class="carouselContainer">
            <v-layout wrap row>
                <v-flex md5 lg3>

           <v-avatar
            size="100px"
            >
             <img
                :src="member.avatar"
                alt="Avatar"
              >
            </v-avatar>
                </v-flex>
                <v-flex md7 lg9>
                <h3>{{ member.title }}</h3>
                <h5>{{ member.jobRole }} | {{ member.department }}</h5>
                <h5>{{ member.phone }}</h5>
                <h5>{{ member.email }}</h5>
                </v-flex>
            </v-layout>
        </v-container>
    </v-carousel-item>
  </v-carousel>
    </v-card>
    </v-container>
    </div>
</template>


<script>
export default {
    data(){
        return{
                        members: [
                {
            title: 'Akshay Manoj',
            avatar: 'https://cdn.vuetifyjs.com/images/lists/1.jpg' ,
            jobRole: 'Developer',
            department: 'Development',
            phone: '33333333',
            email: 'akshay@alhaddadits.com',
        },
        {
            title: 'Rajeev Indusha',
            avatar: 'https://cdn.vuetifyjs.com/images/lists/2.jpg' ,
            jobRole: 'Salesman',
            department: 'Sales',
            phone: '33333333',
            email: 'rajeev@alhaddadits.com',
        },
        {
            title: 'Valli Ramanathan',
            avatar: 'https://cdn.vuetifyjs.com/images/lists/3.jpg' ,
            jobRole: 'Developer',
            department: 'Development',
            phone: '33333333',
            email: 'valli@alhaddadits.com',
        },
        {
            title: 'Julie',
            avatar: 'https://cdn.vuetifyjs.com/images/lists/4.jpg',
            jobRole: 'Operation Manager',
            department: 'Operations',
            phone: '33333333',
            email: 'julie@alhaddadits.com',
         }
            ]
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
.carouselContainer {
    padding-left: 100px;
    padding-right: 100px;
    padding-top: 60px;
}
.myAvatar{
    float: left;
}
.myDetails{
    float: right;
}
</style>
