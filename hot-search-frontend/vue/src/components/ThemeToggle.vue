<template>
    <button id="theme-toggle" class="theme-toggle" @click="toggleTheme">
      <span id="theme-icon">{{ themeIcon }}</span>
    </button>
  </template>
  
  <script>
  import { useTheme } from '../composables/useTheme';
  
  export default {
    setup() {
      const { themeIcon, toggleTheme } = useTheme();
      
      return {
        themeIcon,
        toggleTheme
      };
    }
  };
  </script>