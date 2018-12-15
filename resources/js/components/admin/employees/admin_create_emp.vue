<template>
<v-container fluid>
  <v-stepper v-model="e6"  v-for="(setting, i) in settings" v-bind:key="i">
      <v-stepper-header>
    <v-stepper-step :complete="e6 > 1" step="1" :color="setting.app_color_accent">
      Employee Information
      <!-- <small>Summarize if needed</small> -->
    </v-stepper-step>
<v-stepper-step :complete="e6 > 2" step="2" :color="setting.app_color_accent">Contract Details</v-stepper-step>
<v-stepper-step :complete="e6 > 3" step="3" :color="setting.app_color_accent">Upload Documents</v-stepper-step>
<v-stepper-step step="4"  :color="setting.app_color_accent">Review Contract</v-stepper-step>
      </v-stepper-header>

      <v-stepper-items>
    <v-stepper-content step="1">
      <v-card class="mb-5" flat >
                        <v-form >
          <v-container>
              <v-layout row wrap>
                  <v-flex md6>
    <v-text-field
      label="First Name"
      v-model="Fname"
      outline
      :color="setting.app_color_accent"
      clearable
      append-icon="fas fa-user"
    ></v-text-field>
      <!-- :counter="10" -->
                  </v-flex>
                  <v-flex md6>
    <v-text-field
      label="Last Name"
      v-model="Lname"
      outline
      :color="setting.app_color_accent"
      clearable
      append-icon="fas fa-user"
    ></v-text-field>
                  </v-flex>
              </v-layout>
              <v-layout row wrap>
                  <v-flex md6>
    <v-text-field
      label="Email"
      v-model="email"
      outline
      :color="setting.app_color_accent"
      clearable
      append-icon="fas fa-id-card"
    ></v-text-field>
          <!-- return-masked-value
    mask="###.###.###-##" -->
      <!-- :counter="10" -->
                  </v-flex>
                  <v-flex md6>

      <v-menu
      :close-on-content-click="false"
        v-model="menu"
        :nudge-right="40"
        lazy
        transition="scale-transition"
        offset-y
        full-width
        min-width="290px"
        :color="setting.app_color_accent"
      >
        <v-text-field
          slot="activator"
          v-model="dob"
          label="Date of Birth"
          append-icon="event"
          outline
          :color="setting.app_color_accent"
          readonly
        ></v-text-field>
        <v-date-picker landscape v-model="dob" @input="menu = false" :color="setting.app_color_accent"></v-date-picker>
      </v-menu>

                  </v-flex>
              </v-layout>
              <v-layout row wrap>
                  <v-flex md6>
        <v-autocomplete
          :items="gender"
          label="Gender"
          clearable
          outline
          :color="setting.app_color_accent"
          v-model="genders"
          append-icon="fas fa-male"
          :menu-props="{'offset-y': true}"
        ></v-autocomplete>
      <!-- :counter="10" -->
                  </v-flex>
                  <v-flex md6>

        <v-autocomplete
          :items="countries"
          label="Place of Birth"
          clearable
          outline
          :color="setting.app_color_accent"
          v-model="pob"
          append-icon="fas fa-globe"
          :menu-props="{'offset-y': true}"
        ></v-autocomplete>

                  </v-flex>
              </v-layout>
              <v-layout row wrap>
                  <v-flex md6>
        <v-autocomplete
          :items="countries"
          label="Nationality"
          clearable
          outline
          :color="setting.app_color_accent"
          v-model="nationality"
          append-icon="fas fa-flag"
          :menu-props="{'offset-y': true}"
        >
        </v-autocomplete>

      <!-- :counter="10" -->
                  </v-flex>
                  <v-flex md6>

    <v-text-field
      label="Religion"
      v-model="religion"
      outline
      :color="setting.app_color_accent"
      clearable
      append-icon="fas fa-church"
    ></v-text-field>

                  </v-flex>
              </v-layout>
              <v-layout row wrap>
                  <v-flex md6>
        <v-autocomplete
          :items="maritals"
          label="Marital Status"
          clearable
          outline
          :color="setting.app_color_accent"
          v-model="marital"
          append-icon="fas fa-ring"
          :menu-props="{'offset-y': true}"
        ></v-autocomplete>
      <!-- :counter="10" -->
                  </v-flex>
                  <v-flex md6>

    <v-text-field
      label="Spouse Name"
      v-model="spouseName"
      outline
      :color="setting.app_color_accent"
      clearable
      append-icon="fas fa-church"
    ></v-text-field>

                  </v-flex>
              </v-layout>
              <v-layout row wrap>
                  <v-flex md6>
          <v-text-field
      label="ID Number"
      v-model="ID_no"
      outline
      :color="setting.app_color_accent"
      clearable
      append-icon="fas fa-id-card"
    ></v-text-field>
      <!-- :counter="10" -->
                  </v-flex>
                  <v-flex md6>

     <v-menu
      :close-on-content-click="false"
        v-model="menu2"
        :nudge-right="40"
        lazy
        transition="scale-transition"
        offset-y
        full-width
        min-width="290px"
        :color="setting.app_color_accent"
      >
        <v-text-field
          slot="activator"
          v-model="idExpiry"
          label="ID Expiry Date"
          append-icon="event"
          outline
          :color="setting.app_color_accent"
          readonly
        ></v-text-field>
        <v-date-picker landscape v-model="idExpiry" @input="menu2 = false" :color="setting.app_color_accent"></v-date-picker>
      </v-menu>

                  </v-flex>
              </v-layout>
              <v-layout row wrap>
                  <v-flex md6>
          <v-text-field
      label="VISA Number"
      v-model="visaNo"
      outline
      :color="setting.app_color_accent"
      clearable
      append-icon="fas fa-id-card"
    ></v-text-field>
      <!-- :counter="10" -->
                  </v-flex>
                  <v-flex md6>

     <v-menu
      :close-on-content-click="false"
        v-model="menu3"
        :nudge-right="40"
        lazy
        transition="scale-transition"
        offset-y
        full-width
        min-width="290px"
        :color="setting.app_color_accent"
      >
        <v-text-field
          slot="activator"
          v-model="visaExpiry"
          label="VISA Expiry Date"
          append-icon="event"
          outline
          :color="setting.app_color_accent"
          readonly
        ></v-text-field>
        <v-date-picker landscape v-model="visaExpiry" @input="menu3 = false" :color="setting.app_color_accent"></v-date-picker>
      </v-menu>

                  </v-flex>
              </v-layout>
              <v-layout row wrap>
                  <v-flex md6>
          <v-text-field
      label="Passport Number"
      v-model="passportNo"
      outline
      :color="setting.app_color_accent"
      clearable
      append-icon="fas fa-id-card"
    ></v-text-field>
      <!-- :counter="10" -->
                  </v-flex>
                  <v-flex md6>

     <v-menu
      :close-on-content-click="false"
        v-model="menu4"
        :nudge-right="40"
        lazy
        transition="scale-transition"
        offset-y
        full-width
        min-width="290px"
        :color="setting.app_color_accent"
      >
        <v-text-field
          slot="activator"
          v-model="passportIssue"
          label="Passport Date of Issue"
          append-icon="event"
          outline
          :color="setting.app_color_accent"
          readonly
        ></v-text-field>
        <v-date-picker landscape v-model="passportIssue" @input="menu4 = false" :color="setting.app_color_accent"></v-date-picker>
      </v-menu>

                  </v-flex>
              </v-layout>
              <v-layout row wrap>
                  <v-flex md6>
     <v-menu
      :close-on-content-click="false"
        v-model="menu5"
        :nudge-right="40"
        lazy
        transition="scale-transition"
        offset-y
        full-width
        min-width="290px"
        :color="setting.app_color_accent"
      >
        <v-text-field
          slot="activator"
          v-model="passportExpiry"
          label="Passport Date of Issue"
          append-icon="event"
          outline
          :color="setting.app_color_accent"
          readonly
        ></v-text-field>
        <v-date-picker landscape v-model="passportExpiry" @input="menu5 = false" :color="setting.app_color_accent"></v-date-picker>
      </v-menu>
      <!-- :counter="10" -->
                  </v-flex>
                  <v-flex md6>

        <v-autocomplete
          :items="countries"
          label="Passport Place of Issue"
          clearable
          outline
          :color="setting.app_color_accent"
          v-model="passportPOI"
          append-icon="fas fa-ring"
          :menu-props="{'offset-y': true}"
        ></v-autocomplete>

                  </v-flex>
              </v-layout>
              <v-layout row wrap>
                  <v-flex md6>
                      <v-autocomplete
          :items="countries"
          label="Country of Residence"
          clearable
          outline
          :color="setting.app_color_accent"
          v-model="residence"
          append-icon="fas fa-ring"
          :menu-props="{'offset-y': true}"
        >
                      </v-autocomplete>
                  </v-flex>
                  <v-flex>
    <v-text-field
      label="Mobile Number"
      v-model="mobNo"
      outline
      :color="setting.app_color_accent"
      clearable
      :prefix="countryCode"
      append-icon="fas fa-id-card"
    ></v-text-field>
                  </v-flex>
              </v-layout>
              <v-layout row wrap>
                  <v-flex md6>
                         <v-text-field
      label="Secondary Number"
      v-model="secNo"
      outline
      :color="setting.app_color_accent"
      clearable
      :prefix="countryCode"
      append-icon="fas fa-id-card"
    ></v-text-field>
                  </v-flex>
                  <v-flex md6>
                         <v-text-field
      label="Telephone Number"
      v-model="telNo"
      outline
      :color="setting.app_color_accent"
      clearable
      :prefix="countryCode"
      append-icon="fas fa-id-card"
    ></v-text-field>
                  </v-flex>
              </v-layout>
              <v-layout row wrap>
                  <v-flex xs12>
                      <!-- <v-textarea
                      outline
                      label="Address"
                      :color="setting.app_color_accent"
                      clearable
                      v-model="address"
                      full-width
                      ></v-textarea> -->
                              <v-textarea
          outline
          label="Address"
          :color="setting.app_color_accent"
          v-model="address"
        ></v-textarea>
                  </v-flex>
              </v-layout>
          </v-container>
  </v-form>
      </v-card>
      <v-btn @click="e6 = 2" :color="setting.app_color_accent" dark>Continue</v-btn>
      <v-btn flat @click="$router.go(-1)">Cancel</v-btn>
    </v-stepper-content>



    <v-stepper-content step="2">
      <v-card class="mb-5" flat color="grey lighten-5">
          <v-form>
              <v-container>
                  <v-layout row wrap>
                      <v-flex></v-flex>
                  </v-layout>
              </v-container>
          </v-form>
      </v-card>
      <v-btn @click="e6 = 3" :color="setting.app_color_accent" dark>Continue</v-btn>
      <v-btn flat @click="e6 = 1">back</v-btn>
    </v-stepper-content>



    <v-stepper-content step="3">
      <v-card color="grey lighten-1" class="mb-5" height="200px"></v-card>
      <v-btn @click="e6 = 4" :color="setting.app_color_accent" dark>Continue</v-btn>
      <v-btn flat @click="e6 = 2">back</v-btn>
    </v-stepper-content>


    <v-stepper-content step="4">
      <v-card color="grey lighten-1" class="mb-5" height="200px"></v-card>
      <v-btn @click="e6 = 1" :color="setting.app_color_accent" dark>Continue</v-btn>
      <v-btn flat @click="e6 = 3">back</v-btn>
    </v-stepper-content>
      </v-stepper-items>
  </v-stepper>
  </v-container>
