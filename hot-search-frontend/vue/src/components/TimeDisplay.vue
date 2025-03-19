<template>
    <div class="time-display">
      <span id="beijing-time">{{ time }}</span>
      <span id="week-day">{{ weekday }}</span>
    </div>
  </template>
  
  <script>
  import { ref, onMounted } from 'vue';
  
  export default {
    setup() {
      const time = ref('');
      const weekday = ref('');
  
      const updateTime = () => {
        const now = new Date();
        time.value = now.toLocaleString('zh-CN', { timeZone: 'Asia/Shanghai' });
        weekday.value = now.toLocaleString('zh-CN', { weekday: 'long' });
      };
  
      onMounted(() => {
        updateTime();
        setInterval(updateTime, 1000);
      });
  
      return {
        time,
        weekday
      };
    }
  };
  </script>