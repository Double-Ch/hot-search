<template>
    <header>
      <WeatherDisplay />
      <TimeDisplay />
      <ThemeToggle />
    </header>
  </template>
  
  <script>
  import WeatherDisplay from './WeatherDisplay.vue';
  import TimeDisplay from './TimeDisplay.vue';
  import ThemeToggle from './ThemeToggle.vue';
  
  export default {
    components: {
      WeatherDisplay,
      TimeDisplay,
      ThemeToggle
    }
  };
  </script>