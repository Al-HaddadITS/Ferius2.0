<template>
  <div>
      <div v-for="(setting, i) in settings" v-bind:key="i">
      <v-toolbar class="elevation-2 pa-0 ma-0 filterToolbar"  height="55" dense>
          <v-layout align-center justify-center row fill-height class="px-0 mx-0">


<v-menu offset-y>
      <v-btn
        slot="activator"
        :color="setting.app_color_accent"
        dark
        round
        width="120"
      >
        {{ statusFiltered || "Status" }}
        <v-icon right dark>arrow_drop_down</v-icon>
      </v-btn>
      <v-list>
        <v-list-tile
          v-for="(statusFilter, index) in empStatusFilter"
          :key="index"
        >
          <v-list-tile-title @click="changeStatusFilter(statusFilter.title)" style="cursor: pointer;">{{ statusFilter.title }}</v-list-tile-title>
        </v-list-tile>
      </v-list>
    </v-menu>


        <v-spacer></v-spacer>
              <v-divider
        class="mx-2"
        inset
        vertical
      ></v-divider>
                    <v-text-field
        v-model="search"
        append-icon="search"
        label="Search..."
        single-line
        hide-details
        box
      ></v-text-field>
          </v-layout>
      </v-toolbar>
      <v-container fluid >

<v-layout wrap row>

<!-- <v-flex md4 lg3> -->
<!-- </v-flex> -->

<v-flex xs12>




    <v-card>
        <v-toolbar :color="setting.app_color_accent" dark>
          <v-toolbar-title class="text-xs-center">My Employees</v-toolbar-title>
          <v-spacer></v-spacer>

        <!-- <v-btn outline :to="{name: 'AdminEmployeesCreate'}" v-if="addEmployee">Add New Employee</v-btn> -->



        </v-toolbar>

    <v-data-table
      :headers="headers"
      :search="search"
      :items="myDepEmps"
      :loading="loading"
      class="pa-4"
    >
    <v-progress-linear slot="progress" :color="setting.app_color_accent" indeterminate></v-progress-linear>
      <template slot="items" slot-scope="props">
          <tr @click="openDialog(props.item.id)"  style="cursor: pointer;">
        <td>{{ props.item.EmpID }}</td>
        <td>{{ props.item.Fname }}</td>
        <td>{{ props.item.Lname }}</td>
        <td>{{ props.item.JobTitle }}</td>
        <!-- <td>{{ props.item.department.name }}</td> -->
        <td>{{ depName }}</td>
</tr>
      </template>
            <v-alert slot="no-results" :value="true" color="error" icon="warning">
        Your search for "{{ search }}" found no results.
      </v-alert>
    </v-data-table>
    </v-card>
</v-flex>
    </v-layout>
    </v-container>




