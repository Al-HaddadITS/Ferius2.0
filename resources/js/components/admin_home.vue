<template>
    <v-app id="keep">
        <admin_navbar></admin_navbar>
        <div class="main_content">
            <app_header :user="user"></app_header>
            <v-content class="page">
                <transition name="router-anim" enter-active-class="animated zoomIn" leave-active-class="animated zoomOut">
            <router-view></router-view>
                </transition>
            </v-content>
            <!-- <app_footer></app_footer> -->
        </div>
    </v-app>
</template>

<script>
export default {
    props: [
        'user'
    ]
}
</script>

<style>
@import "https://cdn.jsdelivr.net/npm/animate.css@3.5.1";

</style>
