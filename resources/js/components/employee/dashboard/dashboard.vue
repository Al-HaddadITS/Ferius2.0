<template>
    <div>
        <v-container fluid>
            <v-layout row wrap>
                <v-flex sm12 md4 lg4 hidden-xs-only>
        <actionCenter></actionCenter>
                </v-flex>
                <v-flex sm12 md8 lg8>
        <centerDash></centerDash>
                </v-flex>
                <!-- <v-flex sm12 md4 lg3 hidden-xs-only>
                </v-flex> -->
            </v-layout>
            <v-layout>
                <v-flex sm12 md4 lg4 hidden-xs-only>
        <dashEvents></dashEvents>
                </v-flex>
                <v-flex sm12 md8 lg8>
                    <myteam></myteam>
                </v-flex>

            </v-layout>
        </v-container>
    </div>
</template>

<script>
export default {
    created(){
        this.$store.dispatch('SetPageTitle', 'Dashboard')
    }
}
</script>