<!-- <v-snackbar
      v-model="snackbars"
      right
      :timeout="timeout"
      top
      :color="setting.app_color_success"
    >
      {{ SnackText }}
      <v-btn
        color="white"
        flat
        @click="snackbars = false"
      >
        Close
      </v-btn>
    </v-snackbar> -->
    <v-dialog
      v-model="viewEmployeeDialog"
      scrollable
    >
          <!-- width="500" -->
    <v-card>
        <v-card-title
          class="headline white--text"
          :class="setting.app_color_accent"
          primary-title
        >
          <!-- {{ viewEmployee.Fname }} -->
          {{ fullName }} - {{ viewEmployee.EmpID }}
        </v-card-title>

        <v-card-text>
            <!-- {{ tempMethod(viewTemplates.temp) }} -->
            <!-- <div class="pre-formatted" v-html="viewTemplates.temp"> -->
            <!-- <div class="pre-formatted"> -->
            <div class="">
            <v-container>
                <v-layout row wrap>
                    <v-flex md3>
                                  <v-avatar
                          tile
                          size="150"
                          class="profilePic"
                          >
                         <img v-if="viewEmployee.profilePic" :src="viewEmployee.profilePic" alt="ProfilePicture">
                          </v-avatar>
                    </v-flex>
                    <v-flex md9>
                        <table class="table table-bordered table-responsive" style="width: 100%; display: table;">
                            <tbody>

                                <tr class="text-left">
                                    <td class="table_heading">
                                Email
                                    </td>
                                    <!-- <td style="min-width: 150px;"> -->
                                    <td>
                                {{ viewEmployee.email || ' - '}}
                                    </td>
                                    <td class="table_heading">
                                Date of Birth
                                    </td>
                                    <td>
                                {{ viewEmployee.dob || ' - '}}
                                    </td>
                                </tr>
                                <tr>
                                    <td class="table_heading">
                                Gender
                                    </td>
                                    <td>
                                {{ viewEmployee.gender || ' - '}}
                                    </td>
                                    <td class="table_heading">
                                ID Number
                                    </td>
                                    <td>
                                {{ viewEmployee.ID_no || ' - '}}
                                    </td>
                                </tr>
                                <tr>
                            <td class="table_heading">Nationality</td>
                            <td>{{ viewEmployee.nationality || ' - '}}</td>
                            <td class="table_heading">Marital Status</td>
                            <td>{{ viewEmployee.marital || ' - '}}</td>
                        </tr>
                                <tr>
                            <td class="table_heading">Passport Number</td>
                            <td>{{ viewEmployee.passportNo || ' - '}}</td>
                            <td class="table_heading">Mobile Number</td>
                            <td>{{ countryCode + ' ' + viewEmployee.mobNo || ' - '}}</td>
                        </tr>
                            </tbody>
                        </table>
                    </v-flex>
                </v-layout>
            <v-layout row wrap>
                <v-flex>

                <table class="table table-bordered table-responsive" style="width: 100%; display: table;">
                    <tbody>
                                <tr>
                            <td class="table_heading">Passport Date of Issue</td>
                            <td>{{ viewEmployee.passportIssue || ' - '}}</td>
                            <td class="table_heading">Passport Expiry Date</td>
                            <td>{{ viewEmployee.passportExpiry || ' - '}}</td>
                            <td class="table_heading">Passport Place of Issue</td>
                            <td>{{ viewEmployee.passportPOI || ' - '}}</td>
                        </tr>
                                <tr>
                            <td class="table_heading">ID Expiry Date</td>
                            <td>{{ viewEmployee.idExpiry || ' - '}}</td>
                            <td class="table_heading">VISA Number</td>
                            <td>{{ viewEmployee.visaNo || ' - '}}</td>
                            <td class="table_heading">VISA Expiry Date</td>
                            <td>{{ viewEmployee.visaExpiry || ' - '}}</td>
                        </tr>
                                <tr>
                            <td class="table_heading">Place of Birth</td>
                            <td>{{ viewEmployee.pob || ' - '}}</td>
                            <td class="table_heading">religion</td>
                            <td>{{ viewEmployee.religion || ' - '}}</td>
                            <td class="table_heading">Spouse Name</td>
                            <td>{{ viewEmployee.spouseName || ' - '}}</td>
                        </tr>
                                <tr>
                            <td class="table_heading">Country of Residence</td>
                            <td>{{ viewEmployee.residence || ' - '}}</td>
                            <td class="table_heading">Secondary Number</td>
                            <td>{{ countryCode + ' ' + viewEmployee.secNo || ' - '}}</td>
                            <td class="table_heading">Telephone Number</td>
                            <td>{{ countryCode + ' ' + viewEmployee.telNo || ' - '}}</td>
                        </tr>
                                <tr>
                            <td class="table_heading">Address</td>
                            <td colspan="5">
                                <div class="pre-formatted">{{ viewEmployee.address || ' - '}}</div>
                                </td>
                        </tr>
                    </tbody>
                </table>
                </v-flex>
            </v-layout>
            <v-layout row wrap>
                <v-flex>
                    <table class="table table-bordered table-responsive" style="width: 100%; display: table;">
                        <tbody>
                                                            <tr>
                            <td class="table_heading">Job Role</td>
                            <td>{{ viewEmployee.JobTitle || ' - '}}</td>
                            <td class="table_heading">Department</td>
                            <td>{{ depName || ' - '}}</td>
                            <td class="table_heading">Salary</td>
                            <td>{{ currency + ' ' + viewEmployee.salary || ' - '}}</td>
                        </tr>
                                                            <tr>
                            <td class="table_heading">Contract Date</td>
                            <td>{{ viewEmployee.contractDate || ' - '}}</td>
                            <td class="table_heading">Date of Joining</td>
                            <td>{{ viewEmployee.doj || ' - '}}</td>
                        </tr>
                        </tbody>
                    </table>
                </v-flex>
            </v-layout>
                              <!-- <v-layout row wrap>
                      <v-flex>
                                                    <v-btn class="uploadBTN" raised :color="setting.app_color_accent" dark>Resume</v-btn>
                          <span v-if="Resume">{{ ResumeFile.name }}</span>
                          <span v-else>No File Chosen</span>
                      </v-flex>
                  </v-layout> -->
</v-container>
            </div>
        </v-card-text>

        <v-divider></v-divider>

        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn
            :color="setting.app_color_success"
            flat
            @click="viewContract()"
          >
            View Contract
          </v-btn>
          <v-btn
            :color="setting.app_color_info"
            flat
          >
            Edit
          </v-btn>
          <v-btn
            :color="setting.app_color_error"
            flat
          >
            Delete
          </v-btn>
        </v-card-actions>
      </v-card>

    </v-dialog>


    <v-dialog
      v-model="viewTemplateDialog"
      scrollable
    >
    <v-card>
        <v-card-title
          class="headline white--text"
          :class="setting.app_color_accent"
          primary-title
        >
          {{ fullName }} - {{ viewEmployee.EmpID }}
        </v-card-title>

        <v-card-text>
            <div class="pre-formatted" v-html="templateUpdated">


            </div>
        </v-card-text>

        <v-divider></v-divider>

        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn
            :color="setting.app_color_accent"
            flat
            @click="viewTemplateDialog = false"
          >
            close
          </v-btn>
        </v-card-actions>
      </v-card>

    </v-dialog>




    <v-dialog
      v-model="waiting"
      hide-overlay
      persistent
      width="300"
    >
      <v-card
        :color="setting.app_color_secondary"
        dark
      >
        <v-card-text>
          Please stand by
          <v-progress-linear
            indeterminate
            color="white"
            class="mb-0"
          ></v-progress-linear>
        </v-card-text>
      </v-card>
    </v-dialog>




  </div>
  </div>
