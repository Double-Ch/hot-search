import { createApp } from 'vue';
import App from './App.vue';
import './assets/index.css';
import axios from 'axios';

// 配置 axios 基础路径
axios.defaults.baseURL = 'http://127.0.0.1:9782';

const app = createApp(App);

// 注入 axios
app.config.globalProperties.$axios = axios;

app.mount('#app');