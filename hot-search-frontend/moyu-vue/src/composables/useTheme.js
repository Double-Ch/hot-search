import { ref, onMounted } from 'vue';

export function useTheme() {
  const themeIcon = ref('🌞');

  // 检查本地存储中的主题设置
  const checkLocalStorageTheme = () => {
    const savedTheme = localStorage.getItem('appTheme');
    if (savedTheme === 'dark') {
      document.body.classList.add('dark-theme');
      document.getElementById('theme-icon').textContent = '🌙';
    }
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

  onMounted(() => {
    // 页面加载时检查本地存储的主题设置
    checkLocalStorageTheme();
  });

  return {
    themeIcon,
    toggleTheme
  };
}