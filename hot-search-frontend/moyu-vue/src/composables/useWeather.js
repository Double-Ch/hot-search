import { ref, onMounted } from 'vue';
import axios from 'axios';

export function useWeather() {
  const weather = ref({
    city: '正在获取...',
    icon: '🌤️',
    condition: '未知',
    temperature: '--'
  });
  const weatherLink = ref('#');
  const isLoading = ref(true);
  const error = ref(null);

  // 获取用户地理位置
  const getUserLocation = () => {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(
        position => {
          const latitude = position.coords.latitude;
          const longitude = position.coords.longitude;
          console.log('获取地理位置成功：', latitude, longitude);
          getWeatherByAdcode(latitude, longitude);
        },
        error => {
          console.error('获取地理位置失败', error);
          error.value = '无法获取位置信息，请确保已授权位置访问权限';
          isLoading.value = false;
          // 不再使用默认位置，直接显示错误信息
          weather.value = {
            city: '获取位置失败',
            icon: '⚠️',
            condition: '请授权位置访问',
            temperature: '--'
          };
        },
        {
          timeout: 10000, // 10秒超时
          maximumAge: 60000, // 缓存1分钟
          enableHighAccuracy: true
        }
      );
    } else {
      console.error('浏览器不支持地理位置获取');
      error.value = '您的浏览器不支持地理位置获取';
      isLoading.value = false;
      // 不再使用默认位置，直接显示错误信息
      weather.value = {
        city: '获取位置失败',
        icon: '⚠️',
        condition: '浏览器不支持',
        temperature: '--'
      };
    }
  };

  // 根据经纬度获取天气
  const getWeatherByAdcode = (latitude, longitude) => {
    isLoading.value = true;
    error.value = null;
    
    axios.get('/Weather/getWeather', {
      params: {
        latitude: latitude,
        longitude: longitude
      },
      timeout: 5000 // 5秒超时
    })
    .then(response => {
      console.log('天气数据：', response);
      if (response.data && response.data.data) {
        const weatherData = response.data.data;
        updateWeatherDisplay(weatherData);
      } else {
        throw new Error('天气数据格式错误');
      }
    })
    .catch(err => {
      console.error('获取天气失败', err);
      error.value = '获取天气信息失败，请稍后重试';
      // 设置默认天气数据
      weather.value = {
        city: '北京',
        icon: '🌤️',
        condition: '未知',
        temperature: '--'
      };
    })
    .finally(() => {
      isLoading.value = false;
    });
  };

  const updateWeatherDisplay = (weatherData) => {
    weather.value.city = weatherData.city || '未知城市';
    weather.value.icon = getWeatherIcon(weatherData.weather);
    weather.value.condition = weatherData.weather || '未知';
    weather.value.temperature = weatherData.temperature || '--';

    if (weatherData.province && weatherData.city) {
      weatherLink.value = `https://tianqi.qq.com/?province=${encodeURIComponent(weatherData.province)}&city=${encodeURIComponent(weatherData.city)}`;
    }
  };

  const getWeatherIcon = (condition) => {
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
      'default': '🌤️'
    };
    return weatherIcons[condition] || weatherIcons.default;
  };

  onMounted(() => {
    getUserLocation();
  });

  return {
    weather,
    weatherLink,
    isLoading,
    error
  };
}