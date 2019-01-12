<template>
   <!-- <v-app> -->
     <div class="loginBody">
     <main v-for="(setting, i) in settings" v-bind:key="i">
       <v-container fluid fill-height class="loginOverlay">
          <v-layout flex align-center justify-center>
            <v-flex xs12 sm4 elevation-24>
              <v-toolbar dark :color="setting.app_color_secondary" class="pt-1">
                <v-toolbar-title><h4>{{ setting.app_name }}</h4></v-toolbar-title>
              </v-toolbar>
              <v-card light class="overlayBG">
                      <v-form v-model="valid" ref="form">
                <v-card-text class="pt-4">
                  <div>
                        <v-text-field
                          label="Email"
                          v-model="email"
                          :rules="emailRules"
                          required
                        ></v-text-field>
                        <v-text-field
                          label="Password"
                          v-model="password"
                          min="8"
                          :append-icon="e1 ? 'visibility' : 'visibility_off'"
                          @click:append="() => (e1 = !e1)"
                          :type="e1 ? 'password' : 'text'"
                          :rules="passwordRules"
                          counter
                          required
                        ></v-text-field>
                      <v-checkbox
                      class="ma-0 pa-0"
      label="Remember Me"
      v-model="remember"
      :color="setting.app_color_secondary"
    ></v-checkbox>
                  </div>
                </v-card-text>
                <v-card-actions>
<v-layout justify-space-between>
                            <a href="">Forgot Password</a>
                            <v-btn :disabled="loading" :loading="loading" dark :color="setting.app_color_accent" @click="login" :class=" { 'blue darken-4 white--text' : valid, disabled: !valid }">Login</v-btn>
                        </v-layout>
                </v-card-actions>
                      </v-form>
              </v-card>
            </v-flex>
          </v-layout>
       </v-container>
     </main>
 </div>
   <!-- </v-app> -->

</template>

<script>
export default {
    data () {
          return {
              loading: false,
            valid: false,
            e1: true,
            remember: true,
                email: 'admin@ferius.com',
      password: 'ferius',
            passwordRules: [
              (v) => !!v || 'Password is required',
            ],
            emailRules: [
              (v) => !!v || 'E-mail is required',
              (v) => /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(v) || 'E-mail must be valid'
            ],
          }
        },
            created() {
        this.$store.dispatch('getSettings')
    },
        computed: {
        settings(){
            return this.$store.getters.settings
        },
    },
        methods: {
          login () {
              if (this.$refs.form[0].validate()) {
                  this.loading = true
                  this.$store.dispatch('login', {
                        email: this.email,
                        password: this.password,
                        remember: this.remember,
                  })
                  .then(res => {
                      this.$router.push('/')
                      this.loading = false
                  })
                  .catch(e => {
                      console.log(e);
                      this.loading = false
                  })

            }
          }
        }
}
</script>

<style scoped>
.loginOverlay {
  background:rgba(0,0,0,0.7);
      height: 100vh;
}
.overlayBG{
    background-color: rgba(255,255,255,0.8);
}
label {
    margin-bottom: 0!important;
}
</style>