</template>

<script>
  export default {
    data () {
      return {
        e6: 1,
        Fname: '',
        Lname: '',
        nationality: '',
        ID_no: '',
        visaNo: '',
        passportNo: '',
        passportPOI: '',
        idExpiry: null,
        visaExpiry: null,
        passportIssue: null,
        passportExpiry: null,
         dob: null,
         pob: '',
         email: '',
         genders: '',
         religion: '',
         spouseName: '',
         address: '',
      marital: '',
      menu: false,
      menu2: false,
      menu3: false,
      menu4: false,
      menu5: false,
      gender: ['Male' , 'Female'],
      maritals: ['Single' , 'Married', 'Separated', 'Widowed', 'Divorced'],
      countries: [],
      mobNo: '',
      secNo: '',
      telNo: '',
      countryCode: null,
      residence: '',
      countryDB: null
      }
    },
    created(){
        this.$store.dispatch('SetPageTitle',  'Create New Contract')
        this.getCountriesList()
    },
        computed:{
              settings(){
            return this.$store.getters.settings
        },
        fullName(){
            if(!this.Fname && !this.Lname){
                return null
            }
            else{
                return this.Fname+' '+this.Lname
            }
        }
        },
        watch:{

            residence: function(){
                if(this.residence){

                    const cdb = this.countryDB
                    cdb.forEach(item => {
                        if(item.name == this.residence){
                            item.callingCodes.forEach(cc =>{
                                this.countryCode = '+'+cc
                            })
                        }
                    })
                }
                else{
                    this.countryCode = ''
                }
            },
            fullName: function(val){
                if(!val){
                    this.$store.dispatch('SetPageTitle',  'Create New Contract')
                }
                else{
                    if(!this.Fname){
                        this.Fname = ''
                    }
                    if(!this.Lname){
                        this.Lname = ''
                    }
                    this.$store.dispatch('SetPageTitle',  'Create New Contract for ' + val)
                }
            }
        },
         methods: {
            //  changeCountryCode(val){
            //      console.log(val)
            //  },

    getCountriesList: function() {

            fetch('https://restcountries.eu/rest/v1/all')
                .then(res => res.json())
                .then(res => {
                    this.countryDB = res
                    res.forEach(item => {
                        this.countries.push(item.name)
                    });
                })


    }
  },
  }
</script>
