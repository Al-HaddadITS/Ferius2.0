<template>
    <div>
<v-container fluid v-for="(setting, i) in settings" v-bind:key="i">
                        <!-- <v-layout align-center row spacer text-xs-center>
                <v-flex xs12 sm3>
 <v-icon>home</v-icon>
            </v-flex>

          <v-flex sm9 hidden-xs-only style="text-align: left">
            <strong>DASHBOARD</strong>
          </v-flex>

            </v-layout>
<br> -->

<v-layout align-center row spacer  text-xs-center>
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

            </v-layout>
            <br>
<div class="cards-container">
    <div v-for="(card, i) in cards" v-bind:key="i">

                        <cards :data-image="card.image">
                          <h1 slot="header">{{ card.header }}</h1>
                          <p slot="content">{{ card.content }}</p>
                        </cards>
    </div>
</div>
<br>
<template >
    <div style="text-align: center;" class="hidden-xs-only">
         <v-btn class="CallBtn" v-for="(btn, i) in btns" v-bind:key="i" outline :color="setting.app_color_accent">{{ btn.title }}</v-btn>
    </div>
</template>


</v-container>
    </div>
</template>


<script>
const fb = require('../../../firebaseConfig.js')
export default {
    data(){
        return{
            comp_name: 'Al-HADDAD ITS',
            compImage: '',
            cards: [
                {
                    image: 'http://www.workplacegroup.com/wp-content/uploads/2014/03/happy-employees.jpg',
                    header: '20',
                    content: 'Employees'
                },
                {
                    image: 'https://music.princeton.edu/sites/default/files/styles/homepage_slider/public/images/20170908_lca_dja011_1.jpg?itok=kRVM26yC',
                    header: '5',
                    content: 'Departments'
                },
                {
                    image: 'https://www.gannett-cdn.com/-mm-/a0a28bd666af6d80b33247a358069ae6b7ce0cc4/c=0-108-2121-1306/local/-/media/2018/07/05/NJGroup/AsburyPark/636663840922681675-vacation-1.jpg?width=3200&height=1680&fit=crop',
                    header: '4',
                    content: 'Leave Request'
                },
                {
                    image: 'https://d2v9y0dukr6mq2.cloudfront.net/video/thumbnail/6XM6EYJ/terrible-headache-disturbing-work-office-program-businessman-feeling-sick_e_mcbchil__F0009.png',
                    header: '3',
                    content: 'Absent Today'
                }
            ],
            btns:[
                {title: 'Request Leave'},
                {title: 'Print Payslip'},
                {title: 'View Employees'},
                {title: 'View Calendar'},
            ],
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

