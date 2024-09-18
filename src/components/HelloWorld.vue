<template>
    <header>
      <img alt="Vue logo" class="logo" src="@/assets/logo.svg" width="125" height="125" />
      
      <button @click="showMessage" class="crazy-button">print</button>
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
  .crazy-button {
    padding: 15px 30px;
    font-size: 18px;
    font-weight: bold;
    text-transform: uppercase;
    letter-spacing: 2px;
    border: none;
    border-radius: 50px;
    color: white;
    cursor: pointer;
    position: relative;
    z-index: 1;
    overflow: hidden;
    background: linear-gradient(45deg, #ff0066, #ffcc00, #00ffcc, #00ccff);
    background-size: 400%;
    transition: all 0.5s ease-in-out;
    box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
    animation: gradientAnimation 5s infinite;
  }
  
  @keyframes gradientAnimation {
    0% {
      background-position: 0% 50%;
    }
    50% {
      background-position: 100% 50%;
    }
    100% {
      background-position: 0% 50%;
    }
  }
  
  /* Effet au survol, sans rotation */
  .crazy-button:hover {
    color: #fff;
    box-shadow: 0 20px 30px rgba(255, 0, 102, 0.5);
    transform: scale(1.1);
    background-size: 200%;
    animation: gradientAnimation 2s infinite;
  }
  
  /* Effet au clic */
  .crazy-button:active {
    transform: scale(0.9);
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.5);
    transition: transform 0.1s;
  }
  </style>
  