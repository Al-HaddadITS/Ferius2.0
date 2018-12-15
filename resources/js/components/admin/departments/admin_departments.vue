<template>
  <div>
      <v-container fluid v-for="(setting, i) in settings" v-bind:key="i">

<v-layout wrap row>

<v-flex md4 lg3>
    <div class="pa-4">
        <v-btn slot="activator" outline :color="setting.app_color_accent" class="mb-2">Add New Department</v-btn>
    <v-text-field
        v-model="search"
        append-icon="search"
        label="Filter"
        single-line
        hide-details
        :color="setting.app_color_accent"
      ></v-text-field>
    </div>
</v-flex>

<v-flex md8 lg9>



    <v-card>
        <v-toolbar :color="setting.app_color_accent" dark>
          <v-toolbar-title class="text-xs-center">Departments List</v-toolbar-title>
        </v-toolbar>

    <v-data-table
      :headers="headers"
      :items="deps"
      :search="search"
    >
      <!-- class="elevation-1" -->
      <template slot="items" slot-scope="props">
        <td>{{ props.item.name }}</td>
        <!-- <td class="text-xs-right">{{ props.item.empCount }}</td> -->
        <td class="">{{ countEmp(props.item) }}</td>
        <!-- <td class="justify-center layout px-0"> -->
        <td class="">
                      <v-icon
            small
            class="mr-2"
            @click="editItem(props.item)"
          >
            remove_red_eye
          </v-icon>
          <v-icon
            small
            class="mr-2"
            @click="editItem(props.item)"
          >
            edit
          </v-icon>
          <v-icon
            small
            @click="deleteItem(props.item)"
          >
            delete
          </v-icon>
        </td>
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
</template>

<script>
  export default {
    data: () => ({
        search: '',
      dialog: false,
      headers: [
        {
          text: 'Department',
          align: 'left',
          sortable: false,
          value: 'name'
        },
        { text: 'Number of Employees', value: 'empCount' },
        { text: 'Actions', value: 'name', sortable: false }
      ],
      departments: [],
      editedIndex: -1,
      editedItem: {
        name: '',
        empCount: 0
      },
      defaultItem: {
        name: '',
        empCount: 0
      }
    }),

    computed: {
      formTitle () {
        return this.editedIndex === -1 ? 'New Department' : 'Edit Department'
      },
      settings(){
            return this.$store.getters.settings
        },
      deps(){
            return this.$store.getters.departments
        },
    },

    watch: {
      dialog (val) {
        val || this.close()
      }
    },

    created () {
      this.initialize()
        this.$store.dispatch('getSettings');
        this.$store.dispatch('setDepartments');
    },

    methods: {
        countEmp(dep){
            const emp = dep.employee
            return emp.length
        },
      initialize () {
        this.departments = [
          {
            name: 'IT',
            empCount: 59
          },
          {
            name: 'HR',
            empCount: 37
          },
          {
            name: 'Finance',
            empCount: 62
          },
          {
            name: 'Sales',
            empCount: 35
          },
          {
            name: 'Accounting',
            empCount: 56
          }
        ]
      },

      editItem (item) {
        this.editedIndex = this.departments.indexOf(item)
        this.editedItem = Object.assign({}, item)
        this.dialog = true
      },

      deleteItem (item) {
        const index = this.departments.indexOf(item)
        confirm('Are you sure you want to delete this item?') && this.departments.splice(index, 1)
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
          Object.assign(this.departments[this.editedIndex], this.editedItem)
        } else {
          this.departments.push(this.editedItem)
        }
        this.close()
      }
    }
  }
</script>
