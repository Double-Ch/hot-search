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
          <a href="#" target="_blank" class="weather-link">
            <span id="weather-city"></span>
            <span id="weather-icon"></span>
            <span id="weather-condition"></span>
            <span id="weather-temp"></span>
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
            <div class="list-item" v-for="(item, itemIndex) in platform.hotList" :key="itemIndex">
              <span class="rank" :class="{
                'top1': item.hotRank === 1,
                'top2': item.hotRank === 2,
                'top3': item.hotRank === 3
              }">{{ item.hotRank }}</span>
              <a :href="item.hotUrl" target="_blank" class="item-title" :title="item.hotTitle">
                {{ item.hotTitle }}
              </a>
              <span class="score">{{ formatHotValue(item.hotValue) }}</span>
            </div>
          </div>
        </div>


      </div>

      <div class="feature-section">
        <h2 class="section-title">摸鱼必备功能</h2>
        <div class="features">
          <div class="feature-card">
            <h3 class="feature-title">生活小技巧</h3>
            <p class="feature-content">分享各种实用的生活小技巧，帮助你在工作之余提高生活质量。</p>
            <div class="feature-image"></div>
          </div>

          <div class="feature-card">
            <h3 class="feature-title">职场趣事</h3>
            <p class="feature-content">分享职场中的有趣经历和故事，增加趣味性和互动性。</p>
            <div class="feature-image"></div>
          </div>

          <div class="feature-card">
            <h3 class="feature-title">放松时刻</h3>
            <p class="feature-content">提供轻松的图片、视频或音乐，帮助你在工作间隙放松心情。</p>
            <div class="feature-image"></div>
          </div>

          <div class="feature-card">
            <h3 class="feature-title">摸鱼工具</h3>
            <p class="feature-content">各种实用的摸鱼小工具，让你的工作时间更加轻松愉快。</p>
            <div class="feature-image"></div>
          </div>
        </div>
      </div>

      <div class="countdown-container">
        <div style="display: flex; justify-content: space-between; align-items: center;">
          <h3 class="countdown-title">下班倒计时</h3>
          <div style="display: flex; align-items: center;">
            <input type="time" class="time-input" id="offTime" value="17:00" style="margin-right: 10px;">
            <button onclick="setOffTime()">设置下班时间</button>
          </div>
        </div>
        <div style="display: flex; justify-content: center; align-items: center; margin-top: 20px;">
          <div class="countdown-item">
            <div class="countdown-value" id="hours">23</div>
            <div class="countdown-label">小时</div>
          </div>
          <div class="countdown-item">
            <div class="countdown-value" id="minutes">03</div>
            <div class="countdown-label">分钟</div>
          </div>
          <div class="countdown-item">
            <div class="countdown-value" id="seconds">10</div>
            <div class="countdown-label">秒</div>
          </div>
        </div>
      </div>
    </div>

    <footer>
      <div class="footer-content">
        <div class="footer-links">
          <a href="#" class="footer-link">关于我们</a>
          <a href="#" class="footer-link">使用条款</a>
          <a href="#" class="footer-link">隐私政策</a>
          <a href="#" class="footer-link">联系我们</a>
        </div>
        <p class="footer-text">© 2025 摸鱼驿站 - 打工人的小确幸</p>
      </div>
    </footer>
  </div>
</template>

<script>
import { ref, onMounted } from 'vue';
import axios from 'axios';

