<template>
    <header>
      <img alt="Vue logo" class="logo" src="@/assets/logo.svg" width="125" height="125" />
      
      <button @click="showMessage">Afficher Message</button>
      <h1 v-if="show">Hello World</h1>
    </header>
  </template>
  
  <script>
  export default {
    data() {
      return {
        show: false
      };
    },
    methods: {
      showMessage() {
        this.show = true;
  
        setTimeout(() => {
          this.show = false;
        }, 2000);
      }
    }
  };
  </script>
  
  <style scoped>
  button {
    padding: 10px 20px;
    font-size: 16px;
    cursor: pointer;
  }
  </style>
  