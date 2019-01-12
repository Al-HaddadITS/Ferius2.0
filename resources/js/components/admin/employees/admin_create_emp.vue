<template>
<v-container fluid>
  <v-stepper v-model="e6"  v-for="(setting, i) in settings" v-bind:key="i">
      <v-stepper-header>
<v-stepper-step :complete="e6 > 1" step="1" :color="setting.app_color_accent">Employee Information</v-stepper-step>
<v-divider></v-divider>
<v-stepper-step :complete="e6 > 2" step="2" :color="setting.app_color_accent">Contract Details</v-stepper-step>
<v-divider></v-divider>
<v-stepper-step :complete="e6 > 3" step="3" :color="setting.app_color_accent">Upload Documents</v-stepper-step>
<v-divider></v-divider>
<v-stepper-step step="4"  :color="setting.app_color_accent">Review Contract</v-stepper-step>
      </v-stepper-header>

      <v-stepper-items>
    <v-stepper-content step="1">
      <v-card class="mb-5" flat >
                        <v-form ref="form1" v-model="valid" lazy-validation>
          <v-container>
              <v-layout row wrap>
                  <v-flex>
                      <v-text-field
      label="Employee ID"
      v-model="empID"
      outline
      :color="setting.app_color_accent"
      clearable
      append-icon="fas fa-user"
      :rules="EmpIDRules"
      required
    ></v-text-field>
                  </v-flex>
              </v-layout>
              <v-layout row wrap>
                  <v-flex md6>
    <v-text-field
      label="First Name"
      v-model="Fname"
      outline
      :color="setting.app_color_accent"
      clearable
      append-icon="fas fa-user"
      :rules="FnameRules"
      required
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
      :rules="LnameRules"
      required
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
                :rules="[v => !!v || 'Gender is required']"
      required
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
      :rules="IDRules"
      required
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
          label="Passport Expiry Date"
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
      <v-btn :disabled="!valid" @click="validate1()" :color="setting.app_color_accent" dark>Continue</v-btn>
      <v-btn flat @click="$router.go(-1)">Cancel</v-btn>
      <div class="text-danger" v-if="!valid">* Please fix above errors</div>
  </v-form>
      </v-card>
    </v-stepper-content>



    <v-stepper-content step="2">
      <v-card class="mb-5" flat >
          <v-form ref="form2" v-model="valid2" lazy-validation>
              <v-container>
                  <v-layout row wrap>
                      <v-flex md6>
                          <v-autocomplete
                          :items="contractTemplates"
                          item-text="name"
                          item-value="id"
          label="Choose Contract"
          clearable
          outline
          :color="setting.app_color_accent"
          v-model="contractSelect"
          append-icon="fas fa-ring"
          :menu-props="{'offset-y': true}"
          return-object
                        :rules="[v => !!v || 'Contract is required']"
                        required
                        @change="contractSelection()"
                          >
                          </v-autocomplete>
                      </v-flex>
                      <v-flex md6>
                          <v-text-field
      label="Salary"
      v-model="salary"
      outline
      :color="setting.app_color_accent"
      clearable
      :prefix="currency"
      append-icon="fas fa-id-card"
    ></v-text-field>
                      </v-flex>
                  </v-layout>
                  <v-layout row wrap>

                     <v-flex md6>

      <v-menu
      :close-on-content-click="false"
        v-model="menu6"
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
          v-model="contractDate"
          label="Contract Date"
          append-icon="event"
          outline
          :color="setting.app_color_accent"
          readonly
        ></v-text-field>
        <v-date-picker landscape v-model="contractDate" @input="menu6 = false" :color="setting.app_color_accent"></v-date-picker>
      </v-menu>

                  </v-flex>

                     <v-flex md6>

      <v-menu
      :close-on-content-click="false"
        v-model="menu7"
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
          v-model="doj"
          label="Date of Joining"
          append-icon="event"
          outline
          :color="setting.app_color_accent"
          readonly
        ></v-text-field>
        <v-date-picker landscape v-model="doj" @input="menu7 = false" :color="setting.app_color_accent"></v-date-picker>
      </v-menu>

                  </v-flex>

                    </v-layout>
                    <v-layout row wrap>
                        <v-flex md6>
                                <v-text-field
      label="Job Role"
      v-model="jobRole"
      outline
      :color="setting.app_color_accent"
      clearable
      append-icon="fas fa-user"
    ></v-text-field>
                        </v-flex>
                                              <v-flex md6>
                          <v-autocomplete
                                                    :items="departmentsList"
                          item-text="name"
                          item-value="id"
          label="Department"
          clearable
          outline
          :color="setting.app_color_accent"
          v-model="departmentSelect"
          append-icon="fas fa-ring"
          :menu-props="{'offset-y': true}"
          return-object
           @change="departmentSelection()"
                          >
                          </v-autocomplete>
                      </v-flex>
                    </v-layout>
              </v-container>
      <v-btn :disabled="!valid2" @click="validate2()" :color="setting.app_color_accent" dark>Continue</v-btn>
      <v-btn flat @click="e6 = 1">back</v-btn>
      <div class="text-danger" v-if="!valid">* Please fix above errors</div>
          </v-form>
      </v-card>
    </v-stepper-content>



    <v-stepper-content step="3">
      <v-card class="mb-5" flat>
          <v-form>
              <v-container>
                  <v-layout row wrap>
                      <v-flex md8>
                          <v-layout>

                      <v-flex md3>

                          <v-layout row wrap >
                              <v-flex>
                          <div >

                          <v-avatar
                          tile
                          size="150"
                          class="profilePic"
                          @click="profilePicUpload()"
                          >
                         <img v-if="imageUrl" :src="imageUrl" alt="ProfilePicture">
                          </v-avatar>
                          </div>
                              </v-flex>
                          </v-layout>
                          <!-- <h5 v-else>Insert Profile Picture</h5> -->
                          <v-layout row wrap>
                              <v-flex>

                          <v-btn class="uploadBTN" raised :color="setting.app_color_accent" dark @click="profilePicUpload()">Profile Picture</v-btn>
                          <input
                          type="file"
                          name="profilePic"
                          style="display:none;"
                          ref="profilePicBTN"
                          accept="image/*"
                          @change="onPicPicked()"
                          >
                              </v-flex>
                          </v-layout>
                      </v-flex>
                      <v-flex md8></v-flex>
                  </v-layout>
                  <v-layout row wrap>
                      <v-flex>
                                                    <v-btn class="uploadBTN" raised :color="setting.app_color_accent" dark @click="ResumeUpload()">Resume</v-btn>
                          <input
                          type="file"
                          name="Resume"
                          ref="resumeBTN"
                          style="display:none;"
                          @change="onResumePicked()"
                          >
                          <span v-if="Resume">{{ ResumeFile.name }}</span>
                          <span v-else>No File Chosen</span>
                      </v-flex>
                  </v-layout>
                  <v-layout row wrap>
                      <v-flex>
                                                    <v-btn class="uploadBTN" raised :color="setting.app_color_accent" dark @click="IDUpload()">ID Copy</v-btn>
                          <input
                          type="file"
                          name="id"
                          ref="IDBTN"
                          style="display:none;"
                          @change="onIDPicked()"
                          >
                          <span v-if="ID">{{ IDFile.name }}</span>
                          <span v-else>No File Chosen</span>
                      </v-flex>
                          </v-layout>
                  <v-layout row wrap>
                      <v-flex>
                                                    <v-btn class="uploadBTN" raised :color="setting.app_color_accent" dark @click="PassportUpload()">Passport Copy</v-btn>
                          <input
                          type="file"
                          name="passport"
                          ref="PassportBTN"
                          style="display:none;"
                          @change="onPassportPicked()"
                          >
                          <span v-if="PassportCopy">{{ PassportFile.name }}</span>
                          <span v-else>No File Chosen</span>
                      </v-flex>
                          </v-layout>
                  <v-layout row wrap>
                      <v-flex>
                                                    <v-btn class="uploadBTN" raised :color="setting.app_color_accent" dark @click="EducationUpload()">Educational Certificates</v-btn>
                          <input
                          type="file"
                          name="education"
                          ref="EducationBTN"
                          style="display:none;"
                          @change="onEducationPicked()"
                          >
                          <span v-if="Education">{{ EducationFile.name }}</span>
                          <span v-else>No File Chosen</span>
                      </v-flex>
                          </v-layout>
                  <v-layout row wrap>
                      <v-flex>
                                                    <v-btn class="uploadBTN" raised :color="setting.app_color_accent" dark @click="OtherUpload()">Other Document</v-btn>
                          <input
                          type="file"
                          name="other"
                          ref="OtherBTN"
                          style="display:none;"
                          @change="onOtherPicked()"
                          >
                          <span v-if="Other">{{ OtherFile.name }}</span>
                          <span v-else>No File Chosen</span>
                      </v-flex>
                          </v-layout>
                      </v-flex>
                      <v-flex md4>
                          <v-layout>
                                                                          <v-flex class="ma-0">

      <v-card>
                                                            <v-toolbar :color="setting.app_color_accent" dark height="50">

          <v-toolbar-title>Documents</v-toolbar-title>

        </v-toolbar>