export default {
  setup() {
    const platforms = ref([
      { name: '百度热榜', logoClass: 'baidu-logo', hotList: [], type: 'baidu', isLoading: true, error: false },
      { name: '抖音热榜', logoClass: 'douyin-logo', hotList: [], type: 'douyin', isLoading: true, error: false },
      { name: '知乎热榜', logoClass: 'zhihu-logo', hotList: [], type: 'zhihu', isLoading: true, error: false },
      { name: 'B站热榜', logoClass: 'bilibili-logo', hotList: [], type: 'bilibili', isLoading: true, error: false },
      { name: '掘金热榜', logoClass: 'juejin-logo', hotList: [], type: 'juejin', isLoading: true, error: false },
      { name: '腾讯网热榜', logoClass: 'tengxunwang-logo', hotList: [], type: 'tengxunwang', isLoading: true, error: false },
      { name: '贴吧热榜', logoClass: 'tieba-logo', hotList: [], type: 'tieba', isLoading: true, error: false },
      { name: '头条热榜', logoClass: 'toutiao-logo', hotList: [], type: 'toutiao', isLoading: true, error: false }
    ]);

    const themeIcon = ref('🌞');
    const hours = ref(0);
    const minutes = ref(0);
    const seconds = ref(0);
    let offTime = ref(new Date());

    // 设置下班时间
    const setOffTime = () => {
      console.log('设置下班时间')
      const timeInput = document.getElementById('offTime').value;
      const [hours, minutes] = timeInput.split(':').map(Number);
      const now = new Date();
      offTime = new Date(now);
      offTime.setHours(hours, minutes, 0, 0);
      if (offTime <= now) {
        offTime.setDate(offTime.getDate() + 1);
      }
      updateCountdown();
    };

    // 切换主题模式
    const toggleTheme = () => {
      const body = document.body;
      const themeIconElement = document.getElementById('theme-icon');

      if (body.classList.contains('dark-theme')) {
        body.classList.remove('dark-theme');
        themeIconElement.textContent = '🌞'; // 切换到太阳图标
        // 保存主题设置到本地存储
        localStorage.setItem('appTheme', 'light');
      } else {
        body.classList.add('dark-theme');
        themeIconElement.textContent = '🌙'; // 切换到月亮图标
        // 保存主题设置到本地存储
        localStorage.setItem('appTheme', 'dark');
      }
    };

    // 检查本地存储中的主题设置
    const checkLocalStorageTheme = () => {
      const savedTheme = localStorage.getItem('appTheme');
      if (savedTheme === 'dark') {
        document.body.classList.add('dark-theme');
        document.getElementById('theme-icon').textContent = '🌙';
      }
    };

    // 获取热榜数据
    const loadPlatformData = async (platform) => {
      try {
        platform.isLoading = true;
        const response = await axios.get(`http://117.72.117.19:9782/hotSearch/queryByType/${platform.type}`);
        platform.hotList = response.data.data;
        platform.isLoading = false;
        platform.error = false;
        console.log(`${platform.name} 数据:`, response.data.data);
      } catch (error) {
        platform.isLoading = false;
        platform.error = true;
        console.error(`获取${platform.name}数据失败`, error);
      }
    };

    // 初始化
    const init = () => {
      platforms.value.forEach(platform => {
        loadPlatformData(platform);
      });
    };

    // 格式化热榜值
    const formatHotValue = (value) => {
      if (value > 10000) {
        return (value / 10000).toFixed(1) + '万';
      }
      return value;
    };

    // 更新时间
    const updateTime = () => {
      const now = new Date();
      const beijingTime = now.toLocaleString('zh-CN', { timeZone: 'Asia/Shanghai' });
      document.getElementById('beijing-time').textContent = `${beijingTime}`;

      const weekDay = now.toLocaleString('zh-CN', { weekday: 'long' });
      document.getElementById('week-day').textContent = `${weekDay}`;
    };

    // 更新倒计时
    const updateCountdown = () => {
      const now = new Date();
      const year = now.getFullYear();
      const month = now.getMonth();
      const date = now.getDate();

      let workEndTime = new Date(year, month, date, 18, 30, 0);

      if (now > workEndTime) {
        workEndTime = new Date(year, month, date + 1, 18, 30, 0);
      }

      const timeDifference = workEndTime - now;

      hours.value = Math.floor(timeDifference / (1000 * 60 * 60));
      minutes.value = Math.floor((timeDifference % (1000 * 60 * 60)) / (1000 * 60));
      seconds.value = Math.floor((timeDifference % (1000 * 60)) / 1000);

      document.getElementById('hours').textContent = hours.value.toString().padStart(2, '0');
      document.getElementById('minutes').textContent = minutes.value.toString().padStart(2, '0');
      document.getElementById('seconds').textContent = seconds.value.toString().padStart(2, '0');
    };

    // 获取用户地理位置
    const getUserLocation = () => {
      if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(
          position => {
            const latitude = position.coords.latitude;
            const longitude = position.coords.longitude;
            console.log('获取地理位置成功：', latitude, longitude)
            // 将经纬度转换为adcode
            getWeatherByAdcode(latitude, longitude);
          },
          error => {
            console.error('获取地理位置失败', error);
          }
        );
      } else {
        console.error('浏览器不支持地理位置获取');
      }
    };

    // 根据经纬度获取天气
    const getWeatherByAdcode = (latitude, longitude) => {
      // 获取adcode
      axios.get('http://117.72.117.19:9782/Weather/getWeather', {
        params: {
          latitude: latitude,
          longitude: longitude
        }
      })
        .then(response => {
          console.log('解析返回：', response)
          const weatherData = response.data.data;
          // 更新天气显示
          updateWeatherDisplay(weatherData);
        })
    };

    // 更新天气显示
    const updateWeatherDisplay = (weatherData) => {
      document.getElementById('weather-city').textContent = weatherData.city;
      document.getElementById('weather-icon').textContent = getWeatherIcon(weatherData.weather);
      document.getElementById('weather-condition').textContent = weatherData.weather;
      document.getElementById('weather-temp').textContent = weatherData.temperature + '℃';

      // 设置跳转链接
      const weatherLink = document.querySelector('.weather-link');
      weatherLink.href = `https://tianqi.qq.com/?province=${encodeURIComponent(weatherData.province)}&city=${encodeURIComponent(weatherData.city)}`;
    };

    // 根据天气获取图标
    const getWeatherIcon = (weather) => {
      const weatherIcons = {
        '晴': '☀️',
        '多云': '⛅',
        '阴': '☁️',
        '小雨': '🌦️',
        '大雨': '🌧️',
        '雪': '❄️',
        '雾': '🌫️',
        '霾': '🌫️',
        '雷阵雨': '⛈️',
        '阵雨': '⛈️',
      };
      return weatherIcons[weather] || ''; // 如果没有匹配的图标，返回空字符串
    };


    // 在组件挂载后执行
    onMounted(() => {
      // 页面加载时检查本地存储的主题设置
      checkLocalStorageTheme();
      init();
      updateTime();

      updateCountdown();
      // 获取用户地理位置并显示天气
      getUserLocation();

      setInterval(updateTime, 1000);
      setInterval(updateCountdown, 1000);
    });

    return {
      platforms,
      toggleTheme,
      themeIcon,
      hours,
      minutes,
      seconds,
      formatHotValue,
      setOffTime,
    };
  }
};
</script>