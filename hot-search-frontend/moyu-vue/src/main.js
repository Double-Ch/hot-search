import { createApp } from 'vue';
import App from './App.vue';
import './assets/index.css';
import axios from 'axios';

// 配置 axios 基础路径
// axios.defaults.baseURL = 'https://www.hotsearch.fun:9782';
axios.defaults.baseURL = 'https://hotsearch.fun/api';
// axios.defaults.baseURL = 'http://localhost:8089';

const app = createApp(App);

// 注入 axios
app.config.globalProperties.$axios = axios;

app.mount('#app');