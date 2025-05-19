import { createApp } from 'vue';
import App from './App.vue';
import './assets/index.css';
import axios from 'axios';
import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css'
import * as ElementPlusIconsVue from '@element-plus/icons-vue'

// 配置 axios 基础路径
// axios.defaults.baseURL = 'https://www.hotsearch.fun:9782';
axios.defaults.baseURL = 'https://hotsearch.fun/api';
// axios.defaults.baseURL = 'http://localhost:8089';

const app = createApp(App);

// 注入 axios
app.config.globalProperties.$axios = axios;

app.use(ElementPlus)

// 注册所有图标
for (const [key, component] of Object.entries(ElementPlusIconsVue)) {
  app.component(key, component)
}

app.mount('#app');