<template>
  <div>
      <div v-for="(setting, i) in settings" v-bind:key="i">
      <v-toolbar class="elevation-2 pa-0 ma-0 filterToolbar"  height="55" dense>
          <v-layout align-center justify-center row fill-height class="px-0 mx-0">


                    <v-text-field
        v-model="search"
        append-icon="search"
        label="Search..."
        single-line
        hide-details
        box
        full-width
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
          <v-toolbar-title class="text-xs-center">Templates List</v-toolbar-title>
          <v-spacer></v-spacer>

        <v-btn outline :to="{name: 'AdminHrTemplatesCreate'}">Add New Template</v-btn>


        </v-toolbar>

    <v-data-table
      :headers="headers"
      :search="search"
      :items="templates"
      :loading="loading"
      class="pa-4"
    >
      <v-progress-linear slot="progress" :color="setting.app_color_accent" indeterminate></v-progress-linear>
      <template slot="items" slot-scope="props" >
          <!-- <router-link tag="tr" :to="'admin/hrTemplates/view/'+props.item.id" style="cursor: pointer;"> -->
          <tr @click="openDialog(props.item.id)"  style="cursor: pointer;">

        <td>{{ props.item.name }}</td>
        <td>{{ props.item.description }}</td>
        <td>{{ props.item.updated_at }}</td>


</tr>

          <!-- </router-link> -->
      </template>
            <v-alert slot="no-results" :value="true" color="error" icon="warning">
        Your search for "{{ search }}" found no results.
      </v-alert>
    </v-data-table>
    </v-card>
</v-flex>
    </v-layout>
    </v-container>
    <v-snackbar
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
    </v-snackbar>
    <v-dialog
      v-model="viewTemplateDialog"

    >
    <v-card>
        <v-card-title
          class="headline grey lighten-2"
          primary-title
        >
          {{ viewTemplates.name }}
        </v-card-title>

        <v-card-text>
            <!-- {{ tempMethod(viewTemplates.temp) }} -->
            <!-- <div class="pre-formatted" v-html="viewTemplates.temp"> -->
            <div class="pre-formatted">

<editor
v-model="viewTemplates.temp"
:init="config"
api-key="8vg7aylhgr5nwcnq7fzajhqcfehqvrzyaog4226rl7mymtd1"
></editor>
                <!-- <viewer
                :value="viewTemplates.temp"
                ></viewer> -->

            </div>
        </v-card-text>

        <v-divider></v-divider>

        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn
            :color="setting.app_color_info"
            flat
            @click="editTemplate(viewTemplates.id, viewTemplates.name, viewTemplates.temp)"
          >
            Edit
          </v-btn>
          <v-btn
            :color="setting.app_color_error"
            flat
            @click="deleteTemplate(viewTemplates.id, viewTemplates.name)"
          >
            Delete
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
import Editor from '@tinymce/tinymce-vue';
// import { component } from 'vue-mce'
  export default {
      components: {
    'editor': Editor
  },
    data: () => ({
        config:{
height: 500,
                inline: false,
                theme: 'modern',
                fontsize_formats: "8px 10px 12px 14px 16px 18px 20px 22px 24px 26px 28px 30px 34px 38px 42px 48px 54px 60px",
                plugins: 'print preview fullpage powerpaste searchreplace autolink directionality advcode visualblocks visualchars fullscreen image link media template codesample table charmap hr pagebreak nonbreaking anchor toc insertdatetime advlist lists textcolor wordcount tinymcespellchecker a11ychecker imagetools mediaembed  linkchecker contextmenu colorpicker textpattern help',
                toolbar1: 'formatselect fontsizeselect | bold italic strikethrough forecolor backcolor | link | alignleft aligncenter alignright alignjustify  | numlist bullist outdent indent  | removeformat',
                image_advtab: true,
                  templates: [
    { title: 'Test template 1', content: 'Test 1' },
    { title: 'Test template 2', content: 'Test 2' }
  ],
  branding: false
        },
        search: '',
        switch1: true,
      dialog: false,
      dialog2: false,
      empEmail: '',
       valid: false,
       timeout: 6000,
       templateDialog: false,
       temp:[
           {
               name: 'Full Time',
               description: 'Full Time Template',
               updatedAt: '15/12/2018'
           }
       ],

      emailRules: [
        v => !!v || 'E-mail is required',
        v => /.+@.+/.test(v) || 'E-mail must be valid'
      ],
      empName: '',
      headers: [
        { text: 'Name', value: 'name'},
        { text: 'Description', value: 'description' },
        { text: 'Updated At', value: 'updated_at' },
      ],
      modalPicker:[
          {title: "Click Here to send Contract form to employee"},
          {title: "Click Here to manually fill in the employee form"}
      ],
      employees: [],
      editedIndex: -1,
      snackbars: false,
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
      statusFiltered: '',
      viewTemplateDialog: false,
      waiting: false
    }),

    computed: {
      settings(){
            return this.$store.getters.settings
        },
      templates(){
            return this.$store.getters.templates
        },
      snackbar(){
            return this.$store.getters.snackbar
        },
      SnackText(){
            return this.$store.getters.SnackText
        },
                viewTemplates(){
            return this.$store.getters.viewTemplates
        },
              loading(){
            return this.$store.getters.loading
        },
    },

    watch: {
        snackbar(val){
            this.snackbars = val
        },
        snackbars(val){
            if(!val){
                this.$store.dispatch('clearSnackBar')
            }
        },
      dialog (val) {
        val || this.close()
      },
            templates (val) {
        setTimeout(() => (this.waiting = false), 100)
        setTimeout(() => (this.viewTemplateDialog = false), 150)
      },
    viewTemplates(val){
        setTimeout(() => (this.waiting = false), 100)
        setTimeout(() => (this.viewTemplateDialog = true), 150)
    }
    },

    created () {
        this.$store.dispatch('getSettings')
        this.$store.dispatch('SetTemplates')
        this.$store.dispatch('SetPageTitle', 'HR Templates')
        this.snackbars = this.snackbar
    },

    methods: {
        editTemplate(id, name, temp){
            this.$store.dispatch('editTemplate', {id: id, name: name, temp: temp})
            .then(res => {
                    this.waiting = true
                })
        },
        deleteTemplate(id, name){
            this.$store.dispatch('deleteTemplate', {id: id, name: name})
                .then(res => {
                    this.waiting = true
                })
        },
openDialog(id){
    this.$store.dispatch('viewTemplate', id)
    // this.viewTemplateDialog = true
    this.waiting = true
},
        changeStatusFilter(text){
                this.statusFiltered = text
            },
            CloseSnackbar(){
                this.$store.dispatch('clearSnackBar')
            }
    }
  }
</script>

<style>
.pre-formatted {
  white-space: pre-wrap;
}
</style>