<v-list>
    <template v-for="(item, index) in documents">
        <v-divider
              v-if="item.divider"
              :key="index"
            ></v-divider>
            <v-list-tile
              v-else
              :key="item.name"
            >
                <v-list-tile-action>
                    <v-icon v-if="item.model" color="green">fas fa-check</v-icon>
                    <v-icon v-else color="red">fas fa-times</v-icon>
                </v-list-tile-action>
                 <v-list-tile-content>
                <v-list-tile-title>
                    {{ item.name }}
                </v-list-tile-title>
              </v-list-tile-content>
            </v-list-tile>
    </template>
</v-list>


      </v-card>

                      </v-flex>
                          </v-layout>
                      </v-flex>
                  </v-layout>
              </v-container>
          </v-form>
      </v-card>
      <v-btn @click="e6 = 4; updateContract()" :color="setting.app_color_accent" dark>Continue</v-btn>
      <v-btn flat @click="e6 = 2">back</v-btn>
    </v-stepper-content>


    <v-stepper-content step="4">
      <v-card class="mb-5" flat>
          <v-container>
              <v-layout row wrap>
                  <v-flex md4>
                        <v-avatar
                          tile
                          size="150"
                          class="profilePic"
                          >
                         <img v-if="imageUrl" :src="imageUrl" alt="ProfilePicture">
                          </v-avatar>
                  </v-flex>
                  <v-flex md8>
                      <v-layout row wrap class="ma-4">
                          <v-flex>
                              <h4>First Name:
                                  <span>{{ Fname || '-' }}</span>
                              </h4>
                          </v-flex>
                      </v-layout>
                      <v-layout row wrap class="ma-4">
                          <v-flex>
                              <h4>Last Name:
                                  <span>{{ Lname || '-' }}</span>
                              </h4>
                          </v-flex>
                      </v-layout>
                  </v-flex>
              </v-layout>
              <v-layout row wrap class="ma-4">
                  <v-flex md4>
                      <h5>Email:
                          <span>{{ email || '-' }}</span>
                      </h5>
                  </v-flex>
                  <v-flex md4>
                      <h5>Date of Birth:
                        <span>{{ dob || '-' }}</span>
                      </h5>
                  </v-flex>
                  <v-flex md4>
                      <h5>Gender:
                        <span>{{ genders || '-' }}</span>
                      </h5>
                  </v-flex>
              </v-layout>
              <v-layout row wrap class="ma-4">
                  <v-flex md4>
                      <h5>Place of Birth:
                          <span>{{ pob || '-' }}</span>
                      </h5>
                  </v-flex>
                  <v-flex md4>
                      <h5>Nationality:
                        <span>{{ nationality || '-' }}</span>
                      </h5>
                  </v-flex>
                  <v-flex md4>
                      <h5>Religion:
                        <span>{{ religion || '-' }}</span>
                      </h5>
                  </v-flex>
              </v-layout>
              <v-layout row wrap class="ma-4">
                  <v-flex md4>
                      <h5>Marital Status:
                          <span>{{ marital || '-' }}</span>
                      </h5>
                  </v-flex>
                  <v-flex md4>
                      <h5>Spouse Name:
                        <span>{{ spouseName || '-' }}</span>
                      </h5>
                  </v-flex>
                  <v-flex md4>
                      <h5>ID Number:
                        <span>{{ ID_no || '-' }}</span>
                      </h5>
                  </v-flex>
              </v-layout>
              <v-layout row wrap class="ma-4">
                  <v-flex md4>
                      <h5>ID Expiry Date:
                          <span>{{ idExpiry || '-' }}</span>
                      </h5>
                  </v-flex>
                  <v-flex md4>
                      <h5>VISA Number:
                        <span>{{ visaNo || '-' }}</span>
                      </h5>
                  </v-flex>
                  <v-flex md4>
                    <h5>VISA Expiry Date:
                        <span>{{ visaExpiry || '-' }}</span>
                      </h5>
                  </v-flex>
              </v-layout>
              <v-layout row wrap class="ma-4">
                  <v-flex md4>
                      <h5>Passport Number:
                          <span>{{ passportNo || '-' }}</span>
                      </h5>
                  </v-flex>
                  <v-flex md4>
                      <h5>Passport Date of Issue:
                        <span>{{ passportIssue || '-' }}</span>
                      </h5>
                  </v-flex>
                  <v-flex md4>
                    <h5>Passport Expiry Date:
                        <span>{{ passportExpiry || '-' }}</span>
                      </h5>
                  </v-flex>
              </v-layout>
              <v-layout row wrap class="ma-4">
                  <v-flex md4>
                      <h5>Passport Place of Issue:
                          <span>{{ passportPOI || '-' }}</span>
                      </h5>
                  </v-flex>
                  <v-flex md4>
                      <h5>Country of Residence:
                        <span>{{ residence || '-' }}</span>
                      </h5>
                  </v-flex>
                  <v-flex md4>
                    <h5>Mobile Number:
                        <span>{{ mobNo || '-' }}</span>
                      </h5>
                  </v-flex>
              </v-layout>
              <v-layout row wrap class="ma-4">
                  <v-flex md4>
                      <h5>Secondary Number:
                          <span>{{ secNo || '-' }}</span>
                      </h5>
                  </v-flex>
                  <v-flex md8>
                      <h5>Telephone Number:
                        <span>{{ telNo || '-' }}</span>
                      </h5>
                  </v-flex>

              </v-layout>
              <v-layout row wrap class="text-xs-center ma-4">
                  <v-flex>
                      <h5>Address:
                        <span class="pre-formatted">{{ address || '-' }}</span>
                      </h5>
                  </v-flex>
              </v-layout>
                            <v-layout row wrap class="ma-4">
                  <v-flex md4>
                      <h5>Contract:
                          <span>{{ contract.name || '-' }}</span>
                      </h5>
                  </v-flex>
                  <v-flex md4>
                      <h5>Salary:
                        <span>{{ salary || '-' }}</span>
                      </h5>
                  </v-flex>
                  <v-flex md4>
                    <h5>Contract Date:
                        <span>{{ contractDate || '-' }}</span>
                      </h5>
                  </v-flex>
              </v-layout>
                            <v-layout row wrap class="ma-4">
                  <v-flex md4>
                      <h5>Date of Joining:
                          <span>{{ doj || '-' }}</span>
                      </h5>
                  </v-flex>
                  <v-flex md4>
                      <h5>Job Role:
                        <span>{{ jobRole || '-' }}</span>
                      </h5>
                  </v-flex>
                  <v-flex md4>
                    <h5>Department:
                        <span>{{ department.name || '-' }}</span>
                      </h5>
                  </v-flex>
              </v-layout>
          </v-container>
      </v-card>
      <v-btn @click="submitEmployee()" :color="setting.app_color_accent" dark>Create Contract</v-btn>
      <v-btn @click="viewContract()" :color="setting.app_color_accent" dark outline>View Generated Contract</v-btn>
      <v-btn flat @click="e6 = 3">back</v-btn>
    </v-stepper-content>
      </v-stepper-items>

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
            <div class="pre-formatted" v-html="templateUpdated">

