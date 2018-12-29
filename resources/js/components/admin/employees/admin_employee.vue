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

        <v-btn outline :to="{name: 'AdminEmployeesCreate'}">Add New Employee</v-btn>



        </v-toolbar>

    <v-data-table
      :headers="headers"
      :search="search"
      :items="emps"
      :loading="loading"
      class="pa-4"
    >
    <v-progress-linear slot="progress" :color="setting.app_color_accent" indeterminate></v-progress-linear>
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
        },
      loading(){
            return this.$store.getters.loading
        },
    },


    created () {
        this.$store.dispatch('getSettings')
        this.$store.dispatch('setEmployees')
        this.$store.dispatch('SetPageTitle', 'Employees')
    },

    methods: {
        changeStatusFilter(text){
                this.statusFiltered = text
            },

    }
  }
</script>

