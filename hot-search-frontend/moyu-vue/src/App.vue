<template>
  <div class="home">
    <header>
      <div class="container">
        <div class="nav">
          <div class="logo">
            <a href="#" style="text-decoration: none; display: flex; align-items: center;">
              <i class="fas fa-fish" style="font-size: 24px; color: #3498db; margin-right: 5px"></i>
              <h1>职场小站</h1>
            </a>
          </div>

          <!-- 天气显示 -->
          <a :href="weatherLink" target="_blank" class="weather-link">
            <span id="weather-city">{{ weather.city }}</span>
            <span id="weather-icon">{{ weather.icon }}</span>
            <span id="weather-condition">{{ weather.condition }}</span>
            <span id="weather-temp">{{ weather.temperature }}℃</span>
          </a>

          <div class="date-time">
            <span id="beijing-time"></span>
            <span id="week-day"></span>
            <!-- 修改为切换主题按钮 -->
            <button class="theme-toggle" @click="toggleTheme">
              <div id="theme-icon">🌞</div>
            </button>
          </div>

        </div>
      </div>
    </header>

    <div class="container">
      <div class="main-content">
        <div class="card" v-for="(platform, index) in platforms" :key="index">
          <div class="card-header">
            <div class="card-icon" :class="platform.logoClass"></div>
            <h3 class="card-title">{{ platform.name }}</h3>
          </div>
          <div class="card-body">
            <div v-if="platform.isLoading" class="loading">
              数据加载中...
            </div>
            <div v-else-if="platform.error" class="error">
              数据加载失败，请刷新重试。
            </div>
            <div v-else>
              <div class="list-item" v-for="(item, itemIndex) in platform.hotList" :key="itemIndex">
    <span class="rank" :class="{
        'top1': item.hotRank === 1,
        'top2': item.hotRank === 2,
        'top3': item.hotRank === 3
    }">{{ item.hotRank }}</span>
                <a :href="item.hotUrl" target="_blank" class="item-title" :title="item.hotTitle">
                  {{ item.hotTitle.length > 30 ? item.hotTitle.substring(0, 30) + '...' : item.hotTitle }}
                </a>
                <span class="score">{{ formatHotValue(item.hotValue) }}</span>
              </div>
            </div>
          </div>
        </div>


      </div>

      <div class="feature-section">
        <h2 class="section-title">必备功能</h2>
        <div class="features">
          <div class="feature-card">
            <h3 class="feature-title">生活服务</h3>
            <p class="feature-content">提供生活相关的各种实用服务和兴趣交流平台，满足你的日常生活需求和兴趣爱好</p>
            <div class="feature-grid">
              <a :href="item.url" target="_blank" class="feature-item" v-for="(item, index) in lifeTips" :key="index">
                <div>
                  <div class="feature-icon">
                    <img :src="item.icon">
                    <h4>{{ item.title }}</h4>
                  </div>
                  <div class="feature-info">
                    <p>{{ item.description }}</p>
                  </div>
                </div>
              </a>
            </div>
          </div>

          <div class="feature-card">
            <h3 class="feature-title">科技快讯</h3>
            <p class="feature-content">汇聚最新的科技动态、创新资讯和行业趋势，助你掌握科技前沿</p>
            <div class="feature-grid">
              <a :href="item.url" target="_blank" class="feature-item" v-for="(item, index) in Sciences" :key="index">
                <div>
                  <div class="feature-icon">
                    <img :src="item.icon">
                    <h4>{{ item.title }}</h4>
                  </div>
                  <div class="feature-info">
                    <p>{{ item.description }}</p>
                  </div>
                </div>
              </a>
            </div>
          </div>

          <div class="feature-card">
            <h3 class="feature-title">放松时刻</h3>
            <p class="feature-content">提供丰富的娱乐资源和放松方式，帮助你在闲暇时光放松身心，享受生活</p>
            <div class="feature-grid">
              <a :href="item.url" target="_blank" class="feature-item" v-for="(item, index) in relaxList" :key="index">
                <div>
                  <div class="feature-icon">
                    <img :src="item.icon">
                    <h4>{{ item.title }}</h4>
                  </div>
                  <div class="feature-info">
                    <p>{{ item.description }}</p>
                  </div>
                </div>
              </a>
            </div>
          </div>

          <div class="feature-card">
            <h3 class="feature-title">实用工具</h3>
            <p class="feature-content">集合多种实用工具，提升工作与生活的效率，让日常任务更加便捷</p>
            <div class="feature-grid">
              <a :href="item.url" target="_blank" class="feature-item" v-for="(item, index) in utils" :key="index">
                <div>
                  <div class="feature-icon">
                    <img :src="item.icon">
                    <h4>{{ item.title }}</h4>
                  </div>
                  <div class="feature-info">
                    <p>{{ item.description }}</p>
                  </div>
                </div>
              </a>
            </div>
          </div>
        </div>
      </div>

      <div class="countdown-container">
        <div style="display: flex; justify-content: space-between; align-items: center;">
          <h3 class="countdown-title">下班倒计时</h3>
          <div style="display: flex; align-items: center;">
            <input type="time" class="time-input" id="offTime" value="18:00" style="margin-right: 10px;">
            <button @click="setOffTime">设置下班时间</button>
          </div>
        </div>
        <div style="display: flex; justify-content: center; align-items: center; margin-top: 20px;">
          <div class="countdown-item">
            <div class="countdown-value" id="hours">0</div>
            <div class="countdown-label">小时</div>
          </div>
          <div class="countdown-item">
            <div class="countdown-value" id="minutes">0</div>
            <div class="countdown-label">分钟</div>
          </div>
          <div class="countdown-item">
            <div class="countdown-value" id="seconds">0</div>
            <div class="countdown-label">秒</div>
          </div>
        </div>
      </div>
    </div>

    <footer>
      <div class="footer-content">