</template>

<script>
  export default {
    data: () => ({
        search: '',

      headers: [
        { text: 'Employee ID', value: 'EmpID'},
        { text: 'First Name', value: 'Fname' },
        { text: 'Last Name', value: 'Lname' },
        { text: 'Job Role', value: 'JobTitle' },
        { text: 'Department', value: 'department.name' },
      ],
      empStatusFilter: [
          {title:'Active'},
          {title:'Inactive'}
      ],
      statusFiltered: '',
      waiting: false,
      viewEmployeeDialog: false,
      countryCode: '',
      currency: '',
      depName: null,
      viewTemplateDialog: false,
      templateUpdated: '',
      addEmployee: false
    }),

    computed: {
                user(){
                return this.$store.getters.user
            },
                  myDetails(){
            return this.$store.getters.myDetails
        },
                allPermissions(){
            return this.$store.getters.allPermissions
        },
      formTitle () {
        return this.editedIndex === -1 ? 'New Department' : 'Edit Department'
      },
      settings(){
            return this.$store.getters.settings
        },
      emps(){
            return this.$store.getters.employees
        },
      myDepEmps(){
            return this.$store.getters.myDepartment.employee
        },
      loading(){
            return this.$store.getters.loading
        },
        viewEmployee(){
            return this.$store.getters.viewEmployee

        },
                fullName(){
            if(!this.viewEmployee.Fname && !this.viewEmployee.Lname){
                return null

            }
            else{
                return this.viewEmployee.Fname+' '+this.viewEmployee.Lname
            }
        },
    },
    watch: {
                 user: function(val){
                this.UserName = this.user.name
            },
        allPermissions: function(val){
            this.getAllPermissions()
        },
            viewEmployee(val){
                // if(val.department){
                //     this.depName = val.department.name
                // }
                fetch('https://restcountries.eu/rest/v1/all')
                .then(res => res.json())
                .then(res => {
                    setTimeout(() => (this.waiting = false), 100)
                    // setTimeout(() => (this.viewEmployeeDialog = true), 150)
                    res.forEach(item => {
                        if(item.name == this.viewEmployee.residence){
                                this.countryCode = '+'+item.callingCodes[0]
                                this.currency = item.currencies[0]
                        }
                    });
                })
    },
    myDetails: function(val){
                        if(val.department){
                    this.depName = val.department.name
                }
    }
    },


    created () {
        this.$store.dispatch('getSettings')
        this.$store.dispatch('setEmployees')
        this.$store.dispatch('SetPageTitle', 'Employees')
        this.$store.dispatch('myDetails')
        this.getAllPermissions()
    },

    methods: {
        getAllPermissions(){
            this.allPermissions.forEach(item => {
                if(item.name == "add employee"){
                    this.addEmployee = true
                }
            })
        },
viewContract(){
this.viewTemplateDialog = true

 let title
                 if(this.viewEmployee.gender == 'Male'){
                     title = 'Mr.'
                 }
                 else if(this.viewEmployee.gender == 'Female'){
                     if(this.viewEmployee.marital == 'Married'){
                         title='Mrs.'
                     }
                     else{
                         title='Ms.'
                     }
                 }
                 let template = this.viewEmployee.template.temp

                 template = template.replace('$contractDate', this.viewEmployee.contractDate)

                 template = template.replace('$fullName', this.fullName)

                 template = template.replace('$Title', title)

                 template = template.replace('$passportNo', this.viewEmployee.passportNo)

                 template = template.replace('$nationality', this.viewEmployee.nationality)

                 template = template.replace('$joiningDate', this.viewEmployee.doj)

                 template = template.replace('$jobRole', this.viewEmployee.JobTitle)

                 template = template.replace('$salary', this.viewEmployee.salary)

                 this.templateUpdated = template
},
        openDialog(id){
    this.$store.dispatch('viewEmployee', id)
    this.waiting = true
},
        changeStatusFilter(text){
                this.statusFiltered = text
            },

    }
  }
</script>

<style scoped>
.pre-formatted {
  /* white-space: pre-wrap; */
  white-space: pre-line;
}
.profilePic{
        /* height: 150px; */
    border: #333 2px solid;
    /* width: 150px; */
    /* max-width: 150px; */
    margin-left: 10px;
    margin-bottom: 0.5em;
    background-color: #eee;
        /* display: block; */
        padding: 80px;
}
.table_heading{
    font-weight: 500;
}
</style>
