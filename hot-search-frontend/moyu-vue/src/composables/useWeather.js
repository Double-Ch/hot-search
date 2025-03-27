import { ref, onMounted } from 'vue';
import axios from 'axios';

export function useWeather() {
  const weather = ref({
    city: '',
    icon: '',
    condition: '',
    temperature: ''
  });
  const weatherLink = ref('#');

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

  const updateWeatherDisplay = (weatherData) => {
    weather.value.city = weatherData.city;
    weather.value.icon = getWeatherIcon(weatherData.weather);
    weather.value.condition = weatherData.weather;
    weather.value.temperature = weatherData.temperature;

    weatherLink.value = `https://tianqi.qq.com/?province=${encodeURIComponent(weatherData.province)}&city=${encodeURIComponent(weatherData.city)}`;
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
    };
    return weatherIcons[condition] || ''; // 如果没有匹配的图标，返回空字符串
  };

  onMounted(() => {
    // 获取用户地理位置并显示天气
    getUserLocation();
  });

  return {
    weather,
    weatherLink
  };
}