<!--        <div class="footer-links">-->
<!--          <a href="#" class="footer-link">关于我们</a>-->
<!--          <a href="#" class="footer-link">使用条款</a>-->
<!--          <a href="#" class="footer-link">隐私政策</a>-->
<!--          <a href="#" class="footer-link">联系我们</a>-->
<!--        </div>-->
        <p class="footer-text">© 2025 职场小站 - 打工人的小确幸 <a href="http://beian.miit.gov.cn/" target="_blank" style="text-decoration: none" class="footer-text"> 蜀ICP备2025131520号 </a> </p>
      </div>
    </footer>
  </div>
</template>

<script>
import {ref, onMounted} from 'vue';
import {useLifeTips} from './composables/useLifeTips.js'
import {useRelaxList} from './composables/useRelax.js'
import {useUtils} from './composables/useUtils.js'
import {useSciences} from './composables/useSciences.js'
import {useHotList} from './composables/useHotList';
import {useTheme} from './composables/useTheme.js';
import {useWeather} from './composables/useWeather.js';

export default {
  setup() {
    const {utils} = useUtils();
    const {lifeTips} = useLifeTips();
    const {platforms} = useHotList();
    const {relaxList} = useRelaxList();
    const {Sciences} = useSciences();
    const {themeIcon, toggleTheme} = useTheme();
    const {weather, weatherLink} = useWeather();

    const hours = ref(0);
    const minutes = ref(0);
    const seconds = ref(0);
    let offTime = ref(new Date());

    // 设置下班时间
    const setOffTime = () => {
      const timeInput = document.getElementById('offTime').value;
      const [hoursInput, minutesInput] = timeInput.split(':').map(Number);
      const now = new Date();
      offTime.value = new Date(now);
      offTime.value.setHours(hoursInput, minutesInput, 0, 0);
      if (offTime.value <= now) {
        offTime.value.setDate(offTime.value.getDate() + 1);
      }
      // 保存到本地存储
      localStorage.setItem('offTime', offTime.value.toISOString());
      // 更新输入框的值
      document.getElementById('offTime').value = timeInput;
      updateCountdown();
    };

    // 更新倒计时
    const updateCountdown = () => {
      const now = new Date();
      const workEndTime = offTime.value;
      if (now > workEndTime) {
        offTime.value.setDate(offTime.value.getDate() + 1);
      }
      const timeDifference = workEndTime - now;

      hours.value = Math.floor(timeDifference / (1000 * 60 * 60));
      minutes.value = Math.floor((timeDifference % (1000 * 60 * 60)) / (1000 * 60));
      seconds.value = Math.floor((timeDifference % (1000 * 60)) / 1000);

      document.getElementById('hours').textContent = hours.value.toString().padStart(2, '0');
      document.getElementById('minutes').textContent = minutes.value.toString().padStart(2, '0');
      document.getElementById('seconds').textContent = seconds.value.toString().padStart(2, '0');
    };

    // 格式化热榜值
    const formatHotValue = (value) => {
      if (value > 10000) {
        return (value / 10000).toFixed(1) + '万';
      }
      return value;
    };

    // 更新导航栏时间、星期显示
    const updateTime = () => {
      const now = new Date();
      const beijingTime = now.toLocaleString('zh-CN', {timeZone: 'Asia/Shanghai'});
      document.getElementById('beijing-time').textContent = `${beijingTime}`;

      const weekDay = now.toLocaleString('zh-CN', {weekday: 'long'});
      document.getElementById('week-day').textContent = `${weekDay}`;
    };

    // 在组件挂载后执行
    onMounted(() => {
          updateTime();

          // 从本地存储加载下班时间
          const savedOffTime = localStorage.getItem('offTime');
          if (savedOffTime) {
            offTime.value = new Date(savedOffTime);
            // 更新输入框的值
            const hours = offTime.value.getHours();
            const minutes = offTime.value.getMinutes();
            document.getElementById('offTime').value = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}`;
          } else {
            // 默认下班时间为18:00
            const now = new Date();
            offTime.value = new Date(now);
            offTime.value.setHours(18, 0, 0, 0);
            if (offTime.value <= now) {
              offTime.value.setDate(offTime.value.getDate() + 1);
            }
            // 更新输入框的值
            document.getElementById('offTime').value = '18:00';
          }

          updateCountdown();

          setInterval(updateTime, 1000);
          setInterval(updateCountdown, 1000);
        }
    )
    ;

    return {
      platforms,
      lifeTips,
      toggleTheme,
      themeIcon,
      hours,
      minutes,
      seconds,
      formatHotValue,
      setOffTime,
      weather,
      weatherLink,
      relaxList,
      Sciences,
      utils,
    };
  }
}
;
</script>