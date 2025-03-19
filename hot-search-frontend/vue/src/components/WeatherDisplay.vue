<template>
    <a :href="weatherLink" target="_blank" class="weather-link">
      <div class="weather-display">
        <span id="weather-city">{{ weather.city }}</span>
        <span id="weather-icon">{{ weather.icon }}</span>
        <span id="weather-condition">{{ weather.condition }}</span>
        <span id="weather-temp">{{ weather.temperature }}℃</span>
      </div>
    </a>
  </template>
  
  <script>
  import { ref, onMounted } from 'vue';
  import { useWeather } from '../composables/useWeather';
  
  export default {
    setup() {
      const { weather, weatherLink } = useWeather();
      
      return {
        weather,
        weatherLink
      };
    }
  };
  </script>