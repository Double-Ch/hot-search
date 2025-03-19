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

  const getUserLocation = () => {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(
        position => {
          const latitude = position.coords.latitude;
          const longitude = position.coords.longitude;
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

  const getWeatherByAdcode = (latitude, longitude) => {
    axios.get('/Weather/getWeather', {
      params: {
        latitude: latitude,
        longitude: longitude
      }
    })
    .then(response => {
      const weatherData = response.data.data;
      updateWeatherDisplay(weatherData);
    });
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
      '雪': '❄️'
    };
    return weatherIcons[condition] || '';
  };

  onMounted(() => {
    getUserLocation();
  });

  return {
    weather,
    weatherLink
  };
}