<template>
    <div>
        <div v-for="(setting, i) in settings" v-bind:key="i">
            <v-stepper v-model="e6" vertical>
    <v-stepper-step :complete="e6 > 1" step="1">
      Template Details
    </v-stepper-step>

    <v-stepper-content step="1">
      <v-card flat>
          <v-form>
              <v-container>
                  <v-layout row wrap>
                      <v-flex>
                          <v-text-field
                            v-model="name"
                            label="Template Name"
                            :color="setting.app_color_accent"
                            outline
                          >
                          </v-text-field>
                          <v-textarea
                          :color="setting.app_color_accent"
                          v-model="description"
                            label="Template Description"
                            outline
                          ></v-textarea>
                      </v-flex>
                  </v-layout>
              </v-container>
          </v-form>
      </v-card>
      <v-btn color="primary" @click="e6 = 2">Continue</v-btn>
      <v-btn flat @click="$router.go(-1)">Cancel</v-btn>
    </v-stepper-content>

    <v-stepper-step :complete="e6 > 2" step="2">Write the Template</v-stepper-step>

    <v-stepper-content step="2">
      <v-card flat >

<v-form>

    <v-card>
        <!-- <v-toolbar :color="setting.app_color_accent" dark>
          <v-spacer></v-spacer>

        <v-btn outline @click="getHtml()">View Variables</v-btn>


        </v-toolbar> -->

        <editor
            v-model="editorText"
    :visible="editorVisible"
    previewStyle="vertical"
    height="500px"
    mode="wysiwyg"
    :options="editorOptions"
    ref="tuiEditor"
        class="pa-1"
        ></editor>

    <!-- @change="onEditorChange" -->

    <!-- <v-dialog
      v-model="triggerVar"
      width="500"
    >

    <v-card>
         <v-card-text>
          <v-autocomplete
          :items="variables"
        clearable
        label="Select Variable"
          outline
          :color="setting.app_color_accent"
          v-model="v_val.numb.variable"
          >
          </v-autocomplete>
        </v-card-text>

        <v-divider></v-divider>

        <v-card-actions>
          <v-spacer></v-spacer>
 <v-btn :color="setting.app_color_accent" flat @click="triggerVar = false">Cancel</v-btn>
          <v-btn :color="setting.app_color_accent" dark @click="triggerVar = false">Select</v-btn>
        </v-card-actions>
    </v-card>
    </v-dialog> -->


        </v-card>
            </v-form>
      </v-card>
      <v-btn color="primary" @click="submit()">Submit</v-btn>
      <v-btn flat @click="e6 = 1">Back</v-btn>
    </v-stepper-content>

  </v-stepper>

    </div>
    </div>
</template>

<script>
import { Editor } from '@toast-ui/vue-editor'
export default {
      components: {
    'editor': Editor
  },
        data() {
      return {
          editorText: `#### write $ to use the variables, for example

Dear $FName $LName,

this will translate to the employee's first and last name when generating the contract.

View the list of variables used below. or click on the "VIEW VARIABLES" button on the top.


| variable | Description |
| --- | --- |
| $FName | Employee's First Name |
| $LName | Employee's Last Name |
| $empMob | Employee's Mobile |
| $salary | Salary |
| $JobRole | Job Role |
| $Department | Department |`,
            editorVisible: true,
            editorOptions: {
                hideModeSwitch: true,

            },
            temp: '',
            variables: ['First Name', 'Last Name', 'Salary', 'Job Role', 'Department'],
            e6: 1,
            triggerVar: false,
            numb: 0,
            v_val: [
                {variable: 'First Name'}
                ],
                name: '',
                description: ''
                // {'v-val1': ''}
          }
      },
    created(){
        this.$store.dispatch('getSettings')
        this.$store.dispatch('SetPageTitle', 'Create HR Templates')
    },
    computed:{
        settings(){
            return this.$store.getters.settings
        },
    },

      methods: {

          submit(){
              this.$store.dispatch('saveTemplate', {name: this.name, description: this.description, temp: this.editorText})
                .then(res =>{
                    this.$router.push({name: 'AdminHrTemplates'})
                    this.$store.dispatch('setSnackBar', 'Template Successfully Added')
                })
          },
                  getHtml() {
            let html = this.$refs.tuiEditor
            let invoke
            html.forEach(item => {
                invoke = item.invoke('getHtml')
                this.temp = invoke
                console.log(invoke)
            })

        },
        //         onEditorChange() {
        //     let html = this.$refs.tuiEditor
        //     let invoke
        //     let last3
        //     html.forEach(item => {
        //         invoke = item.invoke('getMarkdown')
        //         last3 = invoke.slice(invoke.length - 3)
        //         if(last3 == " [["){
        //             this.triggerVar = true
        //             // let objVal = 'v-val'+this.numb
        //             let obj = {variable: ''}
        //             this.v_val.push(obj)
        //             // Vue.set(this.v_val, "v-val"+this.numb, "")
        //             this.numb = this.numb + 1
        //         }
        //         else{
        //             this.triggerVar = false
        //         }
        //         console.log(this.triggerVar)
        //     })
        // },
      }
}
</script>

