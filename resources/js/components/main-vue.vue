<template>
	<div>

    <v-app id="keep">
        <admin_navbar v-if="loggedIn"></admin_navbar>
        <div class="main_content">
            <app_header v-if="loggedIn"></app_header>
            <v-content class="page">
                <transition name="router-anim" enter-active-class="animated zoomIn" leave-active-class="animated zoomOut">
            <router-view v-if="!userLoading"></router-view>
                </transition>
    <v-layout row justify-center v-for="(setting, i) in settings" v-bind:key="i">
      <v-dialog v-model="userLoading" persistent fullscreen content-class="loading-dialog">
        <v-container fill-height>
          <v-layout row justify-center align-center>
            <v-progress-circular indeterminate :size="70" :width="7" :color="setting.app_color_secondary"></v-progress-circular>
          </v-layout>
        </v-container>
      </v-dialog>
    </v-layout>
            <!-- <v-progress-circular
            v-if="userLoading"
      indeterminate
      color="primary"
    ></v-progress-circular> -->
            </v-content>
            <!-- <app_footer></app_footer> -->
        </div>
    </v-app>

	</div>
</template>

<script>
export default {
	data(){
		return{
            }
	},
    created() {
        this.$store.dispatch('getSettings')
    },
    computed: {
                settings(){
            return this.$store.getters.settings
        },
        loggedIn(){
            return this.$store.getters.loggedIn
        },
        userLoading(){
            return this.$store.getters.userLoading
        }
    },
    watch: {
    },
}
</script>


<style>
.loading-dialog {
   background-color: #303030;
}
</style>
