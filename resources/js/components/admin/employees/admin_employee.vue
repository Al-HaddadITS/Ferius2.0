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
          <v-toolbar-title class="text-xs-center">Employees List</v-toolbar-title>
          <v-spacer></v-spacer>

        <!-- <v-btn outline :to="{name: 'AdminEmployeesCreate'}">Add New Employee</v-btn> -->

    <v-dialog
      v-model="dialog"
      width="500"
    >
        <v-btn slot="activator" outline>Add New Employee</v-btn>
         <v-card>
        <v-card-title
          :class="setting.app_color_accent + ' headline white--text'"
          primary-title
        >
          Employment form Creation
        </v-card-title>

        <v-card-text class="pa-0" >

          <v-container fluid>
              <v-layout justify-space-between pa-3>
                  <v-flex d-flex text-xs-center md6>


                      <v-card class="mx-auto" flat style="cursor: pointer;" @click="dialog2 = true; dialog = false">
                          <v-card-text>
                              <v-icon x-large class="mb-4">fas fa-desktop</v-icon>
                              <h4>Send link to Employee</h4>
                          </v-card-text>

                      </v-card>

                  </v-flex>
                  <v-flex d-flex text-xs-center md6 >
                      <v-card class="mx-auto" flat :to="{name: 'AdminEmployeesCreate'}">
                          <v-card-text>
                            <v-icon x-large class="mb-4">fas fa-highlighter</v-icon>
                            <h4>Add manually</h4>
                          </v-card-text>
                      </v-card>
                  </v-flex>
              </v-layout>
          </v-container>


        </v-card-text>


      </v-card>
    </v-dialog>
    <v-dialog v-model="dialog2" transition="dialog-bottom-transition" width="600">
        <v-card>
                    <v-card-title
          :class="setting.app_color_accent + ' headline white--text'"
          primary-title
        >
          Send Link to {{ empEmail || 'Employee' }}
        </v-card-title>

<v-card-text class="ma-0 pa-0">
<v-container>
        <v-list subheader class="ma-0 pa-0">
          <v-subheader>Please follow below instructions carefully</v-subheader>

<ol>
    <li style="line-height: 25px">
        <h5>Enter Employee's Email Address below</h5>
    </li>
    <li style="line-height: 25px">
        <h5>The employee will receive an email with a temporary (one-time) link to fill their details</h5>
    </li>
    <li style="line-height: 25px">
        <h5>After submittion, you will receive an email with Employees details for your approval</h5>
    </li>
</ol>

<br>
<v-form v-model="valid">
<v-layout row wrap class="text-xs-center">
    <v-flex class="px-1">
<v-text-field outline  v-model="empName" label="Employee Name" ></v-text-field>
    </v-flex>
    <v-flex class="px-1">
<v-text-field outline :rules="emailRules" v-model="empEmail" label="Employee Email" ></v-text-field>
    </v-flex>
</v-layout>
</v-form>

        </v-list>
</v-container>
</v-card-text>
<v-divider></v-divider>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn :color="setting.app_color_accent" flat @click="dialog2 = false; empEmail = ''; empName=''">Cancel</v-btn>
          <v-btn :color="setting.app_color_accent" dark @click="dialog2 = false; empEmail = ''; empName=''">Send</v-btn>
        </v-card-actions>

        </v-card>
    </v-dialog>

        </v-toolbar>

    <v-data-table
      :headers="headers"
      :search="search"
      :items="emps"
      class="pa-4"
    >
      <template slot="items" slot-scope="props">
        <td>{{ props.item.EmpID }}</td>
        <td>{{ props.item.Fname }}</td>
        <td>{{ props.item.Lname }}</td>
        <td>{{ props.item.JobTitle }}</td>
        <td>{{ props.item.department.name }}</td>

      </template>
            <v-alert slot="no-results" :value="true" color="error" icon="warning">
        Your search for "{{ search }}" found no results.
      </v-alert>
    </v-data-table>
    </v-card>
</v-flex>
    </v-layout>
    </v-container>
  </div>
  </div>
</template>

<script>
  export default {
    data: () => ({
        search: '',
        switch1: true,
      dialog: false,
      dialog2: false,
      empEmail: '',
       valid: false,

      emailRules: [
        v => !!v || 'E-mail is required',
        v => /.+@.+/.test(v) || 'E-mail must be valid'
      ],
      empName: '',
      headers: [
        { text: 'Employee ID', value: 'EmpID'},
        { text: 'First Name', value: 'Fname' },
        { text: 'Last Name', value: 'Lname' },
        { text: 'Job Role', value: 'JobTitle' },
        { text: 'Department', value: 'department.name' },
      ],
      modalPicker:[
          {title: "Click Here to send Contract form to employee"},
          {title: "Click Here to manually fill in the employee form"}
      ],
      employees: [],
      editedIndex: -1,
      editedItem: {
        name: '',
        empCount: 0
      },
      defaultItem: {
        name: '',
        empCount: 0
      },
      empStatusFilter: [
          {title:'Active'},
          {title:'Inactive'}
      ],
      statusFiltered: ''
    }),

    computed: {
      formTitle () {
        return this.editedIndex === -1 ? 'New Department' : 'Edit Department'
      },
      settings(){
            return this.$store.getters.settings
        },
      emps(){
            return this.$store.getters.employees
        }
    },

    watch: {
      dialog (val) {
        val || this.close()
      }
    },

    created () {
      this.initialize()
        this.$store.dispatch('getSettings')
        this.$store.dispatch('setEmployees')
        this.$store.dispatch('SetPageTitle', 'Employees')
    },

    methods: {
      initialize () {
        this.employees = [
          {
            Fname: 'Akshay',
            Lname: 'Manoj',
            EmployeeId: 'D3515',
            Department: 'Development',
            JobTitle: 'Developer',
            EmpImg: 'https://cdn.vuetifyjs.com/images/lists/1.jpg'
          },
          {
            Fname: 'Rajeev',
            Lname: 'Indusha',
            EmployeeId: 'S5986',
            Department: 'Salesman',
            JobTitle: 'Sales',
            EmpImg: 'https://cdn.vuetifyjs.com/images/lists/2.jpg'
          },
          {
            Fname: 'Valli',
            Lname: 'Ramanathan',
            EmployeeId: 'D6132',
            Department: 'Development',
            JobTitle: 'Developer',
            EmpImg: 'https://cdn.vuetifyjs.com/images/lists/3.jpg'
          },
          {
            Fname: 'Julie',
            Lname: '',
            EmployeeId: 'O9004',
            Department: 'Operations',
            JobTitle: 'Operation Manager',
            EmpImg: 'https://cdn.vuetifyjs.com/images/lists/4.jpg'
          },
        ]
      },
        changeStatusFilter(text){
                this.statusFiltered = text
            },

      editItem (item) {
        this.editedIndex = this.employees.indexOf(item)
        this.editedItem = Object.assign({}, item)
        this.dialog = true
      },

      deleteItem (item) {
        const index = this.employees.indexOf(item)
        confirm('Are you sure you want to delete this item?') && this.employees.splice(index, 1)
      },

      close () {
        this.dialog = false
        setTimeout(() => {
          this.editedItem = Object.assign({}, this.defaultItem)
          this.editedIndex = -1
        }, 300)
      },

      save () {
        if (this.editedIndex > -1) {
          Object.assign(this.employees[this.editedIndex], this.editedItem)
        } else {
          this.employees.push(this.editedItem)
        }
        this.close()
      }
    }
  }
</script>