<!-- <editor
v-model="contract.temp"
:init="config"
api-key="8vg7aylhgr5nwcnq7fzajhqcfehqvrzyaog4226rl7mymtd1"
></editor> -->


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
  </v-stepper>

  </v-container>
</template>

<script>
import Editor from '@tinymce/tinymce-vue';
  export default {
            components: {
    'editor': Editor
  },
    data() {
      return {
        e6: 1,
        // e6: 2,
        Fname: '',
        Lname: '',
        jobRole: '',
        nationality: '',
        ID_no: '',
        visaNo: '',
        passportNo: '',
        passportPOI: '',
        departmentSelect: null,
        department: [
            {
                name: '',
                id: ''
            }
        ],
        idExpiry: null,
        visaExpiry: null,
        passportIssue: null,
        passportExpiry: null,
         dob: null,
         pob: '',
         email: '',
         genders: null,
         religion: '',
         spouseName: '',
         address: '',
         contractSelect: null,
         contract: [
             {
                 name: null,
                 id: null,
                 temp: null,
             }
         ],
         salary: '',
      marital: '',
      menu: false,
      menu2: false,
      menu3: false,
      menu4: false,
      menu5: false,
      menu6: false,
      menu7: false,
      gender: ['Male' , 'Female'],
      maritals: ['Single' , 'Married', 'Separated', 'Widowed', 'Divorced'],
      countries: [],
      mobNo: '',
      secNo: '',
      telNo: '',
      doj: '',
      contractDate: '',
      countryCode: null,
      currency: null,
      residence: '',
      countryDB: null,
      imageUrl: '',
      profilePic: null,
      Resume: '',
      ResumeFile: null,
      ID: '',
      IDFile: null,
      PassportCopy: '',
      PassportFile: null,
      Education: '',
      EducationFile: null,
      Other: '',
      OtherFile: null,
      viewTemplateDialog: false,
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
      documents: [
          {
              name: 'Profile Picture',
              model: false
          },
          { divider: true},
          {
              name: 'Resume',
              model: false
          },
          { divider: true},
          {
              name: 'ID Copy',
              model: false
          },
          { divider: true},
          {
              name: 'Passport Copy',
              model: false
          },
          { divider: true},
          {
              name: 'Educational Certificates',
              model: false
          },
          { divider: true},
          {
              name: 'Others',
              model: false
          },
      ],
      templateUpdated: '',
      empID: '',
      valid: true,
      valid2: true,
      FnameRules: [
        v => !!v || 'First Name is required'
      ],
      LnameRules: [
        v => !!v || 'Last Name is required'
      ],
      IDRules: [
        v => !!v || 'ID Number is required'
      ],
      ContractRules: [
        v => !!v || 'Contract is required'
      ],
      EmpIDRules: [
        v => !!v || 'Employee ID is required'
      ],
      ResumeName: '',
      IDName: '',
      PassportName: '',
      EducationName: '',
      otherName: ''
      }
    },
    created(){
        this.$store.dispatch('SetPageTitle',  'Create New Contract')
        this.getCountriesList()
        this.$store.dispatch('SetTemplates')
        this.$store.dispatch('setDepartments')
    },
        computed:{
              settings(){
            return this.$store.getters.settings
        },
              contractTemplates(){

            return this.$store.getters.templates
        },
              departmentsList(){
                //   let dep = this.$store.getters.departments
                //   let deps = []
                //   dep.forEach(item => {
                //       deps.push(item.name)
                //   })
            // return deps
            return this.$store.getters.departments
        },
        fullName(){
            if(!this.Fname && !this.Lname){
                return null
            }
            else{
                return this.Fname+' '+this.Lname
            }
        },
                        viewTemplates(){
            return this.$store.getters.viewTemplates
        },
        },
        watch:{
            Other: function(val){
                if(val){
                 this.documents[10].model = true
                }
                else{
                 this.documents[10].model = false
                }
            },
            Education: function(val){
                if(val){
                 this.documents[8].model = true
                }
                else{
                 this.documents[8].model = false
                }
            },
            PassportCopy: function(val){
                if(val){
                 this.documents[6].model = true
                }
                else{
                 this.documents[6].model = false
                }
            },
            ID: function(val){
                if(val){
                 this.documents[4].model = true
                }
                else{
                 this.documents[4].model = false
                }
            },
            Resume: function(val){
                if(val){
                 this.documents[2].model = true
                }
                else{
                 this.documents[2].model = false
                }
            },
            profilePic: function(val){
                if(val){
                 this.documents[0].model = true
                }
                else{
                 this.documents[0].model = false
                }
            },
            residence: function(){
                if(this.residence){

                    const cdb = this.countryDB
                    cdb.forEach(item => {
                        if(item.name == this.residence){
                            item.callingCodes.forEach(cc =>{
                                this.countryCode = '+'+cc
                            })
                            item.currencies.forEach(cur =>{
                                this.currency = cur
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
             submitEmployee(){
                 this.$store.dispatch('saveEmployee',
                 {
                     EmpID: this.empID,
                     Fname: this.Fname,
                     Lname: this.Lname,
                     email: this.email,
                     dob: this.dob,
                     gender: this.genders,
                     pob: this.pob,
                     nationality: this.nationality,
                     religion: this.religion,
                     marital: this.marital,
                     spouseName: this.spouseName,
                     ID_no: this.ID_no,
                     idExpiry: this.idExpiry,
                     visaNo: this.visaNo,
                     visaExpiry: this.visaExpiry,
                     passportNo: this.passportNo,
                     passportIssue: this.passportIssue,
                     passportExpiry: this.passportExpiry,
                     passportPOI: this.passportPOI,
                     residence: this.residence,
                     mobNo: this.mobNo,
                     secNo: this.secNo,
                     telNo: this.telNo,
                     address: this.address,
                     template_id: this.contract.id,
                     salary: this.salary,
                     contractDate: this.contractDate,
                     doj: this.doj,
                     JobTitle: this.jobRole,
                     department_id: this.department.id,
                     profilePic: this.imageUrl,
                     Resume: this.Resume,
                     ResumeFile: this.ResumeName,
                     IDCopy: this.ID,
                     IDFile: this.IDName,
                     PassportCopy: this.PassportCopy,
                     PassportFile: this.PassportName,
                     EduCertificate: this.Education,
                     EducationFile: this.EducationName,
                     OtherDocs: this.Other,
                     OtherFile: this.otherName
                 })
                 .then(res => {
                     this.$router.push({name: 'AdminEmployees'})
                    this.$store.dispatch('setSnackBar', 'Template Successfully Added')
                 })
             },
             departmentSelection(){
                 this.department = this.departmentSelect
             },
             contractSelection(){
                 this.contract = this.contractSelect
             },
             validate1(){
                 if (this.$refs.form1[0].validate()){
                 this.e6 = 2
                 }
             },
             validate2(){
                 if (this.$refs.form2[0].validate()){
                 this.e6 = 3
                 }
             },
             updateContract(){
                                 let title
                 if(this.genders == 'Male'){
                     title = 'Mr.'
                 }
                 else if(this.genders == 'Female'){
                     if(this.marital == 'Married'){
                         title='Mrs.'
                     }
                     else{
                         title='Ms.'
                     }
                 }
                 let template = this.contract.temp

                 template = template.replace('$contractDate', this.contractDate)

                 template = template.replace('$fullName', this.fullName)

                 template = template.replace('$Title', title)

                 template = template.replace('$passportNo', this.passportNo)

                 template = template.replace('$nationality', this.nationality)

                 template = template.replace('$joiningDate', this.doj)

                 template = template.replace('$jobRole', this.jobRole)

                 template = template.replace('$salary', this.salary)

                 this.templateUpdated = template
             },
             viewContract(){
                 this.viewTemplateDialog = true
             },
            OtherUpload(){
                this.$refs.OtherBTN[0].click()
            },

            onOtherPicked(){
                const files = this.$refs.OtherBTN[0].files
                let filename = files[0].name
                if(filename.lastIndexOf('.') <= 0){
                    return alert('please add a valid file!')
                }
                const fileReader = new FileReader()
                fileReader.addEventListener('load', () => {
                    this.Other = fileReader.result
                })
                fileReader.readAsDataURL(files[0])
                this.OtherFile = files[0]
                this.otherName = filename
            },

            EducationUpload(){
                this.$refs.EducationBTN[0].click()
            },

            onEducationPicked(){
                const files = this.$refs.EducationBTN[0].files
                let filename = files[0].name
                if(filename.lastIndexOf('.') <= 0){
                    return alert('please add a valid file!')
                }
                const fileReader = new FileReader()
                fileReader.addEventListener('load', () => {
                    this.Education = fileReader.result
                })
                fileReader.readAsDataURL(files[0])
                this.EducationFile = files[0]
                this.EducationName = filename
            },

            IDUpload(){
                this.$refs.IDBTN[0].click()
            },

            onIDPicked(){
                const files = this.$refs.IDBTN[0].files
                let filename = files[0].name
                if(filename.lastIndexOf('.') <= 0){
                    return alert('please add a valid file!')
                }
                const fileReader = new FileReader()
                fileReader.addEventListener('load', () => {
                    this.ID = fileReader.result
                })
                fileReader.readAsDataURL(files[0])
                this.IDFile = files[0]
                this.IDName = filename
            },

            PassportUpload(){
                this.$refs.PassportBTN[0].click()
            },

            onPassportPicked(){
                const files = this.$refs.PassportBTN[0].files
                let filename = files[0].name
                if(filename.lastIndexOf('.') <= 0){
                    return alert('please add a valid file!')
                }
                const fileReader = new FileReader()
                fileReader.addEventListener('load', () => {
                    this.PassportCopy = fileReader.result
                })
                fileReader.readAsDataURL(files[0])
                this.PassportFile = files[0]
                this.PassportName = filename
            },

            profilePicUpload(){
              this.$refs.profilePicBTN[0].click()
            //   btn.forEach(item =>{
            //       item.click()
            //   })

            },

            ResumeUpload(){
                this.$refs.resumeBTN[0].click()
            },

            onResumePicked(){
   const files = this.$refs.resumeBTN[0].files
                let filename = files[0].name
                if(filename.lastIndexOf('.') <= 0){
                    return alert('please add a valid file!')
                }
                const fileReader = new FileReader()
                fileReader.addEventListener('load', () => {
                    this.Resume = fileReader.result
                })
                fileReader.readAsDataURL(files[0])
                this.ResumeFile = files[0]
                this.ResumeName = filename

            },

            onPicPicked(){
                // console.log(this.$refs.profilePicBTN[0].files)
                const files = this.$refs.profilePicBTN[0].files
                let filename = files[0].name
                if(filename.lastIndexOf('.') <= 0){
                    return alert('please add a valid file!')
                }
                const fileReader = new FileReader()
                fileReader.addEventListener('load', () => {
                    this.imageUrl = fileReader.result
                })
                fileReader.readAsDataURL(files[0])
                this.profilePic = files[0]

            },

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


<style scoped>
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
.uploadBTN{
    width: 220px;
        margin-bottom: 0.5em;
    margin-top: 1em;
    transition: 0.5s border-radius;
}

.uploadBTN:hover{
        border-radius: 30px;
}

.pre-formatted {
  white-space: pre-wrap;
}

</style>
