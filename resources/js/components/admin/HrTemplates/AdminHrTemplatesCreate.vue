<template>
    <div>
        <div v-for="(setting, i) in settings" v-bind:key="i">
            <v-stepper v-model="e6" >
<v-stepper-header>
    <v-stepper-step :complete="e6 > 1" step="1" :color="setting.app_color_accent">Template Details</v-stepper-step>
    <v-divider></v-divider>
    <v-stepper-step step="2" :color="setting.app_color_accent">Write the Template</v-stepper-step>
</v-stepper-header>
<v-stepper-items>
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
      <v-btn :color="setting.app_color_accent" dark @click="e6 = 2">Continue</v-btn>
      <v-btn flat @click="$router.go(-1)">Cancel</v-btn>
    </v-stepper-content>



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
:init="config"
api-key="8vg7aylhgr5nwcnq7fzajhqcfehqvrzyaog4226rl7mymtd1"
></editor>



        </v-card>
            </v-form>
      </v-card>
      <v-btn :color="setting.app_color_accent" dark @click="submit()">Submit</v-btn>
      <v-btn flat @click="e6 = 1">Back</v-btn>
    </v-stepper-content>
</v-stepper-items>
  </v-stepper>

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
        data() {
      return {
          editorText: `
          <!DOCTYPE html>
<html>
<head>
</head>
<body>
<p style="line-height: 150%; margin: 0in 0in 10pt; font-size: 11pt; font-family: Calibri, sans-serif;"><span style="font-size: 12.0pt; line-height: 150%; font-family: 'Times New Roman', serif;">Date: $contractDate</span></p>
<p style="text-align: center; line-height: 150%; margin: 0in 0in 10pt; font-size: 11pt; font-family: Calibri, sans-serif;" align="center"><strong><u><span style="font-size: 12.0pt; line-height: 150%; font-family: 'Times New Roman', serif;">Employment Contract</span></u></strong></p>
<p style="line-height: 150%; margin: 0in 0in 10pt; font-size: 11pt; font-family: Calibri, sans-serif;"><span style="font-size: 12.0pt; line-height: 150%; font-family: 'Times New Roman', serif;">Agree on the contract made by and between:</span></p>
<p style="margin: 0in 0in 0.0001pt; line-height: 150%; font-size: 11pt; font-family: Calibri, sans-serif;"><span style="font-size: 12.0pt; line-height: 150%; font-family: 'Times New Roman', serif;">1- <em><u>Al-Haddad Information Technology Services</u></em>, having its head office in the city of Manama. (First Party).</span></p>
<p style="margin: 0in 0in 0.0001pt; line-height: 150%; font-size: 11pt; font-family: Calibri, sans-serif;"><span style="font-size: 12.0pt; line-height: 150%; font-family: 'Times New Roman', serif;">2- $Title $fullName, holding passport no. $passportNo, of $nationality nationality (Second Party).</span></p>
<p style="margin: 0in 0in 0.0001pt; line-height: 150%; font-size: 11pt; font-family: Calibri, sans-serif;"><span style="font-size: 12.0pt; line-height: 150%; font-family: 'Times New Roman', serif;">&nbsp;</span></p>
<p style="margin: 0in 0in 0.0001pt; text-align: center; line-height: 150%; font-size: 11pt; font-family: Calibri, sans-serif;" align="center"><strong><u><span style="font-size: 12.0pt; line-height: 150%; font-family: 'Times New Roman', serif;">Preamble</span></u></strong></p>
<p style="margin: 0in 0in 0.0001pt; line-height: 150%; font-size: 11pt; font-family: Calibri, sans-serif;"><span style="font-size: 12.0pt; line-height: 150%; font-family: 'Times New Roman', serif;">This contract has been concluded between the two parties hereto for the purpose of performing the works specified below at the standard set by the <strong>First Party</strong> and shown in the attached description of the job to be filled by the <strong>Second Party</strong>.</span></p>
<p style="margin: 0in 0in 0.0001pt; line-height: 150%; font-size: 11pt; font-family: Calibri, sans-serif;"><span style="font-size: 12.0pt; line-height: 150%; font-family: 'Times New Roman', serif;">&nbsp;</span></p>
<p style="margin: 0in 0in 0.0001pt; line-height: 150%; font-size: 11pt; font-family: Calibri, sans-serif;"><span style="font-size: 12.0pt; line-height: 150%; font-family: 'Times New Roman', serif;">The <strong>Second Party</strong>, therefore, declares that it is fully cognizant of this fact and accepts to enter into this contract on the understanding that it feels fully capable of performing this work at the standards required by the<strong> First Party</strong> and, therefore, undertakes to fulfill the obligations contained herein.</span></p>
<p style="margin: 0in 0in 0.0001pt; line-height: 150%; font-size: 11pt; font-family: Calibri, sans-serif;"><span style="font-size: 12.0pt; line-height: 150%; font-family: 'Times New Roman', serif;">&nbsp;</span></p>
<p style="margin: 0in 0in 0.0001pt; line-height: 150%; font-size: 11pt; font-family: Calibri, sans-serif;"><span style="font-size: 12.0pt; line-height: 150%; font-family: 'Times New Roman', serif;">Both parties hereto agree and covenant as follows:</span></p>
<p style="margin: 0in 0in 0.0001pt; line-height: 150%; font-size: 11pt; font-family: Calibri, sans-serif;"><span style="font-size: 12.0pt; line-height: 150%; font-family: 'Times New Roman', serif;">&nbsp;</span></p>
<ol style="margin-bottom: 0in; margin-top: 0px;" start="1" type="a">
<li style="line-height: 150%; margin-top: 0in; margin-right: 0in; margin-bottom: 10pt; font-size: 11pt; font-family: Calibri, sans-serif;"><span style="font-size: 12.0pt; line-height: 150%; font-family: 'Times New Roman', serif;">The above Preamble forms an integral part of this contract.</span></li>
<li style="line-height: 150%; margin-top: 0in; margin-right: 0in; margin-bottom: 10pt; font-size: 11pt; font-family: Calibri, sans-serif;"><span style="font-size: 12.0pt; line-height: 150%; font-family: 'Times New Roman', serif;">The <strong>First Party</strong> agrees to employ the <strong>Second Party</strong> as of </span></li>
<ul style="margin-bottom: 0in; margin-top: 0px;" type="disc">
<li style="line-height: 150%; margin-top: 0in; margin-right: 0in; margin-bottom: 10pt; font-size: 11pt; font-family: Calibri, sans-serif;"><u><span style="font-size: 12.0pt; line-height: 150%; font-family: 'Times New Roman', serif;">Joining Date</span></u><span style="font-size: 12.0pt; line-height: 150%; font-family: 'Times New Roman', serif;">: $joiningDate</span></li>
<li style="line-height: 150%; margin-top: 0in; margin-right: 0in; margin-bottom: 10pt; font-size: 11pt; font-family: Calibri, sans-serif;"><u><span style="font-size: 12.0pt; line-height: 150%; font-family: 'Times New Roman', serif;">Job Role:</span></u><span style="font-size: 12.0pt; line-height: 150%; font-family: 'Times New Roman', serif;"> $jobRole</span></li>
<li style="line-height: 150%; margin-top: 0in; margin-right: 0in; margin-bottom: 10pt; font-size: 11pt; font-family: Calibri, sans-serif;"><u><span style="font-size: 12.0pt; line-height: 150%; font-family: 'Times New Roman', serif;">Conditions:</span></u><span style="font-size: 12.0pt; line-height: 150%; font-family: 'Times New Roman', serif;"> The <strong>First Party</strong> shall have the right to assign to the <strong>Second Party</strong> any related work (specified on the job description) within the nature of the <strong>Second Party</strong>&rsquo;s qualifications or which work he/her may become qualified for through experience and training by the <strong>First Party.</strong></span></li>
</ul>
<li style="line-height: 150%; margin-top: 0in; margin-right: 0in; margin-bottom: 10pt; font-size: 11pt; font-family: Calibri, sans-serif;"><span style="font-size: 12.0pt; line-height: 150%; font-family: 'Times New Roman', serif;">The <strong>First Party</strong> agrees to compensate the <strong>Second Party</strong> with the following benefits: </span></li>
<ul style="margin-bottom: 0in; margin-top: 0px;" type="disc">
<li style="line-height: 150%; margin-top: 0in; margin-right: 0in; margin-bottom: 10pt; font-size: 11pt; font-family: Calibri, sans-serif;"><u><span style="font-size: 12.0pt; line-height: 150%; font-family: 'Times New Roman', serif;">Salary:</span></u><span style="font-size: 12.0pt; line-height: 150%; font-family: 'Times New Roman', serif;"> $salary</span></li>
<li style="line-height: 150%; margin-top: 0in; margin-right: 0in; margin-bottom: 10pt; font-size: 11pt; font-family: Calibri, sans-serif;"><u><span style="font-size: 12.0pt; line-height: 150%; font-family: 'Times New Roman', serif;">Leaves:</span></u><span style="font-size: 12.0pt; line-height: 150%; font-family: 'Times New Roman', serif;"> 30 working days annually (Based on Bahrain Labor Law).</span></li>
<li style="line-height: 150%; margin-top: 0in; margin-right: 0in; margin-bottom: 10pt; font-size: 11pt; font-family: Calibri, sans-serif;"><u><span style="font-size: 12.0pt; line-height: 150%; font-family: 'Times New Roman', serif;">Conditions:</span></u><span style="font-size: 12.0pt; line-height: 150%; font-family: 'Times New Roman', serif;"> Salary to be reviewed basis performance and business growth. The <strong>First</strong> <strong>Party</strong> shall also deduct from such salary, including any supplemental allowance, all sums deductible by Law from the <strong>Second Party&rsquo;s</strong> salary including taxes, fees, contributions or any other levies imposed by Law on the <strong>Second Part</strong>.</span></li>
</ul>
<li style="line-height: 150%; margin-top: 0in; margin-right: 0in; margin-bottom: 10pt; font-size: 11pt; font-family: Calibri, sans-serif;"><span style="font-size: 12.0pt; line-height: 150%; font-family: 'Times New Roman', serif;">The <strong>Second Party</strong> shall be deemed to have been appointed under probation for <u>Three (3) months</u> during which or upon expiration thereof <strong>Either Party</strong> shall be entitled to terminate or cancel this contract by giving one day notice. Upon expiration of the probationary period and unless <strong>Either Party</strong> has used their right to cancel this contract, the Second Party shall be deemed to have been employed for an indefinite period effective employment date.</span></li>
<li style="line-height: 150%; margin-top: 0in; margin-right: 0in; margin-bottom: 10pt; font-size: 11pt; font-family: Calibri, sans-serif;"><span style="font-size: 12.0pt; line-height: 150%; font-family: 'Times New Roman', serif;">The <strong>Second Party</strong> shall devote the whole time and attention to the<strong> first Party's</strong> business during the working hours as specified in Labor Law No.36 of 2012, or in any other subsequent law. The <strong>Second Party</strong> hereby acknowledges that the <strong>First Party</strong> is at liberty to modify at any time the working hours described in its By-Laws, provided that such modified hours will not exceed maximum working hours stipulated by law, and the <strong>Second Party</strong> may not claim any additional salary or compensation for any such working hours as work needs in the organization may require so long as such hours, if added to those provided for in the <strong>First Party's</strong> By-Laws, will not exceed in the aggregate the maximum hours provided for in the Law.</span></li>
<li style="line-height: 150%; margin-top: 0in; margin-right: 0in; margin-bottom: 10pt; font-size: 11pt; font-family: Calibri, sans-serif;"><span style="font-size: 12.0pt; line-height: 150%; font-family: 'Times New Roman', serif;">The <strong>Second Party</strong> shall not without written permission from the company, engage in any work for a third party with or without remuneration even outside official working hours, or participate, directly or indirectly, in an activity or enterprise which is in direct conflict with the organization&rsquo;s interest, or in any concern having transactions with the organization.</span></li>
<li style="line-height: 150%; margin-top: 0in; margin-right: 0in; margin-bottom: 10pt; font-size: 11pt; font-family: Calibri, sans-serif;"><span style="font-size: 12.0pt; line-height: 150%; font-family: 'Times New Roman', serif;">The <strong>Second Party</strong> undertakes to observe all orders and instructions issued to the <strong>Second Party</strong> by the organization&rsquo;s management and shall accurately implement the organization&rsquo;s regulations and always observe good conduct, behavior and reputation.</span></li>
<li style="line-height: 150%; margin-top: 0in; margin-right: 0in; margin-bottom: 10pt; font-size: 11pt; font-family: Calibri, sans-serif;"><span style="font-size: 12.0pt; line-height: 150%; font-family: 'Times New Roman', serif;">The <strong>Second Party</strong> herby agrees to abide by a full confidentially of the <strong>First Party</strong> information.</span></li>
<li style="line-height: 150%; margin-top: 0in; margin-right: 0in; margin-bottom: 10pt; font-size: 11pt; font-family: Calibri, sans-serif;"><span style="font-size: 12.0pt; line-height: 150%; font-family: 'Times New Roman', serif;">This contract is executed in duplicate, one copy per each party for necessary actions.</span></li>
</ol>
<div align="center">
<table class="MsoTableGrid" style="border-collapse: collapse; border: none;" border="1" cellspacing="0" cellpadding="0">
<tbody>
<tr>
<td style="width: 176.1pt; border: solid windowtext 1.0pt; background: #EEECE1; padding: 0in 5.4pt 0in 5.4pt;" colspan="2" valign="top" width="235">
<p style="margin: 0in 0in 0.0001pt; text-align: center; line-height: 150%; font-size: 11pt; font-family: Calibri, sans-serif;" align="center"><strong>First Party</strong></p>
<p style="margin: 0in 0in 0.0001pt; text-align: center; line-height: 150%; font-size: 11pt; font-family: Calibri, sans-serif;" align="center"><strong><span dir="RTL" style="font-family: Arial, sans-serif;">الطرف الأول</span></strong></p>
</td>
<td style="width: 176.1pt; border: solid windowtext 1.0pt; border-left: none; background: #EEECE1; padding: 0in 5.4pt 0in 5.4pt;" colspan="2" valign="top" width="235">
<p style="margin: 0in 0in 0.0001pt; text-align: center; line-height: 150%; font-size: 11pt; font-family: Calibri, sans-serif;" align="center"><strong>Second Party</strong></p>
<p style="margin: 0in 0in 0.0001pt; text-align: center; line-height: 150%; font-size: 11pt; font-family: Calibri, sans-serif;" align="center"><strong><span dir="RTL" style="font-family: Arial, sans-serif;">الطرف الثاني</span></strong></p>
</td>
</tr>
<tr>
<td style="width: 65.85pt; border: solid windowtext 1.0pt; border-top: none; padding: 0in 5.4pt 0in 5.4pt;" valign="top" width="88">
<p style="margin: 0in 0in 0.0001pt; line-height: 150%; font-size: 11pt; font-family: Calibri, sans-serif;">Name</p>
</td>
<td style="width: 110.25pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; padding: 0in 5.4pt 0in 5.4pt;" valign="top" width="147">
<p style="margin: 0in 0in 0.0001pt; line-height: 150%; font-size: 11pt; font-family: Calibri, sans-serif;">&nbsp;</p>
</td>
<td style="width: 56.25pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; padding: 0in 5.4pt 0in 5.4pt;" valign="top" width="75">
<p style="margin: 0in 0in 0.0001pt; line-height: 150%; font-size: 11pt; font-family: Calibri, sans-serif;">Name</p>
</td>
<td style="width: 119.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; padding: 0in 5.4pt 0in 5.4pt;" valign="top" width="160">
<p style="margin: 0in 0in 0.0001pt; line-height: 150%; font-size: 11pt; font-family: Calibri, sans-serif;">&nbsp;</p>
</td>
</tr>
<tr>
<td style="width: 65.85pt; border: solid windowtext 1.0pt; border-top: none; padding: 0in 5.4pt 0in 5.4pt;" valign="top" width="88">
<p style="margin: 0in 0in 0.0001pt; line-height: 150%; font-size: 11pt; font-family: Calibri, sans-serif;">Date</p>
</td>
<td style="width: 110.25pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; padding: 0in 5.4pt 0in 5.4pt;" valign="top" width="147">
<p style="margin: 0in 0in 0.0001pt; line-height: 150%; font-size: 11pt; font-family: Calibri, sans-serif;">&nbsp;</p>
</td>
<td style="width: 56.25pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; padding: 0in 5.4pt 0in 5.4pt;" valign="top" width="75">
<p style="margin: 0in 0in 0.0001pt; line-height: 150%; font-size: 11pt; font-family: Calibri, sans-serif;">Date</p>
</td>
<td style="width: 119.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; padding: 0in 5.4pt 0in 5.4pt;" valign="top" width="160">
<p style="margin: 0in 0in 0.0001pt; line-height: 150%; font-size: 11pt; font-family: Calibri, sans-serif;">&nbsp;</p>
</td>
</tr>
<tr>
<td style="width: 65.85pt; border: solid windowtext 1.0pt; border-top: none; padding: 0in 5.4pt 0in 5.4pt;" valign="top" width="88">
<p style="margin: 0in 0in 0.0001pt; line-height: 150%; font-size: 11pt; font-family: Calibri, sans-serif;">Signature</p>
</td>
<td style="width: 110.25pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; padding: 0in 5.4pt 0in 5.4pt;" valign="top" width="147">
<p style="margin: 0in 0in 0.0001pt; line-height: 150%; font-size: 11pt; font-family: Calibri, sans-serif;">&nbsp;</p>
<p style="margin: 0in 0in 0.0001pt; line-height: 150%; font-size: 11pt; font-family: Calibri, sans-serif;">&nbsp;</p>
<p style="margin: 0in 0in 0.0001pt; line-height: 150%; font-size: 11pt; font-family: Calibri, sans-serif;">&nbsp;</p>
</td>
<td style="width: 56.25pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; padding: 0in 5.4pt 0in 5.4pt;" valign="top" width="75">
<p style="margin: 0in 0in 0.0001pt; line-height: 150%; font-size: 11pt; font-family: Calibri, sans-serif;">Signature</p>
</td>
<td style="width: 119.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; padding: 0in 5.4pt 0in 5.4pt;" valign="top" width="160">
<p style="margin: 0in 0in 0.0001pt; line-height: 150%; font-size: 11pt; font-family: Calibri, sans-serif;">&nbsp;</p>
</td>
</tr>
</tbody>
</table>
</div>
<p style="line-height: 150%; margin: 0in 0in 10pt; font-size: 11pt; font-family: Calibri, sans-serif;">&nbsp;</p>
<div style="text-align: left;">&nbsp;</div>
</body>
</html>
          `,
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
  branding: false,
  paste_data_images: true,
  paste_enable_default_filters: false
          },
            e6: 1,
                name: '',
                description: ''
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
          }
      }
}
</script>

